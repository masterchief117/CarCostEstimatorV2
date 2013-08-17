//
//  BSAddCarViewController.m
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/1/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import "BSAddCarViewController.h"

@interface BSAddCarViewController ()

@end

@implementation BSAddCarViewController


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
    [self.addCarDataButton setEnabled:NO];
    [self.addCarDataButton setTitle:@"-"];
    
    
    
    // locate all text fields in the view
    // set the delegation to self! so we can runs the "interface" level methods
    for(UITextField* field in[BSParseViewControllerForObject findObjectsInView:self.view requestedObjectType:[UITextField class]]){
        field.delegate = self;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


- (IBAction)textEditFinished:(UITextField *)sender {
    [BSUserDefaultsUtility addNewCarTextFields:sender text:sender.text];
    [[[[[self tabBarController] tabBar] items] objectAtIndex:0] setBadgeValue:@"!"];
}

- (IBAction)viewPicker:(UIButton *)sender {
    const int LOAN_LENGTH = 7;
    const int TOTAL_COVERAGE = 8;
    const int EXPECTED_LIFESPAN = 9;
    const int TOTAL_LOSS = 10;
    NSString* returnController = @"AddNewCarStoryboardID";
    NSArray* array;
    NSString* key;
    switch (sender.tag) {
        case LOAN_LENGTH:
            array = @[@"12_MONTHS", @"24_MONTHS", @"36_MONTHS", @"48_MONTHS", @"60_MONTHS", @"72_MONTHS", @"84_MONTHS"];
            key = [BSUserDefaultsStringUtility lengthOfLoan];
            break;
        case TOTAL_COVERAGE:
            array = @[@"full", @"personal", @"none! ILLEGAL!"];
            key = [BSUserDefaultsStringUtility typeOfCoverage];
            break;
        case EXPECTED_LIFESPAN:
            array = @[@"1 year", @"2 year", @"3 year", @"4 year", @"5 year", @"6 year", @"7 year", @"8 year", @"9 year", @"10 year"];
            key = [BSUserDefaultsStringUtility yearsOfOwnership];
            break;
        case TOTAL_LOSS:
            array = @[@"total", @"year", @"month", @"week", @"day", @"hour 40/week", @"25/week", @"DERIVED DATA"];
            key = nil;
        default:
            NSLog(@"Something went awry AddCarViewController >> viewPicker method. Bad Tag!! :-(");
            break;
    }
    BSNormalPickerViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PickerStoryboardID"];
    [controller setReturnProperties:returnController propertiesOfPicker:array keyForUserDefaults:key];
    [self presentViewController:controller animated:YES completion:^{
        NSLog(@"Presenting the picker");
    }];
}


- (void)viewPickerForObject:(NSString *) nameOfUserDefault dataToChooseFrom : (NSArray*) arrayOfProperties {
    // init the PickerStoryboardID.
    // must use self.storyboard instantiate.. otherwise no way to returns
    // here.
    BSNormalPickerViewController* pickerController = [self.storyboard instantiateViewControllerWithIdentifier:@"PickerStoryboardID"];
    // MUST USE
    [pickerController setReturnProperties:@"AddNewCarStoryboardID" propertiesOfPicker:arrayOfProperties keyForUserDefaults:nameOfUserDefault];
    
    [self presentViewController:pickerController animated:YES completion:^{
        NSLog(@"loading view");
    }];
    
    
    //    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"PickerStoryboardID"] animated:NO completion:^{
    //        NSLog(@"WORKED!");
    //    }];
    //    BSTotalCostViewController* bsT = [self.storyboard instantiateViewControllerWithIdentifier:@"PickerStoryboardID"];
    //    UINavigationController* control = [[UINavigationController alloc ] initWithRootViewController: self.view.window.rootViewController];
    //    [control pushViewController:bsT animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (IBAction)saveData:(UIBarButtonItem *)sender {
}
@end
