//
//  XCBaseViewController.h
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCBaseViewController : UIViewController
{
	int m_nLastviewid;
}

@property(nonatomic,assign) int m_nLastviewid;

- (id)initWithFrame:(CGRect)frame;

- (void)SwitchView:(int)viewID;

-(XCBaseViewController*)SuperViewController;

-(void)SwitchView:(int)nViewid param:(id)param viewcontroller:(XCBaseViewController*(^)(int nViewid,id param))viewcontroller complete:(void(^)(XCBaseViewController* curcvl,XCBaseViewController* lastvcl))complete;

@end
