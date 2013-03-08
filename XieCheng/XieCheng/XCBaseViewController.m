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

- (void)SwitchView:(int)viewID
{
}

-(XCBaseViewController*)SuperViewController
{
	id nextresponder=[self.view.superview nextResponder];
	if(FALSE==[nextresponder isKindOfClass:[UIViewController class]])
		nextresponder=nil;
	return (XCBaseViewController*)nextresponder;
}

@end
