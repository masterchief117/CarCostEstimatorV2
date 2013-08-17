//
//  BSSetUserDefaultsUtility.m
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/2/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import "BSUserDefaultsUtility.h"

@implementation BSUserDefaultsUtility


static bool TextIsValidValue(UITextField* sender);




// In the add car view, for the text fields, will set the values.
// if the values that the
+(void) addNewCarTextFields : (UITextField*) sender text : (NSString*) text{
    
    
    NSString* key;
    NSNumber* value = [NSNumber numberWithInt:-1];

    switch ((carFields)sender.tag) {
        case MAKE:
            key = [BSUserDefaultsStringUtility make];
            break;
        case MODEL:
            key = [BSUserDefaultsStringUtility model];
            break;
        case YEAR:
            if([BSUserDefaultsUtility isTextANumber:(UITextField*)sender]){
                value = [NSNumber numberWithInt:[sender.text intValue]];
                sender.text = [NSString stringWithFormat:@"%@", value];
            }
            key = [BSUserDefaultsStringUtility year];
            break;
        case STYLE:
            key = [BSUserDefaultsStringUtility style];
            break;
        case CAR_PRICE:
            if([BSUserDefaultsUtility isTextANumber:(UITextField*)sender]){
                NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
                [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
                value = [formatter numberFromString:sender.text];
            }
            key = [BSUserDefaultsStringUtility cost];
            break;
        case INTEREST_RATE:
            if([BSUserDefaultsUtility isTextANumber:(UITextField*)sender]){
                NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
                [numberFormatter setPositiveFormat:@"0.00%;0.00%;-0.00%"];
                NSNumber* number = [NSNumber numberWithDouble:[sender.text floatValue] / 100];
                sender.text = [numberFormatter stringFromNumber:number];

                
            }
            key = [BSUserDefaultsStringUtility interestRate];
            break;
            
        default: NSLog(@"Add new car, tag was not what was expected. :-(");
            break;
    }
    [[NSUserDefaults standardUserDefaults] setObject: ([value intValue] == -1 ? text : value)  forKey:key];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:[BSUserDefaultsStringUtility interestRate]]);
}

+(void) addNewCarButtonFields : (UIButton*) sender text : (NSString*) text{
    
    
}

+ (BOOL) isTextANumber:(UITextField*)sender{
    if ( TextIsValidValue( sender) ) {
    	[sender setTextColor:[UIColor blackColor]];
    	// do something with the value
    } else {
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    	[sender setTextColor:[UIColor redColor]];
    }
    return [sender.text isEqualToString: @""] ? false : true;
}

static bool TextIsValidValue(UITextField* sender)
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^(?:|0|[1-9]\\d*)(?:\\.\\d*)?$"] evaluateWithObject:sender.text] ;
}
@end
