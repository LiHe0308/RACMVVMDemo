//
// LoginViewController.m
// RACMVVM
//
// Author:  下班不写程序
// Github:  https://github.com/LiHe0308
// E-mail:  969629918@qq.com
// 简   书:  https://www.jianshu.com/u/cde18f686c44
//
// Created by 下班不写程序 on 2020/12/14
//  _      _   _    _
// | |    |_| | |  | |
// | |     _  | |__| |  __
// | |    | | |  __  |//  \\
// | |__/\| | | |  | |||__//
// |_|__,/|_| |_|  |_|\\__,/
//
    

#import "LoginViewController.h"
#import "LoginviewModel.h"
#import "LoginEventHandler.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) LoginViewModel *viewModel;

@property (nonatomic, strong) LoginEventHandler *eventHandler;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = @"登录";
    
    [self configSubViews];
    [self bindSignals];
}

- (void)configSubViews {
    [self.view addSubview:self.loginButton];
}

- (void)bindSignals {
    
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        // execute 方法, 开启网络请求, 传递参数
        [self.viewModel.logInCommand execute:@"13329457148"];
    }];
    
    [self.viewModel.logInSubject subscribeNext:^(id  _Nullable x) {
        
        NSLog(@"请求结果: %@", x);
    }];
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton setBackgroundColor:[UIColor blackColor]];
        [_loginButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        _loginButton.frame = CGRectMake(35, 300, UIScreen.mainScreen.bounds.size.width - 70, 50);
        _loginButton.layer.cornerRadius = 25;
        _loginButton.layer.masksToBounds = YES;
    }
    return _loginButton;
}

- (LoginViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LoginViewModel alloc] init];
    }
    return _viewModel;
}

// 本类只做一些事件的处理, 例如:跳转、弹窗等等
- (LoginEventHandler *)eventHandler {
    if (!_eventHandler) {
        _eventHandler = [[LoginEventHandler alloc] initWithUserInterface:self viewModel:self.viewModel];
    }
    return _eventHandler;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.eventHandler onTapForDismiss];
}

@end
