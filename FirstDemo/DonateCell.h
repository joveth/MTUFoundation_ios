//
//  DonateCell.h
//  FirstDemo
//
//  Created by jov jov on 6/7/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonateCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *item;
@property (weak, nonatomic) IBOutlet UILabel *amount;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end
