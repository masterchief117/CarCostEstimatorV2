//
//  BSUserDefaultsStringUtility.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/2/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSUserDefaultsStringUtility : NSObject

+(NSString*) make;
+(NSString*) model;
+(NSString*) year;
+(NSString*) style;
+(NSString*) cost;
+(NSString*) interestRate;
+(NSString*) lengthOfLoan;
+(NSString*) yearsOfOwnership;
+(NSString*) typeOfCoverage;
+(NSString*) milesDriven;
+(NSString*) ticketsOnRecord;
+(NSString*) duisOnRecord;
+(NSString*) currentFuelCost;
@end
