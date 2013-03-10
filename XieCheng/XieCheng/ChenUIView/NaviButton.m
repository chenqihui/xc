//
//  NaviButton.m
//  XieCheng
//
//  Created by chen on 13-3-8.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "NaviButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation NaviButton

@synthesize m_NaviButtonDelegate;
@synthesize m_NaviButtonDataSource;

- (id)initWithFrame:(CGRect)frame IndexOfTag:(NSInteger)indexOfTag
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.tag = indexOfTag;
        [self commonInit];
    }
    return self;
}

- (void)setM_NaviButtonDataSource:(id<NaviButtonDataSource>)naviButtonDataSource
{
    m_NaviButtonDataSource = naviButtonDataSource;
    if ([m_NaviButtonDataSource respondsToSelector:@selector(buttonData:)] == YES)
        [m_NaviButtonDataSource buttonData:self];
}

-(void) commonInit
{
    //enable the shadow
    [self enableShadow];
    
    [self addTarget:self action:@selector(touchDown:forEvent:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
}

-(void) enableShadow
{
    //shadow part
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 5);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 10.0;
    
    //set shadow path
    self.layer.masksToBounds = NO;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.shadowPath = path.CGPath;
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

-(void) disableShadow
{
    self.layer.shadowColor = [UIColor clearColor].CGColor;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

-(void) touchUp: (UIButton*) sender
{
    [UIView animateWithDuration:0.01 animations:^
    {
        sender.layer.zPosition = 10000;
        CATransform3D transform = CATransform3DMakeRotation(0, 1, 0, 0);
        transform.m34 = 1.0 / -500;
        sender.layer.transform = transform;
        sender.transform = CGAffineTransformMakeScale(1, 1);
        [((NaviButton*)sender) enableShadow];
    } completion:^(BOOL finished)
    {
        sender.transform = CGAffineTransformMakeScale(1, 1);
        sender.layer.zPosition = 0;
    }];
    
    if ([m_NaviButtonDelegate respondsToSelector:@selector(touchBtn:)] == YES)
        [m_NaviButtonDelegate touchBtn:self];
}

-(void) touchDown: (UIButton*) sender forEvent:(UIEvent*)event
{
    [UIView animateWithDuration:0.01 animations:^
    {
        sender.layer.zPosition = 10000;
        CATransform3D transform = CATransform3DMakeRotation(0, 1, 0, 0);
        transform.m34 = 1.0 / -500;
        sender.layer.transform = transform;
        sender.transform = CGAffineTransformMakeScale(0.7, 0.7);
        [((NaviButton*)sender) disableShadow];
    } completion:^(BOOL finished)
    {
        sender.transform = CGAffineTransformMakeScale(0.7, 0.7);
        sender.layer.zPosition = 0;
    }];
}

- (void)dealloc
{
    [m_NaviButtonDelegate release];
    [m_NaviButtonDataSource release];
    [super dealloc];
}

@end
