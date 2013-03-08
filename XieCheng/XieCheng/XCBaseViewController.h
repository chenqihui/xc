//
//  XCBaseViewController.h
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCBaseViewController : UIViewController

- (id)initWithFrame:(CGRect)frame;

- (void)SwitchView:(int)viewID;

-(XCBaseViewController*)SuperViewController;

@end
