//
//  LogInViewController.m
//  notificationTest
//
//  Created by jason on 15/12/12.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "LogInViewController.h"

#define UPDATE  @"update_user_info"

@interface LogInViewController ()
{
    UITextField *_user;
    UITextField *_pwd;
    UIButton    *_loginBtn;
    UIButton    *_cancleBtn;
}
@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self UILayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)UILayout{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *userLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 60, 30)];
    [userLabel setText:@"用户名"];
    
    UILabel *pwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 250, 60, 30)];
    [pwdLabel setText:@"密    码"];
    
    [self.view addSubview:userLabel];
    [self.view addSubview:pwdLabel];
    
    _user = [[UITextField alloc]initWithFrame:CGRectMake(180, 200, 100, 30)];
    _user.borderStyle = UITextBorderStyleRoundedRect;
    
    _pwd = [[UITextField alloc]initWithFrame:CGRectMake(180, 250, 100, 30)];
    _pwd.borderStyle = UITextBorderStyleRoundedRect;
    
    [_pwd setSecureTextEntry:YES];
    
    [self.view addSubview:_user];
    [self.view addSubview:_pwd];
    
    _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(150, 300, 50, 30)];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor blackColor] forState:0];
    [_loginBtn setBackgroundColor:[UIColor greenColor]];
    _loginBtn.layer.cornerRadius = 5;
    [_loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchDown];
    
    _cancleBtn = [[UIButton alloc]initWithFrame:CGRectMake(250, 300, 50, 30)];
    [_cancleBtn setTitle:@"取消" forState:0];
    [_cancleBtn setTitleColor:[UIColor blackColor] forState:0];
    [_cancleBtn setBackgroundColor:[UIColor redColor]];
    _cancleBtn.layer.cornerRadius = 5;
    [_cancleBtn addTarget:self action:@selector(cancle:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_loginBtn];
    [self.view addSubview:_cancleBtn];
}

-(void)login:(id)sender{
    if ([_user.text isEqualToString:@"Jason"] && [_pwd.text isEqualToString:@"123"]) {
        [self postNotification];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        //登录失败弹出提示信息
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"系统信息" message:@"用户名或密码错误，请重新输入！" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [alertView show];
    }
}

-(void)cancle:(id)sender{

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)postNotification{
    NSDictionary *userInfo = @{@"userInfo":[NSString stringWithFormat:@"Hello, %@", _user.text]};
    NSNotification *notification = [[NSNotification alloc]initWithName:UPDATE object:self userInfo:userInfo];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
