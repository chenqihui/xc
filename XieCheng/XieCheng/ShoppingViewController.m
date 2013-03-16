//
//  ShoppingViewController.m
//  XieCheng
//
//  Created by chen on 13-3-8.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "ShoppingViewController.h"
#import "SOAPServiceViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface ShoppingViewController ()

@end

@implementation ShoppingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor cyanColor]];
    
//    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [btn setBackgroundColor:[UIColor grayColor]];
//    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchDown];
//    [self.view addSubview:btn];
//    [btn release];
    
    shoppinglist = [[UITableView alloc] initWithFrame:[XCContext GetContext].m_rect];
    shoppinglist.dataSource = self;
    shoppinglist.delegate = self;
    
//    m_pullRefreshView = [[PullRefreshView alloc] initWithFrame:CGRectMake(0, -REFRESH_HEADER_HEIGHT, [XCContext GetContext].m_rect.size.width, REFRESH_HEADER_HEIGHT)];
//    
//    [shoppinglist addSubview:m_pullRefreshView];
    [self.view addSubview:shoppinglist];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        [self initData];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [m_arData count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.row < [m_arData count])
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"applistcell"];
        if(cell==nil)
        {
            cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:@"applistcell"]autorelease];
            
            UILabel *label = [[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 255, 44)] autorelease];
            label.backgroundColor = [UIColor clearColor];
            label.tag = 500;
            UIFont *font = [UIFont systemFontOfSize:20];
            label.font = font;
            label.text = [(ShoppingObj*)[m_arData objectAtIndex:indexPath.row] m_HotelName];
            [cell.contentView addSubview:label];
        }
    }else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"buttoncell"];
        if(cell==nil)
        {
            cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:@"buttoncell"]autorelease];
            
            UIButton* moreBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [moreBtn setFrame:CGRectMake(30, 20, [XCContext GetContext].m_rect.size.width - 60, 100 - 40)];
            [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
            [moreBtn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchDown];
            [cell.contentView addSubview:moreBtn];
        }
    }
    
    //设置行的样式：此为无，默认是点击变蓝
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)initData
{
    xcdata = [[XCDataManager alloc] init];
    [xcdata open];
    NSMutableArray *array = nil;
    [xcdata query:1 output:&array];
    
    if (array.count > 0) {
        m_arData = [array retain];
        dispatch_async(dispatch_get_main_queue(), ^{
            [shoppinglist reloadData];
//            [m_pullRefreshView setFrame:CGRectMake(0, [m_arData count] * 100 + 20, [XCContext GetContext].m_rect.size.width, REFRESH_HEADER_HEIGHT)];
        });
    }
    [array release];
    [xcdata close];
}

-(void)btn
{
    SOAPServiceViewController* service = [[SOAPServiceViewController alloc] init];
    [service doQuery];
    [service release];
    
//    xcdata = [[XCDataManager alloc] init];
//    [xcdata open];
//    [xcdata insert];
}

- (void)get
{
//    [xcdata query];
    [xcdata close];
    [m_arData release];
}

- (void)dealloc
{
    [shoppinglist release];
    [super dealloc];
}

@end
