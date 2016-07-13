//
//  LuanguageSwich.h
//  Test
//
//  Created by lza on 16/7/13.
//  Copyright © 2016年 ellenpage. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TWGetStringWithKeyFromTable(key, tbl) [[TWLanguageSwitch sharedInstance] getStringForKey:key fromTable:tbl]

#define TWGetStringWithKey(key) [[TWLanguageSwitch sharedInstance] getStringForKey:key]

static NSString *const kTWLanguageKey = @"languageKey";

// 定义常用几种语言Key
static NSString *const kTWLanguageDefault = @"Base";
static NSString *const kTWLanguageChinese = @"zh-Hans";
static NSString *const kTWLanguageEnglish = @"en";


@interface TWLanguageSwitch : NSObject

// 重置成功后的回调
@property (nonatomic, copy) void (^resetCompletionHandler) (void);

+ (instancetype)sharedInstance;


/**
 *  返回table中指定的key的值
 *
 *  @param key   key
 *  @param table table
 *
 *  @return 返回table中指定的key的值
 */
- (NSString *)getStringForKey:(NSString *)key fromTable:(NSString *)table;

/**
 *
 *  @param key   key
 *
 *  @return 返回默认table中指定的key的值
 */

- (NSString *)getStringForKey:(NSString *)key;

/**
 *  设置新的语言
 *
 *  @param language 新语言
 */
-(void)resetLanguage:(NSString *)language;



@end
