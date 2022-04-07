//
//  HLCryptor.h
//  HLCryptor
//  对称加/解密工具类
//  Created by JJB_iOS on 2022/4/7.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

NS_ASSUME_NONNULL_BEGIN

@interface HLCryptor : NSObject

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
                  alg:(CCAlgorithm)alg;

@end

NS_ASSUME_NONNULL_END
