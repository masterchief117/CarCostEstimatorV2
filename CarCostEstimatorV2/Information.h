//
//  Information.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/1/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Information : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * averageFuelCost;
@property (nonatomic, retain) NSNumber * duiOnRecord;
@property (nonatomic, retain) NSNumber * milesDrivenPerYear;
@property (nonatomic, retain) NSNumber * ticketsOnRecord;

@end
