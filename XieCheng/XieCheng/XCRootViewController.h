//
//  XCRootViewController.h
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCBaseViewController.h"
#import "NavigationViewController.h"
#import "MapViewController.h"
#import "MainViewController.h"

@interface XCRootViewController : XCBaseViewController
{
    NavigationViewController* m_naviViewController;
    MapViewController* m_mapViewController;
    
    MainViewController* m_mainViewController;
    
    int m_angle;
}

@property (retain, nonatomic) IBOutlet UIView *shadeView;

@end
