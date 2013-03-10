//
//  XCRootViewController.m
//  XieCheng
//
//  Created by chen on 13-3-2.
//  Copyright (c) 2013年 chen. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>

#import "XCRootViewController.h"

@interface XCRootViewController ()

@end

@implementation XCRootViewController

@synthesize shadeView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    m_mainViewController = [[MainViewController alloc] initWithFrame:[XCContext GetContext].m_rect];
    
    shadeView = [[UIView alloc] initWithFrame:[XCContext GetContext].m_rect];
    shadeView.backgroundColor = [UIColor blackColor];
    shadeView.userInteractionEnabled = YES;
    shadeView.alpha = 0;

    m_naviViewController = [[NavigationViewController alloc] initWithFrame:CGRectMake(-[XCContext GetContext].m_rect.size.width * 0.618, 0, [XCContext GetContext].m_rect.size.width * 0.618, [XCContext GetContext].m_rect.size.height)];
    
//    m_mapViewController = [[MapViewController alloc] initWithFrame:CGRectMake([XCContext GetContext].m_rect.size.width * 1.618, 0, [XCContext GetContext].m_rect.size.width * 0.618, [XCContext GetContext].m_rect.size.height)];
    
    [self orientationChanged];
    [self.view addSubview:m_mainViewController.view];
    [self.view addSubview:shadeView];
    [self.view addSubview:m_naviViewController.view];
//    [self.view addSubview:m_mapViewController.view];
    
    UISwipeGestureRecognizer *leftFingerSwipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showNaviView:)];
    [leftFingerSwipeUp setDirection:UISwipeGestureRecognizerDirectionRight];
    [m_mainViewController.view addGestureRecognizer:leftFingerSwipeUp];
    
    UISwipeGestureRecognizer *rightFingerSwipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showMapView:)];
    [rightFingerSwipeUp setDirection:UISwipeGestureRecognizerDirectionLeft];
    [m_mainViewController.view addGestureRecognizer:rightFingerSwipeUp];
    
    UITapGestureRecognizer *enterFingerSwipeUp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(undoAction:)];
    [enterFingerSwipeUp setNumberOfTapsRequired:1];
    [shadeView addGestureRecognizer:enterFingerSwipeUp];
    
    [leftFingerSwipeUp release];
    [rightFingerSwipeUp release];
    [enterFingerSwipeUp release];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(undoAction:) name:UNDOACTION object:nil];
    
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (IBAction)showNaviView:(id)sender
{ 
    m_angle = -300;
    [UIView animateWithDuration:0.3 animations:^{
        m_naviViewController.view.frame = CGRectMake(0, 0, m_naviViewController.view.frame.size.width , m_naviViewController.view.frame.size.height);
        
        CALayer *layer = m_mainViewController.view.layer;
        layer.zPosition = -4000;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / m_angle;
        layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, 10.0f * M_PI / 180.0f, 0.0f, 1.0f, 0.0f);
        
        shadeView.alpha = 0.35;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            m_mainViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
            
            shadeView.alpha = 0.5;
        }];
    }];
}

- (IBAction)showMapView:(id)sender
{
    m_angle = 300;
    [UIView animateWithDuration:0.3 animations:^{
        m_mapViewController.view.frame = CGRectMake([XCContext GetContext].m_rect.size.width * (1 - 0.618), 0, m_mapViewController.view.frame.size.width, m_mapViewController.view.frame.size.height);
        
        CALayer *layer = m_mainViewController.view.layer;
        layer.zPosition = -4000;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / m_angle;
        layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, 10.0f * M_PI / 180.0f, 0.0f, 1.0f, 0.0f);
        
        shadeView.alpha = 0.35;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            m_mainViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
            
            shadeView.alpha = 0.5;
        }];
    }];
}

- (IBAction)undoAction:(id)sender
{
    m_mainViewController.view.userInteractionEnabled=YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CALayer *layer = m_mainViewController.view.layer;
        layer.zPosition = -4000;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -m_angle;
        layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, -10.0f * M_PI / 180.0f, 0.0f, 1.0f, 0.0f);
        
        shadeView.alpha = 0.35;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            m_mainViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
            
            shadeView.alpha = 0.0;
            if (m_angle < 0)
                m_naviViewController.view.frame = CGRectMake(-[XCContext GetContext].m_rect.size.width*0.618, 0, m_naviViewController.view.frame.size.width, m_naviViewController.view.frame.size.height);
            else
                m_mapViewController.view.frame = CGRectMake([XCContext GetContext].m_rect.size.width*1.618, 0, m_mapViewController.view.frame.size.width, m_mapViewController.view.frame.size.height);
        }];
    }];
}

- (void)SwitchView:(int)viewID
{
    [m_mainViewController SwitchView:viewID];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UNDOACTION object:nil];
    
    [m_mainViewController release];
    [shadeView release];
    [m_naviViewController release];
    [m_mapViewController release];
    
    [super dealloc];
}

// Manually handles orientation changes on iPhone
- (void)orientationChanged
{
    UIInterfaceOrientation o = (UIInterfaceOrientation)[[UIApplication sharedApplication] statusBarOrientation];
    CGFloat angle = 0;
    switch (o) {
        case UIDeviceOrientationLandscapeLeft: angle = 90; break;
        case UIDeviceOrientationLandscapeRight: angle = -90; break;
        case UIDeviceOrientationPortraitUpsideDown: angle = 180; break;
        default: break;
    }
    
    CGRect f = [[UIScreen mainScreen] applicationFrame];
    
    // Swap the frame height and width if necessary
    if (UIDeviceOrientationIsLandscape(o)) {
        CGFloat t;
        t = f.size.width;
        f.size.width = f.size.height;
        f.size.height = t;
    }
    
    CGAffineTransform previousTransform = self.view.layer.affineTransform;
    CGAffineTransform newTransform = CGAffineTransformMakeRotation((CGFloat)(angle * M_PI / 180.0));
    
    // Reset the transform so we can set the size
    self.view.layer.affineTransform = CGAffineTransformIdentity;
    self.view.frame = (CGRect){ { 0, 0 }, f.size};
    
    // Revert to the previous transform for correct animation
    self.view.layer.affineTransform = previousTransform;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    
    // Set the new transform
    self.view.layer.affineTransform = newTransform;
    
    // Fix the view origin
    self.view.frame = (CGRect){ { f.origin.x, f.origin.y },self.view.frame.size};
    [UIView commitAnimations];
}

//- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//{
//    m_naviViewController = [[NavigationViewController alloc] initWithFrame:CGRectMake(-[XCContext GetContext].m_rect.size.width * 0.618, 0, [XCContext GetContext].m_rect.size.width * 0.618, [XCContext GetContext].m_rect.size.height)];
//    
//    m_mapViewController = [[MapViewController alloc] initWithFrame:CGRectMake([XCContext GetContext].m_rect.size.width * 1.618, 0, [XCContext GetContext].m_rect.size.width * 0.618, [XCContext GetContext].m_rect.size.height)];
//}

@end
