//
//  ShoppingViewController.m
//  XieCheng
//
//  Created by chen on 13-3-8.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "ShoppingViewController.h"
#import "SOAPServiceViewController.h"

@interface ShoppingViewController ()

@end

@implementation ShoppingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor cyanColor]];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    [btn release];
    
    
    
    UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(220, 100, 100, 100)];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [btn2 addTarget:self action:@selector(get) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn2];
    [btn2 release];
}

-(void)btn
{
//    SOAPServiceViewController* service = [[SOAPServiceViewController alloc] init];
//    [service doQuery];
//    [service release];
    
    xcdata = [[XCDataManager alloc] init];
    [xcdata open];
    [xcdata insert];
}

- (void)get
{
    [xcdata query];
    [xcdata close];
}

@end
