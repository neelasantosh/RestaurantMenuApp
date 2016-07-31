//
//  FoodItemTableViewCell.m
//  Restaurant Menu App
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "FoodItemTableViewCell.h"

@implementation FoodItemTableViewCell

@synthesize imageView,itemNameLabel,priceLabel,textQty,delegate,foodItem;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (IBAction)onClickButtonPlus:(id)sender {
    [delegate increaseQty:foodItem.itemId];
}

- (IBAction)onClickButtonMinus:(id)sender {
    [delegate decreaseQty:foodItem.itemId];
}
@end
