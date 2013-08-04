//
//  BSSetUserDefaultsUtility.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/2/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSUserDefaultsStringUtility.h"

@interface BSSetUserDefaultsUtility : NSObject
+(void) addNewCarTextFields : (UITextField*) sender text : (NSString*) text;
@end
