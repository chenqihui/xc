//
//  SOAPServiceViewController.h
//  XieCheng
//
//  Created by chen on 13-3-9.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SOAPServiceViewControllerDelegate <NSObject>

- (void)doFinish:(NSString *)error;

@end

@interface SOAPServiceViewController : UIViewController

@property(nonatomic,assign) id<SOAPServiceViewControllerDelegate> m_SOAPServiceViewControllerDelegate;

- (void)doQuery;

@end
