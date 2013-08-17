//
//  BSTwitterViewController.m
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/5/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import "BSTwitterViewController.h"

@interface BSTwitterViewController ()

@end

@implementation BSTwitterViewController
SLComposeViewController *twitController;

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
    self.accountStore = [[ACAccountStore alloc]init];
    ACAccountType* twitter = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [self.accountStore requestAccessToAccountsWithType:twitter options:  nil completion:^(BOOL granted, NSError *error) {
        if(granted){
            NSLog(@"Granted!");
        }
        else{
            NSLog(@"Cock-BLOCKED!");
        }
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isConnected) name:ACAccountStoreDidChangeNotification object:nil];
    [self.twitterButton setEnabled:FALSE];
    
}

-(void) isConnected{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        [self.twitterButton setAlpha:1.0f];
        [self.twitterButton setEnabled:TRUE];
        
    }else{
        [self.twitterButton setAlpha:.5f];
        [self.twitterButton setEnabled:FALSE];
    }
}

-(void)twitterTweet:(id)sender{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        twitController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        SLComposeViewControllerCompletionHandler __block handler = ^(SLComposeViewControllerResult result){
            [twitController dismissViewControllerAnimated:YES completion:nil];
            switch(result){
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"cancled");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"worked");
                    break;
                default:
                    NSLog(@"Did not work!");
                    break;
            }
            
        };
        
        NSURL* url = [NSURL URLWithString:@"http://catalystlearns.com"];
        [twitController addURL:url];
        [twitController setCompletionHandler: handler];
        [twitController setInitialText:@"I have this to say about that"];
        
        [self presentViewController:twitController animated:YES completion:nil];
        // Do any additional setup after loading the view.
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
