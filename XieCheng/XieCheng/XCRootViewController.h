//
//  XCRootViewController.h
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCBaseViewController.h"
#import "LoginViewController.h"
#import "NavigationViewController.h"
#import "MapViewController.h"

@interface XCRootViewController : XCBaseViewController
{
    LoginViewController* m_loginViewController;
    NavigationViewController* m_naviViewController;
    MapViewController* m_mapViewController;
    
    int m_angle;
}

@property (retain, nonatomic) IBOutlet UIView *mainView;
@property (retain, nonatomic) IBOutlet UIView *shadeView;

@end
