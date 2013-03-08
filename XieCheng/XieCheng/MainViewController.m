//
//  MainViewController.m
//  XieCheng
//
//  Created by chen on 13-3-8.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)SwitchView:(int)viewID
{
    [self SwitchView:viewID param:nil viewcontroller:^XCBaseViewController *(int nViewid, id param)
     {
         CGRect frame = [XCContext GetContext].m_rect;
         XCBaseViewController* controller=nil;
         switch (nViewid)
         {
             case UIButtonForUser:
                 controller = [[LoginViewController alloc] initWithFrame:frame];
                 break;
             case UIButtonForFlightInChina:
                 controller = [[FlightInChinaViewController alloc] initWithFrame:frame];
                 break;
             case UIButtonForFlightInInternational:
                 controller = [[FlightInInternationalViewController alloc] initWithFrame:frame];
                 break;
             case UIButtonForShopping:
                 controller = [[ShoppingViewController alloc] initWithFrame:frame];
                 break;
             case UIButtonForUserSet:
                 controller = [[UserSetViewController alloc] initWithFrame:frame];
                 break;
                 
             default:
                 break;
         }
         controller.view.tag = viewID;
         return controller;
     } complete:^(XCBaseViewController *curcvl, XCBaseViewController *lastvcl)
     {
     }];
}

@end
