//
//  XCRootViewController.m
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCRootViewController.h"
#import "LoginViewController.h"

@interface XCRootViewController ()

@end

@implementation XCRootViewController

@synthesize mainView;
@synthesize navigationView;
@synthesize shadeView;

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIWindow *window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	// Do any additional setup after loading the view.
    LoginViewController* loginViewController = [[LoginViewController alloc] initWithFrame:CGRectMake(0, 0, 160,284)];
    [self.view addSubview:loginViewController.view];
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    NSLog(@"%@",self.view);
//    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, window.frame.size.height-1, window.frame.size.width)];
//    UIButton* get_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    get_btn.frame =  CGRectMake(0, 0, 60, 29);
//    get_btn.center = self.view.center;
//    [get_btn setTitle:@"getAction" forState:UIControlStateNormal];
//    [mainView addSubview:get_btn];
//    navigationView = [[UIView alloc] initWithFrame:self.view.frame];
//    shadeView = [[UIView alloc] initWithFrame:self.view.frame];

//    [self.view addSubview:shadeView];
//    [self.view insertSubview:navigationView aboveSubview:shadeView];
//    [self.view insertSubview:mainView aboveSubview:navigationView];
    
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

//-(BOOL)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskLandscape;
//}
//
//-(BOOL)shouldAutorotate
//{
//    return YES;
//}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
//}

- (void)dealloc
{
    [mainView release];
    [navigationView release];
    [shadeView release];
    
    [super dealloc];
}

@end
