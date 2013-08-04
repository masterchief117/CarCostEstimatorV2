//
//  BSSetUserDefaultsUtility.m
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/2/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import "BSSetUserDefaultsUtility.h"

@implementation BSSetUserDefaultsUtility


static bool TextIsValidValue(UITextField* sender);

static const int MAKE = 1;
static const int MODEL = 2;
static const int YEAR = 3;
static const int STYLE = 4;
static const int CAR_PRICE = 5;
static const int INTEREST_RATE = 6;

+(void) addNewCarTextFields : (UITextField*) sender text : (NSString*) text{
    
    NSString* key;
    NSNumber* value = [NSNumber numberWithInt:-1];
    switch (sender.tag) {
        case MAKE:
            key = [BSUserDefaultsStringUtility make];
            break;
        case MODEL:
            key = [BSUserDefaultsStringUtility model];
            break;
        case YEAR:
            if([BSSetUserDefaultsUtility isTextANumber:sender]){
                value = [NSNumber numberWithInt:[sender.text intValue]];
                sender.text = [NSString stringWithFormat:@"%@", value];
            }
            key = [BSUserDefaultsStringUtility year];
            break;
        case STYLE:
            key = [BSUserDefaultsStringUtility style];
            break;
        case CAR_PRICE:
            if([BSSetUserDefaultsUtility isTextANumber:sender]){
                value = [NSNumber numberWithInt:[sender.text doubleValue]];
            }
            key = [BSUserDefaultsStringUtility cost];
            break;
        case INTEREST_RATE:
            if([BSSetUserDefaultsUtility isTextANumber:sender]){
                value = [NSNumber numberWithInt:[sender.text doubleValue]];
            }
            key = [BSUserDefaultsStringUtility interestRate];
            break;
            
        default: NSLog(@"Add new car, tag was not what was expected. :-(");
            break;
    }
        [[NSUserDefaults standardUserDefaults] setObject: ([value intValue] == -1 ? text : value)  forKey:key];
    
}

+ (BOOL) isTextANumber:(UITextField*)sender{
    if ( TextIsValidValue( sender) ) {
    	[sender setTextColor:[UIColor blackColor]];
    	// do something with the value
    } else {
    	[sender setTextColor:[UIColor redColor]];
    }
    return [sender.text isEqualToString: @""] ? false : true;
}

static bool TextIsValidValue(UITextField* sender)
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^(?:|0|[1-9]\\d*)(?:\\.\\d*)?$"] evaluateWithObject:sender.text] ;
}
@end
