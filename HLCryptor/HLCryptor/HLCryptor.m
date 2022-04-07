//
//  HLCryptor.m
//  HLCryptor
//  
//  Created by JJB_iOS on 2022/4/7.
//

#import "HLCryptor.h"

@implementation HLCryptor

/**
 *  加/解密方法
 *  @param  content 加/解密内容
 *  @param  key     加/解密密钥
 *  @param  iv      偏移量（CBC方式加/解密会用到，ECB传nil）
 *  @param  op      加/解密（kCCEncrypt/kCCDecrypt）
 *  @param  alg     加/解密算法（常用kCCAlgorithmAES/kCCAlgorithmDES）
 */
+ (NSString *)cryptor:(NSString *)content
                  key:(NSString *)key
                   iv:(NSString *)iv
                   op:(CCOperation)op
                  alg:(CCAlgorithm)alg
{
    if (content == nil || [content isEqualToString:@""]) {
        return nil;
    }
    
    if (key == nil || [key isEqualToString:@""]) {
        return nil;
    }
    
    // data
    NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
    if (op == kCCDecrypt) { // 解密
        contentData = [[NSData alloc] initWithBase64EncodedString:content options:NSDataBase64DecodingIgnoreUnknownCharacters];
    }
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    
    // size
    int keySize = kCCKeySizeAES128;
    int blockSize = kCCBlockSizeAES128;
    if (alg == kCCAlgorithmDES) {
        keySize = kCCKeySizeDES;
        blockSize = kCCBlockSizeDES;
    }
    
    // 设置密钥
    uint8_t cKey[keySize];
    bzero(cKey, sizeof(cKey));
    [keyData getBytes:cKey length:keySize];
    
    // 设置iv
    uint8_t cIv[blockSize];
    bzero(cIv, blockSize);
    int option = 0;
    if (iv && (![key isEqualToString:@""])) {   // CBC
        [ivData getBytes:cIv length:blockSize];
        option = kCCOptionPKCS7Padding;
    } else {    // ECB
        option = kCCOptionPKCS7Padding | kCCOptionECBMode;
    }
    
    // 设置输出缓冲区
    size_t bufferSize = [contentData length] + blockSize;
    void *buffer = malloc(bufferSize);
    
    // 开始加密
    size_t encryptedSize = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(op,
                                          alg,
                                          option,
                                          cKey,
                                          keySize,
                                          cIv,
                                          [contentData bytes],
                                          [contentData length],
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:encryptedSize];
        if (op == kCCEncrypt) { // 加密
            return [resultData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        } else {                // 解密
            return [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
        }
        
    } else {
        NSLog(@"[错误] 加/解密失败|状态编码: %d", cryptStatus);
    }
    free(buffer);
    
    return nil;
}

@end
