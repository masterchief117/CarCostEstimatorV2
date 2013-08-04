//
//  BSUserDefaultsStringUtility.m
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/2/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import "BSUserDefaultsStringUtility.h"

@implementation BSUserDefaultsStringUtility

static NSString* make;
static NSString* model;
static NSString* year;
static NSString* style;
static NSString* cost;
static NSString* interestRate;
static NSString* lengthOfLoan;
static NSString* yearsOfOwnership;
static NSString* typeOfCoverage;
static NSString* milesDriven;
static NSString* ticketsOnRecord;
static NSString* duisOnRecord;
static NSString* currentFuelCost;

+(void)initialize{
    make = @"make of the car";
    model = @"model of the car";
    year = @"year car was made";
    style = @"style of the car";
    cost = @"cost of the car";
    interestRate = @"interest rate for this car";
    lengthOfLoan = @"length of loan required for this car";
    yearsOfOwnership = @"expected years of ownership for this car";
    typeOfCoverage = @"type of insurance coverage for the car";
    milesDriven = @"exptected miles the user is going to drive";
    ticketsOnRecord = @"current amount of tickets the DMV would have on record";
    duisOnRecord = @"current amount of DUI's the DMV would have on your record";
    currentFuelCost = @"current cost of fuel";
}


+(NSString*) make{
    return make;
}
+(NSString*) model{
    return model;
};
+(NSString*) year{
    return year;
}
+(NSString*) style{
    return style;
}
+(NSString*) cost{
    return cost;
}
+(NSString*) interestRate{
    return interestRate;
}
+(NSString*) lengthOfLoan{
    return lengthOfLoan;
}
+(NSString*) yearsOfOwnership{
    return yearsOfOwnership;
}
+(NSString*) typeOfCoverage{
    return typeOfCoverage;
}
+(NSString*) milesDriven{
    return milesDriven;
}
+(NSString*) ticketsOnRecord{
    return ticketsOnRecord;
}
+(NSString*) duisOnRecord{
    return duisOnRecord;
}
+(NSString*) currentFuelCost{
    return currentFuelCost;
}

@end
