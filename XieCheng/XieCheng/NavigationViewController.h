//
//  NavigationViewController.h
//  XieCheng
//
//  Created by chen on 13-3-6.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCBaseViewController.h"
#import "NaviButton.h"

typedef enum {
    //以下是枚举成员 TestA = 0,
    UIButtonForUser = 1,
    UIButtonForFlightInChina,
    UIButtonForFlightInInternational,
    UIButtonForShopping,
    UIButtonForUserSet
}UIButtonForAction;//枚举名称

@interface NavigationViewController : XCBaseViewController<NaviButtonDelegate, NaviButtonDataSource>

@end
