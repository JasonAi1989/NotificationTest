//
//  ViewController.m
//  notificationTest
//
//  Created by jason on 15/12/12.
//  Copyright © 2015年 JasonAi. All rights reserved.
//

#import "ViewController.h"
#import "LogInViewController.h"

#define UPDATE  @"update_user_info"

@interface ViewController ()
{
    UIButton *_logInBtn;
    UIButton *_logOutBtn;
    UILabel  *_userLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self UILayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 自定义函数
-(void)UILayout{
    CGRect rect = CGRectMake(100, 300, 50, 30);
    
    _logInBtn = [[UIButton alloc]initWithFrame:rect];
    [_logInBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_logInBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_logInBtn setBackgroundColor:[UIColor greenColor]];
    _logInBtn.layer.cornerRadius = 5;
    [_logInBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchDown];
    
    
    _logOutBtn = [[UIButton alloc]initWithFrame:rect];
    [_logOutBtn setTitle:@"注销" forState:UIControlStateNormal];
    [_logOutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_logOutBtn setBackgroundColor:[UIColor redColor]];
    _logOutBtn.layer.cornerRadius = 5;
    [_logOutBtn addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchDown];
    
    _userLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 250, 100, 30)];
    [_userLabel setTextColor:[UIColor blackColor]];
    [_userLabel setBackgroundColor:[UIColor grayColor]];
    
    
    [self.view addSubview:_logInBtn];
    [self.view addSubview:_logOutBtn];
    [self.view addSubview:_userLabel];
    
    _logOutBtn.hidden = YES;
    _userLabel.hidden = YES;
}

#pragma mark action
-(void)login:(id)sender{
    [self addNotification];
    
    LogInViewController *loginView = [[LogInViewController alloc]init];
    
    [self presentViewController:loginView animated:YES completion:nil];
}

-(void)logout:(id)sender{
    _userLabel.text = @"";
    _userLabel.hidden = YES;
    _logOutBtn.hidden = YES;
    _logInBtn.hidden = NO;
}

-(void)addNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUser:) name:UPDATE object:nil];
}

-(void)updateUser:(NSNotification*)info{
    NSDictionary *userInfo = info.userInfo;
    _userLabel.text = userInfo[@"userInfo"];
    _userLabel.hidden = NO;
    _logOutBtn.hidden = NO;
    _logInBtn.hidden = YES;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
