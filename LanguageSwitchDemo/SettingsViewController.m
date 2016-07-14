//
//  SettingsViewController.m
//  ChangeLanguageDemo
//
//  Created by lza on 16/7/13.
//  Copyright © 2016年 lza. All rights reserved.
//

#import "SettingsViewController.h"
#import "TWLanguageSwitch.h"

@interface SettingsViewController ()
- (IBAction)setupChineseLanguage:(id)sender;
- (IBAction)setupEnglishLanguage:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (IBAction)setupChineseLanguage:(id)sender {
    [[TWLanguageSwitch sharedInstance] resetLanguage:kTWLanguageChinese];
}

- (IBAction)setupEnglishLanguage:(id)sender {
    [[TWLanguageSwitch sharedInstance] resetLanguage:kTWLanguageEnglish];
}


@end
