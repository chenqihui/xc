//
//  MapViewController.h
//  XieCheng
//
//  Created by chen on 13-3-6.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "XCBaseViewController.h"
#import "MAMapKit.h"

@interface MapViewController : XCBaseViewController<MAMapViewDelegate>
{
    MAMapView *myMapView;
	MAPointAnnotation *pa;
}

@end
