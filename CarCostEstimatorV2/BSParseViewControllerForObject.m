//
//  BSParseViewControllerForObject.m
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/2/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import "BSParseViewControllerForObject.h"

@implementation BSParseViewControllerForObject
NSMutableArray* objects;
Class objectToMatch;


+(NSArray*) findObjectsInView : (UIView*) findObjectsInView requestedObjectType :(Class) requestedObject{
    objects = [[NSMutableArray alloc] init];
    objectToMatch = requestedObject;
    [BSParseViewControllerForObject iterateThroughViewForObject:findObjectsInView];
    return objects;
}

+(void) iterateThroughViewForObject : (UIView*) view {
    if(objectToMatch == [view class]){
        [objects addObject:view];
    }
    for(UIView* nextView in [view subviews]){
        [BSParseViewControllerForObject iterateThroughViewForObject:nextView];
    }
}

            
@end
