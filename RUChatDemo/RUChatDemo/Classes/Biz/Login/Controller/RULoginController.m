//
//  RULoginController.m
//  RuChat
//
//  Created by 茹 on 2017/8/23.
//  Copyright © 2017年 kkx. All rights reserved.
//

#import "RULoginController.h"
#import <Hyphenate/Hyphenate.h>

@interface RULoginController ()



/**
 账号
 */
@property (nonatomic, strong) UITextField *accountTextField;

/** 密码 */
@property (nonatomic, strong) UITextField *passwordTextField;



@end

@implementation RULoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册
    EMError *error = [[EMClient sharedClient] registerWithUsername:@"rutest" password:@"123456"];
    
    if (!error) {
        NSLog(@"注册成功");
         [self showHint:@"成功"];
    }else {
        NSLog(@"注册失败");
        [self showHint:error.description];
    }
    
    
    self.navigationItem.title = @"登录";
    
    [self.view addSubview:self.accountTextField];
    [self.view addSubview:self.passwordTextField];
    
    
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
        make.top.equalTo(self.view).offset(100);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
        make.top.equalTo(self.accountTextField).offset(100);
    }];
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    EMError *error = [[EMClient sharedClient] loginWithUsername:self.accountTextField.text password:self.passwordTextField.text];
    if (!error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self showHint:@"登录成功"];
    }else {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [self showHint:@"登录失败"];
    }
}

#pragma mrak - lazy

- (UITextField *)accountTextField {
    if (!_accountTextField) {
        _accountTextField = [[UITextField alloc] init];
        _accountTextField.placeholder = @"请输入账号";
    }

    return _accountTextField;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"请输入密码";
    }
    return _passwordTextField;
}


@end
