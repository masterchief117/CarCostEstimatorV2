//
//  Car.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/1/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Car : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * cost;
@property (nonatomic, retain) NSDecimalNumber * interestRate;
@property (nonatomic, retain) NSString * manufacturer;
@property (nonatomic, retain) NSNumber * monthlyLoanLength;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * style;
@property (nonatomic, retain) NSString * typeOfCoverageRequired;
@property (nonatomic, retain) NSNumber * year;
@property (nonatomic, retain) NSNumber * yearsOfOwnership;

@end
