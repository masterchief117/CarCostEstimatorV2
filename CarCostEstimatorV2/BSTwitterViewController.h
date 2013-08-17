//
//  BSTwitterViewController.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/5/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
@interface BSTwitterViewController : UIViewController

-(void) isConnected;
-(IBAction)twitterTweet : (id) sender;
@property (strong, nonatomic) IBOutlet UIButton *twitterButton;
@property (strong, nonatomic) ACAccountStore* accountStore;

@end
