//
//  SWServiceCell.m
//  yktapp
//
//  Created by 汤成 on 15/1/24.
//  Copyright (c) 2015年 Supwisdom. All rights reserved.
//

#import "SWServiceCell.h"
#import "SWServiceButton.h"
#import "SWServiceDefine.h"

@implementation SWServiceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) initWithStyle:(UITableViewCellStyle) style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initButtons];
    }
    return self;
}

- (void)initButtons {
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    
    CGFloat screenWidth = size.width;
    CGFloat buttonWidth = screenWidth / NumOfColInRow;
    CGFloat xCoor = 0;
    for (NSInteger i = 0; i < NumOfColInRow; ++i) {
        SWServiceButton *btn = [[SWServiceButton alloc] init];
//        btn.frame = CGRectMake(CellMarginX + i * buttonWidth, CellMarginY, buttonWidth - 2 * CellMarginX,
//                               buttonWidth - 2 * CellMarginY);
        btn.frame = CGRectMake(xCoor, CellMarginY, buttonWidth, buttonWidth);
        xCoor += buttonWidth;
        btn.tag = CellButtonStartTag + i;
        [self.contentView addSubview:btn];
    }
    
}

+ (CGFloat) getCellHeight {
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    return size.width / NumOfColInRow;
}

- (void) bindServiceCellList:(NSArray *)serviceList {
    for (NSInteger i = 0; i < NumOfColInRow; ++i) {
        
        SWServiceButton *btn = (SWServiceButton*)[self.contentView viewWithTag:CellButtonStartTag + i];
        if (i < serviceList.count) {
            SWServiceDefine *service = serviceList[i];
            [btn setImage:[UIImage imageNamed:service.serviceIcon] forState:UIControlStateNormal];
            [btn setTitle:service.serviceTitle forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void) buttonTapped:(SWServiceButton *) sender {
    if (_cellDelegate) {
        [_cellDelegate didButtonTouch:self withAction:sender.tag];
    }
}
@end
