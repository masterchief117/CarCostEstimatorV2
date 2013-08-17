//
//  BSSetUserDefaultsUtility.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/2/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSUserDefaultsStringUtility.h"
#import <AudioToolbox/AudioToolbox.h>

@interface BSUserDefaultsUtility : NSObject
+(void) addNewCarTextFields : (UITextField*) sender text : (NSString*) text;

typedef enum carFields{
    MAKE = 1,
    MODEL = 2,
    YEAR = 3,
    STYLE = 4,
    CAR_PRICE = 5,
    INTEREST_RATE = 6,
    LOAN_TIME = 7,
    INSURANCE_COVERAGE = 8,
    EXPECTED_LIFETIME = 9,
    TOTAL_LOSS = 10
}carFields;
@end
