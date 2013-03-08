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
            NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
            NaviButton *button;
            if (j == -1) {
                switch (i) {
                    case 0:
                        [dic setValue:@"用户" forKey:TITLE];
                        [dic setValue:[UIColor blueColor] forKey:COLOR];
                        break;
                    case 1:
                        [dic setValue:@"国内机票" forKey:TITLE];
                        [dic setValue:[UIColor yellowColor] forKey:COLOR];
                        break;
                    case 2:
                        [dic setValue:@"国际机票" forKey:TITLE];
                        [dic setValue:[UIColor greenColor] forKey:COLOR];
                        break;
                }
            }else
            {
                switch (i) {
                    case 0:
                        [dic setValue:@"团购" forKey:TITLE];
                        [dic setValue:[UIColor cyanColor] forKey:COLOR];
                        break;
                    case 1:
                        break;
                    case 2:
                        [dic setValue:@"设置" forKey:TITLE];
                        [dic setValue:[UIColor brownColor] forKey:COLOR];
                        break;
                }
            }
            if(j == 1 && (i == 0 || i == 1))
            {
                if(i == 0)
                {
                    button = [[NaviButton alloc] initWithFrame:CGRectMake(10, [XCContext GetContext].m_rect.size.height/2 + 5, lengthBtn * 2 + 10, lengthBtn) Parem:dic];
                    button.tag = 4;
                    button.m_NaviButtonDelegate = self;
                    [self.view addSubview:button];
                    [button release];
                    [dic release];
                }
            }else
            {
                button = [[NaviButton alloc] initWithFrame:CGRectMake(10 * (i + 1) + lengthBtn * i, [XCContext GetContext].m_rect.size.height/2 + 5 * j - lengthBtn * (j == -1?1:0), lengthBtn, lengthBtn) Parem:dic];
                button.tag = i + j + 2;
                button.m_NaviButtonDelegate = self;
                [self.view addSubview:button];
                [button release];
                [dic release];
            }
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
    [self undoAction];
}

@end
