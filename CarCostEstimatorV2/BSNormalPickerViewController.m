//
//  BSNormalPickerViewController.m
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/2/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import "BSNormalPickerViewController.h"

@interface BSNormalPickerViewController ()

@end

@implementation BSNormalPickerViewController


UIPickerView* picker;
UIButton* returnButton;
NSArray* pickerArray;
NSString* key;
NSString* returnView;
UIView* view;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) setReturnProperties : (NSString*) storyboardID propertiesOfPicker : (NSArray*) properties keyForUserDefaults : (NSString*) keyForUserDefaults{
    if(self){
        pickerArray = properties;
        returnView = storyboardID;
        key = keyForUserDefaults;
        [self setSubviews];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    view = [[UIView alloc] initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [view addSubview:picker];
    [view addSubview:returnButton];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// How many Options will be displayed in a picker view
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
//
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return pickerArray.count;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(key)
    [[NSUserDefaults standardUserDefaults] setObject:[pickerArray objectAtIndex:row ] forKey:key];
}

-(void) setSubviews{
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 120, 320, 120)];
    picker.delegate = self;
    returnButton = [[UIButton alloc] initWithFrame:CGRectMake(124, 390, 73, 44)];
    [returnButton addTarget:self action:@selector(returnToPreviousView:) forControlEvents:UIControlEventTouchUpInside];
    [returnButton setTitle:@"Return" forState:UIControlStateNormal];
    [returnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

-(void)returnToPreviousView: (id) sender{
    UITabBarController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
    [controller setSelectedIndex:0];
    [self presentViewController:controller animated:YES completion:^{
        NSLog(@"GoodJobs");
    }];
    
}


@end
