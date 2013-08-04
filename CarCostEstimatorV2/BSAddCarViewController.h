//
//  BSAddCarViewController.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/1/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSNormalPickerViewController.h"
#import "BSUserDefaultsStringUtility.h"
#import "BSSetUserDefaultsUtility.h"
#import "BSParseViewControllerForObject.h"

@interface BSAddCarViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *makeTextField;
@property (strong, nonatomic) IBOutlet UITextField *modelTextField;
@property (strong, nonatomic) IBOutlet UITextField *yearTextField;
@property (strong, nonatomic) IBOutlet UITextField *styleTextField;
@property (strong, nonatomic) IBOutlet UITextField *carPriceTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestRateTextField;
@property (strong, nonatomic) IBOutlet UIButton *loanTimeButton;
@property (strong, nonatomic) IBOutlet UIButton *totalCoverageButton;
@property (strong, nonatomic) IBOutlet UIButton *expectedLifespanButton;
@property (strong, nonatomic) IBOutlet UILabel *totalCostText;
@property (strong, nonatomic) IBOutlet UIButton *totalLossButton;

- (IBAction)textEditFinished:(UITextField *)sender;

- (IBAction)viewPicker:(UIButton *)sender;

- (IBAction)saveData:(UIBarButtonItem *)sender;

@end
