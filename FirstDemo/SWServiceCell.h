//
//  SWServiceCell.h
//  yktapp
//
//  Created by 汤成 on 15/1/24.
//  Copyright (c) 2015年 Supwisdom. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NumOfColInRow 4
#define CellMarginX 8
#define CellMarginY 4
#define CellButtonStartTag 1000

@class SWServiceCell;

@protocol SWServiceCellDelegate <NSObject>
@optional
- (void) didButtonTouch:(SWServiceCell *)cell withAction:(NSInteger) action;
@end


@interface SWServiceCell : UITableViewCell
- (void) bindServiceCellList:(NSArray *)serviceList;
@property (nonatomic, assign) id<SWServiceCellDelegate> cellDelegate;

+ (CGFloat) getCellHeight;

@end
