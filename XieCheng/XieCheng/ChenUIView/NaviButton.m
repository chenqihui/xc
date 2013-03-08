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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame Color:(UIColor*)color
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:color];
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame Parem:(NSMutableDictionary*)dic
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if ([dic count] > 0)
        {
            NSMutableDictionary* data = [dic retain];
            if([data objectForKey:TITLE] != nil)
                [self setTitle:[data objectForKey:TITLE] forState:UIControlStateNormal];
            if([data objectForKey:COLOR] != nil)
                [self setBackgroundColor:[data objectForKey:COLOR]];
            [data release];
        }
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self commonInit];
    }
    return self;
}

-(void) commonInit {
    
    //enable the shadow
    [self enableShadow];
    
    [self addTarget:self action:@selector(touchDown:forEvent:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
}

-(void) enableShadow {
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

-(void) disableShadow {
    self.layer.shadowColor = [UIColor clearColor].CGColor;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

-(void) touchUp: (UIButton*) sender
{
    [UIView animateWithDuration:0.01 animations:^{
        sender.layer.zPosition = 10000;
        CATransform3D transform = CATransform3DMakeRotation(0, 1, 0, 0);
        transform.m34 = 1.0 / -500;
        sender.layer.transform = transform;
        sender.transform = CGAffineTransformMakeScale(1, 1);
        [((NaviButton*)sender) enableShadow];
    } completion:^(BOOL finished) {
        sender.transform = CGAffineTransformMakeScale(1, 1);
        sender.layer.zPosition = 0;
    }];
    
    if ([m_NaviButtonDelegate respondsToSelector:@selector(touchBtn:)] == YES)
        [m_NaviButtonDelegate touchBtn:self];
}

-(void) touchDown: (UIButton*) sender forEvent:(UIEvent*)event
{
    [UIView animateWithDuration:0.01 animations:^{
        sender.layer.zPosition = 10000;
        CATransform3D transform = CATransform3DMakeRotation(0, 1, 0, 0);
        transform.m34 = 1.0 / -500;
        sender.layer.transform = transform;
        sender.transform = CGAffineTransformMakeScale(0.7, 0.7);
        [((NaviButton*)sender) disableShadow];
    } completion:^(BOOL finished) {
        sender.transform = CGAffineTransformMakeScale(0.7, 0.7);
        sender.layer.zPosition = 0;
    }];
}

- (void)dealloc
{
    [m_NaviButtonDelegate release];
    [super dealloc];
}

@end
