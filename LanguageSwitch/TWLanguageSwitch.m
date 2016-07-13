//
//  LuanguageSwich.m
//  Test
//
//  Created by lza on 16/7/13.
//  Copyright © 2016年 ellenpage. All rights reserved.
//

#import "TWLanguageSwitch.h"



@interface TWLanguageSwitch ()

@property(nonatomic, strong) NSBundle *bundle;
@property(nonatomic, copy) NSString *language;

@end

@implementation TWLanguageSwitch

+ (instancetype)sharedInstance {
    static TWLanguageSwitch *languageSwitch = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        languageSwitch = [[TWLanguageSwitch alloc] init];
        
    });
    return languageSwitch;
}

- (instancetype)init {
    if (self = [super init]) {
        [self defaultInit];
    }
    return self;
}

- (void)defaultInit {
    NSString *tmp = [[NSUserDefaults standardUserDefaults] objectForKey:kTWLanguageKey];
    //默认是系统语言
    if (!tmp) {
        self.bundle = nil;
    } else {
        self.language = tmp;
        self.bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle]pathForResource:self.language ofType:@"lproj"]];
    }
}

- (NSString *)getStringForKey:(NSString *)key fromTable:(NSString *)table {
    if (self.bundle) {
        return NSLocalizedStringFromTableInBundle(key, table, self.bundle, @"");
    }
    
    return NSLocalizedStringFromTable(key, table, @"");
}

- (NSString *)getStringForKey:(NSString *)key {
    if (self.bundle) {
        return NSLocalizedStringFromTableInBundle(key, @"Localizable", self.bundle, @"");
    }
    
    return NSLocalizedStringFromTable(key, @"Localizable", @"");
}

- (void)resetLanguage:(NSString *)language {
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    self.bundle = [NSBundle bundleWithPath:path];
    if (!self.bundle) {
        NSLog(@"未找到对应的语言包！");
    }
    
    self.language = language;
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:kTWLanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (self.resetCompletionHandler) {
        self.resetCompletionHandler();
    }
}




@end
