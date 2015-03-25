//
//  UILine.m
//  LoginDemo
//
//  Created by mm on 3/25/15.
//  Copyright (c) 2015 Pirate. All rights reserved.
//

#import "UILine.h"

@implementation UILine

- (void)awakeFromNib
{
    // careful, contentScaleFactor does NOT WORK in storyboard during initWithCoder.
    // example, float sortaPixel = 1.0/self.contentScaleFactor ... does not work.
    // instead, use mainScreen scale which works perfectly:
    float sortaPixel = 1.0/[UIScreen mainScreen].scale;
    UIView *topSeparatorView = [[UIView alloc] initWithFrame:
                                CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, sortaPixel)];

    topSeparatorView.userInteractionEnabled = NO;
    [topSeparatorView setBackgroundColor:[UIColor grayColor]];
    [self addSubview:topSeparatorView];

    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3];
    self.userInteractionEnabled = NO;
}

@end

