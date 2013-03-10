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
            if(j == 1 && (i == 0 || i == 1))
            {
                if(i == 0)
                {
                    NaviButton *button = [[NaviButton alloc] initWithFrame:CGRectMake(10, [XCContext GetContext].m_rect.size.height/2 + 5, lengthBtn * 2 + 10, lengthBtn) IndexOfTag:4];
                    button.m_NaviButtonDelegate = self;
                    button.m_NaviButtonDataSource = self;
                    [self.view addSubview:button];
                    [button release];
                }
            }else
            {
                NaviButton *button = [[NaviButton alloc] initWithFrame:CGRectMake(10 * (i + 1) + lengthBtn * i, [XCContext GetContext].m_rect.size.height/2 + 5 * j - lengthBtn * (j == -1?1:0), lengthBtn, lengthBtn) IndexOfTag:i + j + 2];
                button.m_NaviButtonDelegate = self;
                button.m_NaviButtonDataSource = self;
                [self.view addSubview:button];
                [button release];
            }
        }
    }
}

- (void)undoAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UNDOACTION object:nil];
}

-(void)touchBtn:(NaviButton *)naviButton
{
    [[self SuperViewController] SwitchView:naviButton.tag];
//    等同于[(XCBaseViewController*)self.view.superview.nextResponder Switch:navi.tag];
    [self undoAction];
}

- (NaviButton *)buttonData:(NaviButton *)naviButton
{
    switch (naviButton.tag)
    {
        case UIButtonForUser:
            [naviButton setTitle:@"用户" forState:UIControlStateNormal];
            [naviButton setBackgroundColor:[UIColor blueColor]];
            break;
        case UIButtonForFlightInChina:
            [naviButton setTitle:@"国内机票" forState:UIControlStateNormal];
            [naviButton setBackgroundColor:[UIColor yellowColor]];
            break;
        case UIButtonForFlightInInternational:
            [naviButton setTitle:@"国际机票" forState:UIControlStateNormal];
            [naviButton setBackgroundColor:[UIColor greenColor]];
            break;
        case UIButtonForShopping:
            [naviButton setTitle:@"团购" forState:UIControlStateNormal];
            [naviButton setBackgroundColor:[UIColor cyanColor]];
            break;
        case UIButtonForUserSet:
            [naviButton setTitle:@"设置" forState:UIControlStateNormal];
            [naviButton setBackgroundColor:[UIColor brownColor]];
            break;
    }
    return naviButton;
}

@end
