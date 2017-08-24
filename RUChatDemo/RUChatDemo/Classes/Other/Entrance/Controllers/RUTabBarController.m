//
//  RUTabBarController.m
//  RuChat
//
//  Created by 茹 on 2017/8/23.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "RUTabBarController.h"
#import "RUNavigationController.h"
#import "RULoginController.h"

@interface RUTabBarController ()

@end

@implementation RUTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    RULoginController *login = [[RULoginController alloc] init];
    
    login.tabBarItem.title = @"登录";
    RUNavigationController *navLogin = [[RUNavigationController alloc] initWithRootViewController:login];
    
    login.tabBarItem.image = [[UIImage imageNamed:@"tab_my_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    login.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_my_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navLogin];
    
    
    RULoginController *login2 = [[RULoginController alloc] init];
    
    login2.tabBarItem.title = @"注册";
    RUNavigationController *navLogin2 = [[RUNavigationController alloc] initWithRootViewController:login2];
    
    login2.tabBarItem.image = [[UIImage imageNamed:@"tab_my_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    login2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_my_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    [self addChildViewController:navLogin2];
    
}




@end
