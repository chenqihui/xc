//
//  ShoppingViewController.h
//  XieCheng
//
//  Created by chen on 13-3-8.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCBaseViewController.h"

#import "XCDataManager.h"
#import "SOAPServiceViewController.h"

//#import "PullRefreshView.h"

@interface ShoppingViewController : XCBaseViewController<UITableViewDelegate, UITableViewDataSource, SOAPServiceViewControllerDelegate>
{
    XCDataManager *xcdata;
    
    UITableView *shoppinglist;
    
    NSArray         *m_arData;
    
//    PullRefreshView *m_pullRefreshView;
    
//    UIButton* moreBtn;
}

@end
