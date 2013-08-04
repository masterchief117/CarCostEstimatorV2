//
//  BSNormalPickerViewController.h
//  CarCostEstimatorV2
//
//  Created by Brent Stewart on 8/2/13.
//  Copyright (c) 2013 Catalyst It Services. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerGenericDelegate
@required

@end

@interface BSNormalPickerViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

-(void) setReturnProperties : (NSString*) storyboardID propertiesOfPicker : (NSArray*) properties keyForUserDefaults : (NSString*) keyForUserDefaults;
@end
