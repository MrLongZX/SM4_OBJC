//
//  NSString+KYSM4.h
//  KYSM4Demo
//
//  Created by kingly on 2017/11/6.
//  Copyright © 2017年 kingly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UFPPaddingMode)
{
    UFPPaddingMode_NONE = 0,
    UFPPaddingMode_PKCS7 = 1
};

@interface NSString (UFPSM4)

/**
 *  使用密钥和初始化向量生成CBC模式的SM4加解密对象
 *
 *  @param secretKey 密钥
 *  @param iv        初始化向量
 *  @param padding   填充模式
 *
 *  @return SM4加密字符串
 */
- (nullable NSString *)encryptionWithSM4Key:(nonnull NSString *)secretKey iv:(nonnull NSString *)iv padding:(UFPPaddingMode)padding;

/**
 在CBC模式下，利用给定的密钥，初始化向量，对字符串解密

 @param secretKey 密钥
 @param iv 初始化向量
 @param padding 填充模式
 @return SM4解密字符串
 */
- (nullable NSString *)decryptionWithSM4Key:(nonnull NSString *)secretKey iv:(nonnull NSString *)iv padding:(UFPPaddingMode)padding;
/**
 *  使用密钥生成ECB模式的SM4加解密对象
 *
 *  @param secretKey 密钥
 *  @param padding   填充模式
 *
 *  @return SM4加解密对象
 */
- (nullable NSString *)encryptionWithSM4Key:(nonnull NSString *)secretKey padding:(UFPPaddingMode)padding;

/**
 *  在ECB模式下，利用给定的密钥，对字符串解密
 *
 *  @param secretKey 密钥
 *  @param padding   填充模式
 *
 *  @return SM4解密字符串
 */
- (nullable NSString *)decryptionWithSM4Key:(nonnull NSString *)secretKey padding:(UFPPaddingMode)padding;

@end
