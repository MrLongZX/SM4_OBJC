//
//  ViewController.m
//  SM4Demo
//
//  Created by suyoulong on 2020/12/23.
//  Copyright © 2020 suyoulong. All rights reserved.
//

#import "ViewController.h"
#import "NSString+UFPSM4.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self ecbDemo];
    
    [self cbcDemo];
}

/**
 CBC模式示例
 */
-(void)cbcDemo{
    //密钥
    NSString *secretKey = @"qwertyuiopasdfgh";
    //初始化向量
    NSString *iv = @"1234567812345678";
    //需要加密的字符串
    NSString *testString = @"1234567890!@#$%^&*()qwertyuiopQWERTYUIOP;:'<,>?.";
    
    NSString *encryptionString2 = [testString encryptionWithSM4Key:secretKey iv:iv padding:UFPPaddingMode_PKCS7];
    NSLog(@"CBC PKCS7 加密: %@", encryptionString2);
    
    NSString *decryptionString2 = [encryptionString2 decryptionWithSM4Key:secretKey iv:iv padding:UFPPaddingMode_PKCS7];
    NSLog(@"CBC PKCS7 解密: %@", decryptionString2);
    
    
    NSString *encryptionString = [testString encryptionWithSM4Key:secretKey iv:iv padding:UFPPaddingMode_NONE];
    NSLog(@"CBC NONE 加密: %@", encryptionString);
    
    NSString *decryptionString = [encryptionString decryptionWithSM4Key:secretKey iv:iv padding:UFPPaddingMode_NONE];
    NSLog(@"CBC NONE  解密: %@", decryptionString);
}

/**
 ECB模式示例
 */
-(void)ecbDemo{
    //密钥
    NSString *secretKey = @"qwertyuiopasdfgh";
    //需要加密的字符串
    NSString *testString = @"1234567890!@#$%^&*()qwertyuiopQWERTYUIOP;:'<,>?.";
    
    NSString *encryptionString2 = [testString encryptionWithSM4Key:secretKey padding:UFPPaddingMode_PKCS7];
    NSLog(@"ECB PKCS7 加密: %@", encryptionString2);
    
    NSString *decryptionString2 = [encryptionString2 decryptionWithSM4Key:secretKey padding:UFPPaddingMode_PKCS7];
    NSLog(@"ECB PKCS7 解密: %@", decryptionString2);
    
    
    NSString *encryptionString = [testString encryptionWithSM4Key:secretKey padding:UFPPaddingMode_NONE];
    NSLog(@"ECB NONE 加密: %@", encryptionString);
    
    NSString *decryptionString = [encryptionString decryptionWithSM4Key:secretKey padding:UFPPaddingMode_NONE];
    NSLog(@"ECB NONE 解密: %@", decryptionString);
}

@end
