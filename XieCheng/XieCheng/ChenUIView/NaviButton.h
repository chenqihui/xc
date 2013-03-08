//
//  NaviButton.h
//  XieCheng
//
//  Created by chen on 13-3-8.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NaviButtonDelegate <NSObject>

@optional
-(void)touchBtn:(id)sender;

@end

@interface NaviButton : UIButton
{
    id<NaviButtonDelegate> m_NaviButtonDelegate;
}

@property(nonatomic,assign) id<NaviButtonDelegate> m_NaviButtonDelegate;

- (id)initWithFrame:(CGRect)frame Color:(UIColor*)color;

@end
