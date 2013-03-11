//
//  PullRefreshView.h
//  XieCheng
//
//  Created by chen on 13-3-11.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define REFRESH_HEADER_HEIGHT 52.0f

@interface PullRefreshView : UIView
{
    UILabel *refreshLabel;
    UIImageView *refreshArrow;
    UIActivityIndicatorView *refreshSpinner;
    BOOL isDragging;
    BOOL isLoading;
    NSString *textPull;
    NSString *textRelease;
    NSString *textLoading;
}
@property (nonatomic, strong) UILabel *refreshLabel;
@property (nonatomic, strong) UIImageView *refreshArrow;
@property (nonatomic, strong) UIActivityIndicatorView *refreshSpinner;
@property (nonatomic, strong) NSString *textPull;
@property (nonatomic, strong) NSString *textRelease;
@property (nonatomic, strong) NSString *textLoading;
@property (nonatomic, strong) NSString *textNoMore;
@property (nonatomic) BOOL hasMore;

@end
