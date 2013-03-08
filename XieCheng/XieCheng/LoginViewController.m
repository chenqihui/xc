//
//  LoginViewController.m
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UITableView *table = [[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width) style:UITableViewStyleGrouped] autorelease];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundView = nil;
//    [table setScrollEnabled:NO];
    
    [self.view addSubview:table];
    
    [self.view setBackgroundColor:[UIColor blueColor]];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 1)
        return 2;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"applistcell"];
    if (indexPath.section == 2)
    {
        if(cell==nil)
        {
            cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:@"applistcell"]autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.backgroundView=[[[UIView alloc]initWithFrame:CGRectMake(0,0,0,0)]autorelease];
            UIButton* btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame=CGRectMake(0,0,self.view.frame.size.width - 20,44);
            [btn setTitle:@"登录" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setBackgroundImage:[[UIImage imageNamed:@"btn_smsok.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:0] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
            
//            m_indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//            m_indicatorView.frame = CGRectMake(260,0,20,44);
//            [btn addSubview:m_indicatorView];
//            m_indicatorView.hidden = YES;
            
            [cell.contentView addSubview:btn];
        }
        return cell;
    }
    if(cell==nil)
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellSelectionStyleNone reuseIdentifier:@"applistcell"]autorelease];
        
        UILabel *label = [[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 255, 44)] autorelease];
        label.backgroundColor = [UIColor clearColor];
        label.tag = 500;
        UIFont *font = [UIFont systemFontOfSize:20];
        label.font = font;
        [cell.contentView addSubview:label];
        
        UITextField *myTextField = [[UITextField alloc] initWithFrame:CGRectMake(160, 10, 120, 44)];
        myTextField.placeholder = @"请输入";
        //        myTextField.font = [UIFont systemFontOfSize:16.0f];
        myTextField.textAlignment = 2;
        myTextField.returnKeyType = UIReturnKeyDone;
        myTextField.delegate = self;
        [cell.contentView  addSubview:myTextField];
        
    }
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:500];
    if(indexPath.section==0)
    {
        label.text = [NSString stringWithFormat:@"企业ID"];
    }
    else if(indexPath.section==1)
    {
        if(indexPath.row==0)
        {
            label.text = @"帐号";
        }
        else if(indexPath.row==1)
        {
            label.text = @"密码";
        }
    }
    //设置行的样式：此为无，默认是点击变蓝
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 50;
    }
    return 12;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

@end
