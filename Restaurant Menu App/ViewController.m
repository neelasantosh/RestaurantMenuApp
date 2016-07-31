//
//  ViewController.m
//  Restaurant Menu App
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
#import "FoodItem.h"
#import "FoodItemTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tableViewMenu,arrayFoodItem;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    tableViewMenu.dataSource  = self;
    tableViewMenu.delegate = self;

    FoodItem *item1 = [[FoodItem alloc]init];
    item1.itemId = 1;
    item1.name = @"Coffee";
    item1.price = 50;
    item1.qty = 0;
    item1.imageName = @"coffee.png";
   
    FoodItem *item2 = [[FoodItem alloc]init];
    item2.itemId = 2;
    item2.name = @"Burger";
    item2.price = 120;
    item2.qty = 0;
    item2.imageName = @"burger.png";
   
    FoodItem *item3 = [[FoodItem alloc]init];
    item3.itemId = 3;
    item3.name = @"Pizza";
    item3.price = 350;
    item3.qty = 0;
    item3.imageName = @"pizza.png";
    
    FoodItem *item4 = [[FoodItem alloc]init];
    item4.itemId = 4;
    item4.name = @"Cake";
    item4.price = 500;
    item4.qty = 0;
    item4.imageName = @"cake.png";
    
    
    FoodItem *item5 = [[FoodItem alloc]init];
    item5.itemId = 5;
    item5.name = @"Coke";
    item5.price = 70;
    item5.qty = 0;
    item5.imageName = @"coke.png";
    
    arrayFoodItem = [[NSMutableArray alloc]initWithObjects:item1,item2,item3,item4,item5, nil];
    
    UINib *cellNib = [UINib nibWithNibName:@"FoodItemTableViewCell" bundle:nil];
    [tableViewMenu registerNib:cellNib forCellReuseIdentifier:@"fooditemcell"];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return true;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [arrayFoodItem count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FoodItemTableViewCell *cell = [tableViewMenu dequeueReusableCellWithIdentifier:@"fooditemcell" forIndexPath:indexPath];
    
    FoodItem *item = [arrayFoodItem objectAtIndex:indexPath.row];
    cell.foodItem = item;
    cell.delegate = self;
    cell.itemNameLabel.text = item.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"Rs. %0.2f",item.price];
    cell.textQty.text = [NSString stringWithFormat:@"%d",item.qty];
    cell.imageView.image = [UIImage imageNamed:item.imageName];
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)increaseQty:(int)itemId
{
    NSLog(@"Check :  %d" , itemId);
    for (int i = 0; i < [arrayFoodItem count]; i++) {
        FoodItem *item = [arrayFoodItem objectAtIndex:i];
        if(item.itemId == itemId)
        {
            item.qty = item.qty + 1;
            NSLog(@"Qty :  %d" , item.qty);
            [tableViewMenu reloadData];
            break;
        }
    }
}

-(void)decreaseQty:(int)itemId
{
     NSLog(@"Check :  %d" , itemId);
    for (int i = 0; i < [arrayFoodItem count]; i++) {
        FoodItem *item = [arrayFoodItem objectAtIndex:i];
        if(item.itemId == itemId)
        {
            if (item.qty > 0) {
                item.qty = item.qty - 1;
                NSLog(@"Qty :  %d" , item.qty);
                [tableViewMenu reloadData];
            }
            break;
        }
    }
}

- (IBAction)onClickButtonPlaceOrder:(id)sender {
    
    float totalAmount = 0;
    NSString *msg;
    for (int i = 0; i < [arrayFoodItem count]; i++) {
        FoodItem *item = [arrayFoodItem objectAtIndex:i];
        totalAmount += item.price * item.qty;
    }
    if (totalAmount > 0) {
        msg= [NSString stringWithFormat:@"Total Amount : %0.2f",totalAmount];
    }
    else
    {
        msg = [NSString stringWithFormat:@"No Item Selected"];
    }
    
    UIAlertView *alertPlaceOrder  = [[UIAlertView alloc]initWithTitle:@"Order Status" message:msg delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Place Order", nil];
    alertPlaceOrder.tag = 1;
    [alertPlaceOrder show];
}
@end
