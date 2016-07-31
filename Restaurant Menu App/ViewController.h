//
//  ViewController.h
//  Restaurant Menu App
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItemCellDelegate.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,FoodItemCellDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableViewMenu;
@property NSMutableArray *arrayFoodItem;

- (IBAction)onClickButtonPlaceOrder:(id)sender;

@end

