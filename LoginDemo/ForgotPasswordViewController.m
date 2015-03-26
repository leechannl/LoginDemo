//
//  ForgotPasswordViewController.m
//  LoginDemo
//
//  Created by mm on 3/26/15.
//  Copyright (c) 2015 Pirate. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSAttributedString *usernamePlaceholer = [[NSAttributedString alloc] initWithString:@"印象笔记用户名或电子邮箱" attributes:@{
                                                                                                                     NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]
                                                                                                                     }];
    self.usernameTextField.attributedPlaceholder = usernamePlaceholer;
    self.usernameTextField.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.7];
}

- (void)viewWillAppear:(BOOL)animated
{
    UIGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark - handle keyboard

- (void)dismissKeyboard
{
    [self.view endEditing:YES];
}

@end
