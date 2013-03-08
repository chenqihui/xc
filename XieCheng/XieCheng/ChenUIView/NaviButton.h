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

@protocol NaviButtonDelegate <NSObject>

@optional
-(void)touchBtn:(id)sender;

@end

@interface NaviButton : UIButton<NSCoding>
{
    id<NaviButtonDelegate> m_NaviButtonDelegate;
}

@property(nonatomic,assign) id<NaviButtonDelegate> m_NaviButtonDelegate;

- (id)initWithFrame:(CGRect)frame Color:(UIColor*)color;

- (id)initWithFrame:(CGRect)frame Parem:(NSMutableDictionary*)dic;

@end
