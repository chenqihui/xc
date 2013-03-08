//
//  NavigationViewController.m
//  XieCheng
//
//  Created by chen on 13-3-6.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "NavigationViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    int lengthBtn = ([XCContext GetContext].m_rect.size.width * 0.618 - 40)/3;
    
    for (int j = -1; j < 2; j = j+2)
    {
        for (int i = 0; i < 3; i++)
        {
            NaviButton *button;
            if(j == 1 && (i == 0 || i == 1))
            {
                if(i == 0)
                {
                    button = [[[NaviButton alloc] initWithFrame:CGRectMake(10, [XCContext GetContext].m_rect.size.height/2 + 5, lengthBtn * 2 + 10, lengthBtn) Color:[UIColor greenColor]] autorelease];
                    button.tag = 3;
                }
            }else
            {
                button = [[[NaviButton alloc] initWithFrame:CGRectMake(10 * (i + 1) + lengthBtn * i, [XCContext GetContext].m_rect.size.height/2 + 5 * j - lengthBtn * (j == -1?1:0), lengthBtn, lengthBtn)] autorelease];
                button.tag = i + j + 1;
                [button setBackgroundColor:[UIColor orangeColor]];
            }
            button.m_NaviButtonDelegate = self;
            [button setTitle:@"Button" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.view addSubview:button];
        }
    }
}

- (void)undoAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UNDOACTION object:nil];
}

-(void)touchBtn:(id)sender
{
    NaviButton* navi = (NaviButton*)sender;
    [[self SuperViewController] SwitchView:navi.tag];
//    等同于[(XCBaseViewController*)self.view.superview.nextResponder Switch:navi.tag];
}

@end
