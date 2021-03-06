//
//  XCContext.h
//  XieCheng
//
//  Created by chen on 13-3-3.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXCContext : NSObject
{
    UIWindow *m_window;
    CGRect m_rect;
    NSString *m_dbpath;
}

@property (strong, nonatomic) UIWindow *m_window;
@property (assign, nonatomic) CGRect m_rect;
@property (assign, nonatomic) NSString *m_dbpath;


@end

@interface XCContext : NSObject

+ (void)InitContext;

+ (CXCContext*)GetContext;

+ (void)ReleaseContext;

@end
