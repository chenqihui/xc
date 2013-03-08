//
//  MapViewController.m
//  XieCheng
//
//  Created by chen on 13-3-6.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

-(void)dealloc{
	[pa release];
    [myMapView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    [self.view setBackgroundColor:[UIColor blueColor]];
    myMapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, [XCContext GetContext].m_rect.size.width * 0.618, [XCContext GetContext].m_rect.size.height)] ;
	myMapView.mapType = MAMapTypeStandard;
    myMapView.delegate = self;
    
    CLLocationCoordinate2D center = {39.91669,116.39716};
    MACoordinateSpan span = {0.04,0.03};
    MACoordinateRegion region = {center,span};
    [myMapView setRegion:region animated:NO];
    [self.view addSubview:myMapView];
    
    myMapView.showsUserLocation = YES; //开启定位
}

- (MAAnnotationView*)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
	MAPinAnnotationView *pinAnnView = [[[MAPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pinAnnView"]autorelease];
	NSLog(@"annotation:%f,%f",annotation.coordinate.latitude,annotation.coordinate.longitude);
	pinAnnView.pinColor = MAPinAnnotationColorGreen;
	pinAnnView.animatesDrop = YES;
	pinAnnView.canShowCallout = YES;
	pinAnnView.draggable = YES;
	return pinAnnView;
}

//在 MAMapViewDelegate 协议中添加了如下回调函数
-(NSString*)keyForMap
{
    return @"041886250e4ea17058086dba46e6c285";
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
{
	[myMapView addAnnotation:userLocation];
}

@end
