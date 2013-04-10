//
//  SOAPServiceViewController.m
//  XieCheng
//
//  Created by chen on 13-3-9.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "SOAPServiceViewController.h"

#import "MyMD5.h"

@interface SOAPServiceViewController ()<NSXMLParserDelegate,  NSURLConnectionDelegate>//实现两个协议：XML解析、网络连接

@property (strong, nonatomic) NSMutableData *webData;
@property (strong, nonatomic) NSMutableString *soapResults;
@property (strong, nonatomic) NSXMLParser *xmlParser;
@property (nonatomic) BOOL elementFound;
@property (strong, nonatomic) NSString *matchingElement;
@property (strong, nonatomic) NSURLConnection *conn;

@end

@implementation SOAPServiceViewController

@synthesize m_SOAPServiceViewControllerDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)doQuery
{
    NSString* c = [[MyMD5 md5:@"279950C8-CFB7-41CF-ADBE-463C434B0190"] uppercaseString];
    NSString* allianceID = @"6145";
    NSString* sID = @"159687";
    double date = [NSDate timeIntervalSinceReferenceDate];
    NSString* type = @"GroupProductList";
    
    NSString* signature = [[MyMD5 md5:[NSString stringWithFormat:@"%f%@%@%@%@", date, allianceID, c, sID, type]] uppercaseString];
    
//    NSString *number = [NSString stringWithFormat:
//                        @"<Request>"
//                        "<Header AllianceID=\"%@\" SID=\"%@\" TimeStamp=\"%f\" RequestType=\"GroupProductList\" Signature=\"%@\" />"
//                        "<GroupProductListRequest>"
//                        "<BeginDate></BeginDate>"
//                        "<EndDate></EndDate>"
//                        "<KeyWords></KeyWords>"
//                        "<Lowprice></Lowprice>"
//                        "<Upperprice></Upperprice>"
//                        "<City></City>"
//                        "<Topcount>99</Topcount>"
//                        "<SortType></SortType>"
//                        "<ProductType></ProductType>"
//                        "<Rank></Rank>"
//                        "</GroupProductListRequest>"
//                        "</Request>", allianceID, sID, date, signature];
    
    NSString *number = [NSString stringWithFormat:
                       @"&lt;Request&gt;"
                        "&lt;Header AllianceID=\"%@\" SID=\"%@\" TimeStamp=\"%f\" RequestType=\"GroupProductList\" Signature=\"%@\" /&gt;"
                        "&lt;GroupProductListRequest&gt;"
                        "&lt;RequestBody&gt; xmlns:xsi=\"http://www.opentravel.org/OTA/2003/05\" "
                        "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
                        "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
                        "&lt;BeginDate&gt;2013-04-08&lt;/BeginDate&gt;"
                        "&lt;EndDate&gt;2013-04-09&lt;/EndDate&gt;"//
                        "&lt;KeyWords&gt;&lt;/KeyWords&gt;"
                        "&lt;Lowprice&gt;&lt;/Lowprice&gt;"
                        "&lt;Upperprice&gt;130&lt;/Upperprice&gt;"
                        "&lt;City&gt;广州&lt;/City&gt;"
                        "&lt;Topcount&gt;2&lt;/Topcount&gt;"
                        "&lt;SortType&gt;&lt;/SortType&gt;"
                        "&lt;ProductType&gt;&lt;/ProductType&gt;"
                        "&lt;Rank&gt;&lt;/Rank&gt;"
                        "&lt;/RequestBody&gt;"
                        "&lt;/GroupProductListRequest&gt;"
                        "&lt;/Request&gt;", allianceID, sID, date, signature];
    
//    NSString *number = [NSString stringWithFormat:
//                        @"<?xml version=\"1.0\"?>"
//                        "<Request>"
//                        "<Header AllianceID=\"%@\" SID=\"%@\" TimeStamp=\"%f\" RequestType=\"GroupProductList\" Signature=\"%@\" />"
//                        "<GroupProductListRequest>"
//                        "<BeginDate>2012-05-22</BeginDate>"
//                        "<EndDate>2013-03-14</EndDate>"
//                        "<KeyWords>上海</KeyWords>"
//                        "<Lowprice>0</Lowprice>"
//                        "<Upperprice>8000</Upperprice>"
//                        "<City>上海</City>"
//                        "<Topcount>99</Topcount>"
//                        "<SortType>1</SortType>"
//                        "<ProductType>1</ProductType>"
//                        "<Rank>0</Rank>"
//                        "</GroupProductListRequest>"
//                        "</Request>", allianceID, sID, date, signature];
    
    NSString *soapMsg = [NSString stringWithFormat:
                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                         "<soap:Envelope "
                         "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
                         "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
                         "xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                         "<soap:Body>"
                         "<Request xmlns=\"http://ctrip.com/\">"
                         "<requestXML>%@</requestXML>"
                         "</Request>"
                         "</soap:Body>"
                         "</soap:Envelope>", number];
    
//    NSString *soapMsg = [NSString stringWithFormat:
//                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
//                         "<soap12:Envelope "
//                         "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
//                         "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
//                         "xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\">"
//                         "<soap:Body>"
//                         "<Request xmlns=\"http://ctrip.com/\">"
//                         "<requestXML>%@</requestXML>"
//                         "</Request>"
//                         "</getMobileCodeInfo>"
//                         "</soap:Body>"
//                         "</soap:Envelope>", number];
    
    // 将这个XML字符串打印出来
//    NSLog(@"%@", soapMsg);
    // 创建URL，内容是前面的请求报文报文中第二行主机地址加上第一行URL字段
    NSURL *url = [NSURL URLWithString: @"http://OpenAPI.ctrip.com/Tuan/GroupProductList.asmx"];
    // 根据上面的URL创建一个请求
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMsg length]];
    // 添加请求的详细信息，与请求报文前半部分的各字段对应
    [req addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    [req addValue:@"\"http://ctrip.com/Request\"" forHTTPHeaderField:@"SOAPAction"];
    // 设置请求行方法为POST，与请求报文第一行对应
    [req setHTTPMethod:@"POST"];
    // 将SOAP消息加到请求中
    [req setHTTPBody: [soapMsg dataUsingEncoding:NSUTF8StringEncoding]];
    // 创建连接
    self.conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (self.conn) {
        self.webData = [NSMutableData data];
    }
}


//连接

#pragma mark URL Connection Data Delegate Methods

// 刚开始接受响应时调用
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response{
    [self.webData setLength: 0];
}

// 每接收到一部分数据就追加到webData中
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *) data {
    [self.webData appendData:data];
}

// 出现错误时
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *) error {
    self.conn = nil;
    self.webData = nil;
}

// 完成接收数据时调用
-(void) connectionDidFinishLoading:(NSURLConnection *) connection {
    NSString *theXML = [[NSString alloc] initWithBytes:[self.webData mutableBytes]
                                                length:[self.webData length]
                                              encoding:NSUTF8StringEncoding];
    
    // 打印出得到的XML
    NSLog(@"??:%@", theXML);
    NSLog(@"end");
    // 使用NSXMLParser解析出我们想要的结果
//    self.xmlParser = [[NSXMLParser alloc] initWithData: self.webData];
//    [self.xmlParser setDelegate: self];
//    [self.xmlParser setShouldResolveExternalEntities: YES];
//    [self.xmlParser parse];
    
    if([m_SOAPServiceViewControllerDelegate respondsToSelector:@selector(doFinish:)]==YES)
        [m_SOAPServiceViewControllerDelegate doFinish:nil];
    
}

@end
