//
//  FoodItemTableViewCell.h
//  Restaurant Menu App
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItem.h"
#import "FoodItemCellDelegate.h"

@interface FoodItemTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UITextField *textQty;



@property FoodItem *foodItem;
@property id<FoodItemCellDelegate> delegate;

- (IBAction)onClickButtonPlus:(id)sender;
- (IBAction)onClickButtonMinus:(id)sender;

@end
