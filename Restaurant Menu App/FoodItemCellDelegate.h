//
//  FoodItemCellDelegate.h
//  Restaurant Menu App
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FoodItemCellDelegate <NSObject>


-(void)increaseQty:(int)itemId;
-(void)decreaseQty:(int)itemId;

@end
