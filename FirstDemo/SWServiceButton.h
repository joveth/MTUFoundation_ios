//
//  SWServiceButton.h
//  yktapp
//
//  Created by 汤成 on 15/1/25.
//  Copyright (c) 2015年 Supwisdom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWServiceButton : UIButton
{
    CGRect boundingRect;
}
- (id)initWithFrame:(CGRect) rect andTitle:(NSString*) title andAlignRight:(BOOL) right withImageStyle:(NSInteger) imageStyle andBottomm:(BOOL) bottom;
@property BOOL titleAlignRight;
@property BOOL titleAlignBottom;
@property NSInteger imageStlye;
@end
