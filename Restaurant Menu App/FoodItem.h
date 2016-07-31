//
//  FoodItem.h
//  Restaurant Menu App
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodItem : NSObject

@property int itemId;
@property NSString *name,*imageName;
@property float price;
@property int qty;

@end
