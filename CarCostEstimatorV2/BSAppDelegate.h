//
//  BSAppDelegate.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/1/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BSCircleMenuViewController.h"

@interface BSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) BSCircleMenuViewController *viewController;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
