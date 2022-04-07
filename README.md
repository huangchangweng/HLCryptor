# HLCryptor
HLCryptor是iOS下AES、DES加解密封装.<p>

##### 支持使用CocoaPods引入, Podfile文件中添加:

```objc
pod 'HLCryptor', '1.0.0'
```
✅1.AES加/解密 <p>
✅2.DES加/解密 <p>
✅3.支持CBC/ECB <p>

基本使用方法:<p>

```
NSString *resultStr = [HLCryptor cryptor:@"加/解密字符串"
                                     key:@"加/解密密钥"
                                      iv:@"加/解密偏移量（传nil使用ECB方式）"
                                      op:kCCEncrypt         // kCCEncrypt、kCCDecrypt
                                     alg:kCCAlgorithmAES];  // kCCAlgorithmAES、kCCAlgorithmDES、其他
NSLog(@"加/解密结果：%@", resultStr);
```

# Requirements

iOS 9.0 +, Xcode 7.0 +

# Version

* 1.0.0 :

  完成HLCryptor基础搭建

# License
HLNetworkManager is available under the MIT license. See the LICENSE file for more info.

