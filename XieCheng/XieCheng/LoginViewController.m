//
//  LoginViewController.m
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor redColor]];
    UIButton* get_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    get_btn.frame =  CGRectMake(0, 0, 60, 29);
//    get_btn.center = self.view.center;
    [get_btn setTitle:@"getAction" forState:UIControlStateNormal];
    [self.view addSubview:get_btn];
}

//- (NSUInteger) supportedInterfaceOrientations
//{
//    //Because your app is only landscape, your view controller for the view in your
//    // popover needs to support only landscape
//    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
//}

//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskLandscape;
//}

-(BOOL)shouldAutorotate
{
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return ((1 << UIInterfaceOrientationPortrait) | (1 << UIInterfaceOrientationLandscapeLeft) | (1 << UIInterfaceOrientationLandscapeRight));
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (UIInterfaceOrientationPortraitUpsideDown != toInterfaceOrientation)
    {
        return YES;
    }
    return NO;
}
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}
//
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [UIView animateWithDuration:0.0f
//                     animations:^{
//                         [self.view setTransform: CGAffineTransformMakeRotation(M_PI / 2)];
//                         //                         if (iPhone5) {
//                         //                             self.view.frame = CGRectMake(0, 0, 568, 320);
//                         //                         }
//                         //                         else{
//                         //                             self.view.frame = CGRectMake(0, 0, 480, 320);
//                         //                         }
//                     }];
//}

#pragma mark -

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait)
    {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(0.0);
        self.view.bounds = CGRectMake(0, 0, 748, 1004);
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(M_PI_4);
        self.view.bounds = CGRectMake(0, 0, 568, 320);
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.view.bounds = CGRectMake(0, 0, 748, 1004);
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(-M_PI_4);
        self.view.bounds = CGRectMake(0, 0, 568, 320);
    }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(toInterfaceOrientation == UIInterfaceOrientationPortrait)
    {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(0.0);
        self.view.bounds = CGRectMake(0, 0, 748, 1004);
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(M_PI_4);
        self.view.bounds = CGRectMake(0, 0, 568, 320);
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.view.bounds = CGRectMake(0, 0, 748, 1004);
    }
    else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        self.view.transform = CGAffineTransformIdentity;
        self.view.transform = CGAffineTransformMakeRotation(-M_PI_4);
        self.view.bounds = CGRectMake(0, 0, 568, 320);
    }
}

//-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//{
//    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
//}


@end
