//
//  XCDataManager.m
//  XieCheng
//
//  Created by chen on 13-3-10.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCDataManager.h"

@implementation ShoppingObj

@synthesize    m_HotelID;
@synthesize    m_HotelName;
@synthesize    m_ItemType;
@synthesize    m_Rate;
@synthesize    m_StartDate;
@synthesize    m_Name;
@synthesize    m_Description;
@synthesize    m_EndDate;
@synthesize    m_ProductId;
@synthesize    m_NowPrice;
@synthesize    m_Price;
@synthesize    m_ProductPrice;
@synthesize    m_Pictures;
@synthesize    m_SaledItemCount;
@synthesize    m_Url;
@synthesize    m_IsGroup;

@end

@implementation XCDataManager

//- (int)GetAllAppListWithCondition:(NSString *)conditionstr output:(NSMutableArray **)arlist
//{
//    NSAutoreleasePool *pool = [NSAutoreleasePool new];
//    CSQLiteHelper *sql = [[CSQLiteHelper new] autorelease];
//    [sql OpenTable:[[CLogicHelp GetContext].m_szUserPath stringByAppendingPathComponent:@"mdm.db"] flags:SQLITE_OPEN_READWRITE|SQLITE_OPEN_FULLMUTEX];
//    
//    NSString *sqlstr = @"select * from applistTable";
//    if(conditionstr!=nil && NSOrderedSame != [[conditionstr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] compare:@""])
//        sqlstr = [NSString stringWithFormat:@"select * from applistTable where %@", conditionstr];
//    [sql PrepareExecSQL:[sqlstr UTF8String]];
//    
//    (*arlist) = [NSMutableArray new];
//    
//    while([sql SelectRowContinue])
//    {
//        CAppObj *obj = [[CAppObj alloc]init];
//        obj.m_Name = [sql GetFieldNSString:0];
//        obj.m_Identifier = [sql GetFieldNSString:1];
//        obj.m_catagory = [sql GetFieldInt:2];
//        obj.m_ShortVersion = [sql GetFieldNSString:3];
//        obj.m_Version = [sql GetFieldNSString:4];
//        obj.m_BundleSize = [sql GetFieldNSString:5];
//        obj.m_DynamicSize = [sql GetFieldNSString:6];
//        
//        [(*arlist) addObject:obj];
//    }
//    
//    [sql FinalizeStatement];
//    [sql CloseTable];
//    [pool release];
//    return YES;
//}

- (void)open
{
//    NSArray *documentsPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask , YES);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"database/xiecheng.rdb"];
    
//    NSString *databaseFilePath=[[[XCContext GetContext] m_dbpath] stringByAppendingPathComponent:@"xiecheng.rdb"];
    //打开数据库
    if (sqlite3_open([path UTF8String], &database)==SQLITE_OK) {
        NSLog(@"sqlite dadabase is opened.");
    }
    else{ return;}//打开不成功就返回
}

- (void)query:(int)index output:(NSMutableArray **)arlist
{
    NSAutoreleasePool *pool = [NSAutoreleasePool new];
//    char *error;
//    const char *selectSql="select HotelName, ProductId from shopping limit 4";
    NSString *szSQL = @"select HotelName, ProductId from shopping";
    if(index>0)
        szSQL=[NSString stringWithFormat:@"%@ limit %i, 4",szSQL,index];
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [szSQL UTF8String], -1, &statement, nil)==SQLITE_OK) {
        NSLog(@"select operation is ok.");
    }
    else
    {
//        NSLog(@"error: %s",error);
//        sqlite3_free(error);
    }
    (*arlist) = [NSMutableArray new];
    while(sqlite3_step(statement)==SQLITE_ROW) {
//        NSString *name=[[NSString alloc] initWithFormat:@"%s", (char*)sqlite3_column_text(statement, 0)];
        NSString *name = [[NSString alloc] initWithCString:(char*)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
        int _id=sqlite3_column_int(statement, 1);
//        NSLog(@"row>>id %i, name %@",_id,name);
        ShoppingObj *obj = [[ShoppingObj alloc] init];
        obj.m_HotelName = name;
        obj.m_ProductId = _id;
        
        [(*arlist) addObject:obj];
    }
    sqlite3_finalize(statement);
    [pool release];
}

-(void)close
{
    //最后，关闭数据库：
    sqlite3_close(database);
}

-(void)insert
{
    char *error;
//    const char *insertSql="insert into shopping (HoletID, HotelName) values(123, ‘gg’)";
    const char *insertSql="insert into shopping (HotelName, ProductId) values(\"gg\", 1234)";
    if (sqlite3_exec(database, insertSql, NULL, NULL, &error)==SQLITE_OK) {
        NSLog(@"insert operation is ok.");
    }
    
    else
    {
        NSLog(@"error: %s",error);
        sqlite3_free(error);//每次使用完毕清空error字符串，提供给下一次使用
    }
}

@end
