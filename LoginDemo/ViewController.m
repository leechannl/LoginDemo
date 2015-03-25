//
//  ViewController.m
//  LoginDemo
//
//  Created by mm on 3/24/15.
//  Copyright (c) 2015 Pirate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwdTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication]setStatusBarHidden:YES];

    NSAttributedString *usernamePlaceholer = [[NSAttributedString alloc] initWithString:@"印象笔记用户名或电子邮箱" attributes:@{
                                                                                                                     NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]
                                                                                                                     }];
    self.usernameTextField.attributedPlaceholder = usernamePlaceholer;
    NSAttributedString *passwdPlaceholder = [[NSAttributedString alloc] initWithString:@"输入密码" attributes:@{
                                                                                                            NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]
                                                                                                            }];
    self.passwdTextField.attributedPlaceholder = passwdPlaceholder;
}

- (void)viewWillAppear:(BOOL)animated
{
    UIGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)dismissKeyboard
{
    [self.view endEditing:YES];
}

@end
