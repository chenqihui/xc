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

@synthesize m_nLastviewid;

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

+(XCBaseViewController*)FindViewController:(UIView*)view
{
	id nextresponder=[view nextResponder];
	if(FALSE==[nextresponder isKindOfClass:[UIViewController class]])
		nextresponder=nil;
	return (XCBaseViewController*)nextresponder;
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

-(void)SwitchView:(int)nViewid param:(id)param viewcontroller:(XCBaseViewController*(^)(int nViewid,id param))viewcontroller complete:(void(^)(XCBaseViewController* curcvl,XCBaseViewController* lastvcl))complete
{
    NSArray* ar = self.view.subviews;
    int nCount = ar.count;
    UIView* view = nil;
    UIView* lastview = nil;
    int nViewindex=-1;
    int nLastviewindex=-1;
    if (nCount > 0)
    {
        for (view in self.view.subviews)
        {
            if (view.tag == nViewid && [XCBaseViewController FindViewController:view] != nil)
                break;
            view = nil;
        }
        
        lastview=[self GetTopViewController].view;
        nLastviewindex=[ar indexOfObject:lastview];
        if(lastview!=nil&&view==lastview)
        {
            [[XCBaseViewController FindViewController:view] ViewStillAppear];
            goto FUNEXIT;
        }
        nViewindex=[self FindViewIndex:view.tag];
    }
	
    if(nil==view)
    {
        XCBaseViewController* controller=viewcontroller(nViewid,param);
        if(nil!=controller)
        {
            view=controller.view;
            controller.m_nLastviewid=self.view.tag;
            controller.view.tag=nViewid;
            [self.view insertSubview:controller.view atIndex:nCount];
            [controller ViewDidAppear];
            [[XCBaseViewController FindViewController:lastview] ViewDidDisappear];
        }
    }else if(nil!=view)
    {
        [self.view exchangeSubviewAtIndex:nViewindex withSubviewAtIndex:nLastviewindex];
        [[XCBaseViewController FindViewController:lastview] ViewDidDisappear];
        [[XCBaseViewController FindViewController:view] ViewDidReAppear];
    }
    FUNEXIT:
        complete([XCBaseViewController FindViewController:view],[XCBaseViewController FindViewController:lastview]);
}

-(void)ViewDidAppear
{
}

-(void)ViewStillAppear
{
}

-(void)ViewDidDisappear
{
    self.view.hidden=YES;
}

-(void)ViewDidReAppear
{
    self.view.hidden=NO;
}

-(XCBaseViewController*)GetTopViewController
{
    XCBaseViewController* controller=nil;
    NSArray* ar=self.view.subviews;
    if(ar.count>0)
    {
        for(int i=ar.count-1;i>=0;i--)
        {
            controller=[XCBaseViewController FindViewController:[ar objectAtIndex:i]];
            if(controller!=nil)
                break;
        }
    }
    return controller;
}

-(int)FindViewIndex:(int)nID
{
	NSAutoreleasePool* pool=[NSAutoreleasePool new];
	NSArray* ar=self.view.subviews;
	int nResult=-1;
	for(int i=0;i<ar.count;i++)
	{
		UIView* view=[ar objectAtIndex:i];
		if(view.tag==nID)
		{
			nResult=i;
			break;
		}
	}
	[pool release];
	return nResult;
}

@end
