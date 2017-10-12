//
//  YLT_CryptoTools.h
//  YLT_Crypto
//
//  Created by QTEC on 2017/10/12.
//

#import <Foundation/Foundation.h>

@interface YLT_CryptoTools : NSObject

/**
 AES、DES 加密字符串
 
 @param algorithm
     kCCAlgorithmAES     高级加密标准，128位(默认)
     kCCAlgorithmDES     数据加密标准
 @param sourceString 源字串
 @param keyString 密钥
 @param iv 向量(8字节)
 @return 加密后的Base64字串
 */
+ (NSString *)encryptType:(uint32_t)algorithm sourceString:(NSString *)sourceString keyString:(NSString *)keyString iv:(NSData *)iv;

/**
 AES、DES 解密字符串
 
 @param algorithm
     kCCAlgorithmAES     高级加密标准，128位(默认)
     kCCAlgorithmDES     数据加密标准
 @param sourceString 源字串
 @param keyString 密钥
 @param iv 向量(8字节)
 @return 解密后的字串
 */
+ (NSString *)dencrypt:(uint32_t)algorithm sourceString:(NSString *)sourceString keyString:(NSString *)keyString iv:(NSData *)iv;



@end
