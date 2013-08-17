//
//  BSCircleMenuViewController.m
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/12/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import "BSCircleMenuViewController.h"

@interface BSCircleMenuViewController ()

@end

@implementation BSCircleMenuViewController
CAShapeLayer* shape;
UIBezierPath* circle;
double swapNumber = -.25;
double circleLocation = 45;
int direction = 1;

UIImageView* bond;
UIView* menuView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self locateAllBSMenuViews];
    menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    
    
    [self.view addSubview:menuView];
    [menuView addSubview:self.transformView];
//    self.ford = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ford-logo.png"]];
    bond = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile.png"]];
    //[self.transformView addSubview:bond];
    [self.transformView addSubview:self.ford];
    
    //    transform.m34 = -1 / 500.0;
    //    transform = CATransform3DRotate(transform, .2, 1, 0, 0);
    //    self.transformView.layer.transform = transform;
    NSTimer* rotate = [NSTimer timerWithTimeInterval:4.1 target:self selector:@selector(flip:) userInfo:nil repeats:YES];
    [rotate fire];
    [[NSRunLoop mainRunLoop] addTimer:rotate forMode:NSDefaultRunLoopMode];
}

-(void) flip : (id) sender{
    direction *= -1;
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.transformView.layer.transform = CATransform3DMakeRotation(M_PI_2,direction, 0, 0);
                     }
                     completion:^(BOOL finished) {
                         if(finished)
                             [self flip:nil];
                     }];
}


- (void)viewWillAppear:(BOOL)animated {
    
    
    //    [super viewWillAppear:animated];
    //
    //    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //    animation.fromValue = [NSNumber numberWithFloat:0];
    //    animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    //    animation.duration = 3.0;
    //    animation.repeatCount = HUGE_VALF;
    //    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //    [self.discView.layer addAnimation:animation forKey:@"transform.rotation.z"];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.ford.layer removeAllAnimations];
}

- (void) locateAllBSMenuViews{
    NSArray* views = [BSParseViewControllerForObject findObjectsInView:self.view requestedObjectType:[BSMenuViews class]];
    for(BSMenuViews* menuViews in views){
//        [menuViews.transform]
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end