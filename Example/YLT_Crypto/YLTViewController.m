//
//  YLTViewController.m
//  YLT_Crypto
//
//  Created by xphaijj0305@126.com on 10/12/2017.
//  Copyright (c) 2017 xphaijj0305@126.com. All rights reserved.
//

#import "YLTViewController.h"
#import <YLT_Crypto/YLT_Crypto.h>

@interface YLTViewController ()

@end

@implementation YLTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    uint8_t iv[8] = {2,3,4,5,6,7,0,0}; //直接影响加密结果!
    NSData * ivData = [NSData dataWithBytes:iv length:sizeof(iv)];
    
    NSString *result = [YLT_DESCrypto encryptString:@"hello" keyString:@"ylt" iv:nil];
    NSLog(@"des(ECB) 加密后字串: %@", result);
    result = [YLT_DESCrypto dencryptString:result keyString:@"ylt" iv:nil];
    NSLog(@"des(ECB) 解密后字串: %@", result);
    
    result = [YLT_DESCrypto encryptString:@"hello" keyString:@"ylt" iv:ivData];
    NSLog(@"des(CBC) 加密后字串: %@", result);
    result = [YLT_DESCrypto dencryptString:result keyString:@"ylt" iv:ivData];
    NSLog(@"des(CBC) 解密后字串: %@", result);
    
    
    result = [YLT_AESCrypto encryptString:@"hello" keyString:@"ylt" iv:nil];
    NSLog(@"aes(ECB) 加密后字串: %@", result);
    result = [YLT_AESCrypto dencryptString:result keyString:@"ylt" iv:nil];
    NSLog(@"aes(ECB) 解密后字串: %@", result);
    
    result = [YLT_AESCrypto encryptString:@"hello" keyString:@"ylt" iv:ivData];
    NSLog(@"aes(CBC) 加密后字串: %@", result);
    result = [YLT_AESCrypto dencryptString:result keyString:@"ylt" iv:ivData];
    NSLog(@"aes(CBC) 解密后字串: %@", result);
    
    
    //1.加载公钥
    [[YLT_RSACrypto sharedInstance] loadPublicKey:[[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil]];
    //2. 加载私钥 - P12的文件  password : 生成P12 的时候设置的密码
    [[YLT_RSACrypto sharedInstance] loadPrivateKey:[[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil] password:@"ylt"];
    
    NSData * reault = [[YLT_RSACrypto sharedInstance] encryptData:[@"hello" dataUsingEncoding:NSUTF8StringEncoding]];
    //base64 编码
    NSString * base64 = [reault base64EncodedStringWithOptions:0];
    NSLog(@"RSA 加密的信息: %@",base64);
    
    //解密
    NSData * jiemi = [[YLT_RSACrypto sharedInstance] decryptData:reault];
    NSLog(@"RSA 解密的信息： %@",[[NSString alloc]initWithData:jiemi encoding:NSUTF8StringEncoding]);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
