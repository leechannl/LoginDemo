//
//  ViewController.m
//  LoginDemo
//
//  Created by mm on 3/24/15.
//  Copyright (c) 2015 Pirate. All rights reserved.
//

#import "LoginViewController.h"
#import "UILine.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *ChineseNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *EnglishNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *fogotPasswdButton;
@property (weak, nonatomic) IBOutlet UIView *nameFieldBg;
@property (weak, nonatomic) IBOutlet UIButton *switchToCreateAccountButton;

@property (weak, nonatomic) IBOutlet UILine *BottomLineView;
@property (weak, nonatomic) IBOutlet UIButton *switchToInternationalButton;

@property (nonatomic, assign) CGFloat moveUpOffset;

@end

@implementation LoginViewController

#pragma mark - view controller life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication]setStatusBarHidden:YES];

    NSAttributedString *usernamePlaceholer = [[NSAttributedString alloc] initWithString:@"印象笔记用户名或电子邮箱" attributes:@{
                                                                                                                     NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]
                                                                                                                     }];
    self.usernameTextField.attributedPlaceholder = usernamePlaceholer;
    self.usernameTextField.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.7];
    NSAttributedString *passwdPlaceholder = [[NSAttributedString alloc] initWithString:@"输入密码" attributes:@{
                                                                                                            NSForegroundColorAttributeName: [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5]
                                                                                                            }];
    self.passwdTextField.attributedPlaceholder = passwdPlaceholder;
    self.passwdTextField.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.7];
    self.loginButton.layer.cornerRadius = 6.0;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

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

- (void)keyboardWillShow:(NSNotification *)notification
{
    CGFloat keyboardHeight = [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    CGFloat height = self.nameFieldBg.frame.origin.y;
    self.moveUpOffset = height - 30;
    if (keyboardHeight < self.moveUpOffset) {
        self.moveUpOffset = keyboardHeight;
    }
    self.view.frame = CGRectMake(0, - self.moveUpOffset, self.view.frame.size.width, self.view.frame.size.height);

    self.logoImageView.hidden = YES;
    self.ChineseNameLabel.hidden = YES;
    self.EnglishNameLabel.hidden = YES;
    self.descLabel.hidden = YES;
    self.switchToCreateAccountButton.hidden = YES;
    self.BottomLineView.hidden = YES;
    self.switchToInternationalButton.hidden = YES;
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    self.logoImageView.hidden = NO;
    self.ChineseNameLabel.hidden = NO;
    self.EnglishNameLabel.hidden = NO;
    self.descLabel.hidden = NO;
    self.switchToCreateAccountButton.hidden = NO;
    self.BottomLineView.hidden = NO;
    self.switchToInternationalButton.hidden = NO;
}

#pragma mark - button action

- (IBAction)loginButtonPressed:(UIButton *)sender {
    if ([self.usernameTextField.text length] == 0) {
        [self.usernameTextField becomeFirstResponder];
    } else if ([self.passwdTextField.text length] == 0) {
        [self.passwdTextField becomeFirstResponder];
    } else {
        NSLog(@"Call login API...");
    }
}

@end
