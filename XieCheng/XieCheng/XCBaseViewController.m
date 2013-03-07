//
//  XCBaseViewController.m
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCBaseViewController.h"

@interface XCBaseViewController ()

@end

@implementation XCBaseViewController

//static UIInterfaceOrientation s_currentorientation=UIInterfaceOrientationPortrait;

- (id)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.view.frame = frame; 
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

//+(UIInterfaceOrientation)GetCurrentOrientation
//{
//    return s_currentorientation;
//}
//
//+(void)SetCurrentOrientation:(UIInterfaceOrientation)orientation
//{
//    s_currentorientation=orientation;
//}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [UIView animateWithDuration:0.0f
//                     animations:^{
//                         [self.view setTransform: CGAffineTransformMakeRotation(M_PI / 2)];
////                         if (iPhone5) {
////                             self.view.frame = CGRectMake(0, 0, 568, 320);
////                         }
////                         else{
////                             self.view.frame = CGRectMake(0, 0, 480, 320);
////                         }
//                     }];
//}

@end
