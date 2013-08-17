//
//  BSCircleMenuViewController.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/12/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSMenuViews.h"
#import "BSParseViewControllerForObject.h"

@interface BSCircleMenuViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *ford;
@property (strong, nonatomic) IBOutlet UIView *mainMenu;
@property (strong, nonatomic) IBOutlet BSMenuViews *bondView;
@property (strong, nonatomic) IBOutlet BSMenuViews *transformView;
@end
