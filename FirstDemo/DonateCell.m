//
//  DonateCell.m
//  FirstDemo
//
//  Created by jov jov on 6/7/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "DonateCell.h"

@implementation DonateCell
@synthesize name;
@synthesize amount;
@synthesize item;
@synthesize date;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
