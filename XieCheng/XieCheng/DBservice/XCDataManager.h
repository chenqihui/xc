//
//  XCDataManager.h
//  XieCheng
//
//  Created by chen on 13-3-10.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

@interface ShoppingObj : NSObject
{
    int         m_HotelID;
    NSString    *m_HotelName;
    NSString    *m_ItemType;
    double      m_Rate;
    NSDate      *m_StartDate;
    NSString    *m_Name;
    NSString    *m_Description;
    NSDate      *m_EndDate;
    int         m_ProductId;
    double      m_NowPrice;
    double      m_Price;
    double      m_ProductPrice;
    NSString    *m_Pictures;
    int         m_SaledItemCount;
    NSString    *m_Url;
    Boolean     m_IsGroup;
}
@property(nonatomic,assign)int         m_HotelID;
@property(nonatomic,retain)NSString    *m_HotelName;
@property(nonatomic,retain)NSString    *m_ItemType;
@property(nonatomic,assign)double      m_Rate;
@property(nonatomic,retain)NSDate      *m_StartDate;
@property(nonatomic,retain)NSString    *m_Name;
@property(nonatomic,retain)NSString    *m_Description;
@property(nonatomic,retain)NSDate      *m_EndDate;
@property(nonatomic,assign)int         m_ProductId;
@property(nonatomic,assign)double      m_NowPrice;
@property(nonatomic,assign)double      m_Price;
@property(nonatomic,assign)double      m_ProductPrice;
@property(nonatomic,retain)NSString    *m_Pictures;
@property(nonatomic,assign)int         m_SaledItemCount;
@property(nonatomic,retain)NSString    *m_Url;
@property(nonatomic,assign)Boolean     m_IsGroup;

@end

@interface XCDataManager : NSObject
{
    sqlite3 *database;
}

- (void)open;

- (void)query:(int)index output:(NSMutableArray **)arlist;

-(void)insert;

-(void)close;

@end
