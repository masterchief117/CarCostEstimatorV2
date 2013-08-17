//
//  BSMenuScrollViewController.m
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/13/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import "BSMenuScrollViewController.h"
#import "BSCircleMenuViewController.h"

@interface BSMenuScrollViewController ()


@end

@implementation BSMenuScrollViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [_primaryScrollView addSubview:[[BSCircleMenuViewController alloc] init].view];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
