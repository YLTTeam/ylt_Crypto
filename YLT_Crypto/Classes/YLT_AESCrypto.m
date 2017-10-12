//
//  YLT_AESCrypto.m
//  YLT_Crypto
//
//  Created by QTEC on 2017/10/12.
//

#import "YLT_AESCrypto.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation YLT_AESCrypto

/**
 AES 加密字符串
 
 @param sourceString 源字串
 @param keyString 密钥
 @param iv 向量(8字节)
 @return 加密后的Base64字串
 */
+ (NSString *)encryptString:(NSString *)sourceString keyString:(NSString *)keyString iv:(NSData *)iv {
    return [YLT_CryptoTools encryptType:kCCAlgorithmAES sourceString:sourceString keyString:keyString iv:iv];
}

/**
 AES 解密字符串
 
 @param sourceString 源字串
 @param keyString 密钥
 @param iv 向量(8字节)
 @return 解密后的字串
 */
+ (NSString *)dencryptString:(NSString *)sourceString keyString:(NSString *)keyString iv:(NSData *)iv {
    return [YLT_CryptoTools dencrypt:kCCAlgorithmAES sourceString:sourceString keyString:keyString iv:iv];
}

@end
