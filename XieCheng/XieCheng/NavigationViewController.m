//
//  NavigationViewController.m
//  XieCheng
//
//  Created by chen on 13-3-6.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton* get_btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    get_btn1.frame =  CGRectMake(568 * 0.618/2 - 60, 300/2 - 20, 120, 40);
//    get_btn2.center = self.view.center;
    [get_btn1 setTitle:@"upAction" forState:UIControlStateNormal];
    [get_btn1 addTarget:self action:@selector(undoAction) forControlEvents:UIControlEventTouchUpInside];
    self.view.autoresizesSubviews = NO;
    [self.view addSubview:get_btn1];
}

- (void)undoAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UNDOACTION object:nil];
}

@end
