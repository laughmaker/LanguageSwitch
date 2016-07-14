//
//  ViewController.m
//  ChangeLanguageDemo
//
//  Created by lza on 16/7/13.
//  Copyright © 2016年 lza. All rights reserved.
//

#import "HomeViewController.h"
#import "TWLanguageSwitch.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *lbl = [[UILabel alloc] initWithFrame:self.view.bounds];
    lbl.text = TWGetStringWithKey(@"测试");
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.font = [UIFont boldSystemFontOfSize:29];
    [self.view addSubview:lbl];
}


@end
