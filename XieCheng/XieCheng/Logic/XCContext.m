//
//  XCContext.m
//  XieCheng
//
//  Created by chen on 13-3-3.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCContext.h"

@implementation CXCContext

@synthesize m_window;
@synthesize m_rect;
@synthesize m_dbpath;

@end

@implementation XCContext

static CXCContext *s_context;

+ (void)InitContext
{
    s_context = [CXCContext new];
}

+ (CXCContext*)GetContext
{
    return s_context;
}

+ (void)ReleaseContext
{
    [s_context release];
    s_context = nil;
}

@end
