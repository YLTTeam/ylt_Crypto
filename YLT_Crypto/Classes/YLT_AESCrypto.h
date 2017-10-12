//
//  YLT_AESCrypto.h
//  YLT_Crypto
//
//  Created by QTEC on 2017/10/12.
//

#import <Foundation/Foundation.h>
#import "YLT_CryptoTools.h"

@interface YLT_AESCrypto : NSObject

/**
 AES 加密字符串
 
 @param sourceString 源字串
 @param keyString 密钥
 @param iv 向量(8字节)
 @return 加密后的Base64字串
 */
+ (NSString *)encryptString:(NSString *)sourceString keyString:(NSString *)keyString iv:(NSData *)iv;

/**
 AES 解密字符串
 
 @param sourceString 源字串
 @param keyString 密钥
 @param iv 向量(8字节)
 @return 解密后的字串
 */
+ (NSString *)dencryptString:(NSString *)sourceString keyString:(NSString *)keyString iv:(NSData *)iv;

@end
