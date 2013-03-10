//
//  NaviButton.h
//  XieCheng
//
//  Created by chen on 13-3-8.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TITLE @"title"
#define COLOR @"color"

@class NaviButton;
@protocol NaviButtonDataSource;

@protocol NaviButtonDelegate <NSObject>

@optional

- (void)touchBtn:(NaviButton *)naviButton;

@end

@interface NaviButton : UIButton<NSCoding>
{
    id<NaviButtonDelegate>   m_NaviButtonDelegate;
    id<NaviButtonDataSource> m_NaviButtonDataSource;
}

@property(nonatomic,assign)   id <NaviButtonDelegate>   m_NaviButtonDelegate;
@property(nonatomic,assign)   id <NaviButtonDataSource> m_NaviButtonDataSource;

- (id)initWithFrame:(CGRect)frame IndexOfTag:(NSInteger)indexOfTag;

@end

@protocol NaviButtonDataSource <NSObject>

@optional

- (NaviButton *)buttonData:(NaviButton *)naviButton;

@end 
