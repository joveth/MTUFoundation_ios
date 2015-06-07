//
//  NewsCell.h
//  FirstDemo
//
//  Created by jov jov on 6/7/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextView *title;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end
