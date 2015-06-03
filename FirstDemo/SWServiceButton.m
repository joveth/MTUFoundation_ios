//
//  SWServiceButton.m
//  yktapp
//
//  Created by 汤成 on 15/1/25.
//  Copyright (c) 2015年 Supwisdom. All rights reserved.
//

#import "SWServiceButton.h"
#import "SWDefine.h"

static const CGFloat RImageHeightPercent = 0.6;

@implementation SWServiceButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect) rect andTitle:(NSString*) title andAlignRight:(BOOL) right withImageStyle:(NSInteger) imageStyle andBottomm:(BOOL) bottom
{
    self = [super initWithFrame:rect];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor yellowColor];
        self.titleAlignRight = right;
        self.titleAlignBottom = bottom;
        self.imageStlye = imageStyle;

        CGRect screenRect = [[UIScreen mainScreen] bounds];
        UIFont *buttonTitleFont;
        CGFloat fontSize=14.0f;
        CGFloat fontSizeForSmall=12.0f;
        CGFloat fontRightSize = 16.0f;
        CGFloat fontBigSize  = 18.0f;
        CGFloat edgeSize = 5;
        
        if(screenRect.size.height == 480) //iphone 4s
        {
            fontSize=14.0f;
            fontRightSize = 16.0f;
            fontBigSize  = 18.0f;
            edgeSize = 5;
        }
        if(screenRect.size.height == 568) //iphone 5s
        {
            fontSize=16.0f;
            fontRightSize = 18.0f;
            fontBigSize  = 20.0f;
            edgeSize = 5;
        }
        if (screenRect.size.height  == 667 ) //iphone 6
        {
            fontSize = 18.0f;
            fontRightSize = 20.0f;
            fontBigSize = 22.0f;
            edgeSize  = 20.0f;
            fontSizeForSmall = 14.0f  ;      }
        if(screenRect.size.height == 736)  //iphone 6 plus
        {
            fontSize = 20.0f;
            fontRightSize = 22.0f;
            fontRightSize = 24.0f;
            edgeSize  = 20.0f;
            fontSizeForSmall = 16.0f  ;
        }
        if(right)
        {
            self.titleLabel.textAlignment = NSTextAlignmentRight;
//            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, self.frame.size.width/3.0, 0, 5.0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(edgeSize, 10, edgeSize, self.frame.size.width/2.0+20)];
            buttonTitleFont = [UIFont systemFontOfSize:fontRightSize];
//            self.contentEdgeInsets = UIEdgeInsetsMake(0,0, 0, 10);
        }
        else if(self.imageStlye == IMG_BIG)
        {
            buttonTitleFont = [UIFont systemFontOfSize:fontBigSize];
//            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 40, 0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(edgeSize, 0, self.frame.size.height/3, 0)];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
        }else if(bottom){
            buttonTitleFont = [UIFont systemFontOfSize:fontRightSize];
            //            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 40, 0)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(edgeSize, self.frame.size.width/3, self.frame.size.height/3,  self.frame.size.width/3+edgeSize)];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
        }
        else
        {
            [self setImageEdgeInsets:UIEdgeInsetsMake(edgeSize, 0, self.frame.size.height/3, 0)];
            buttonTitleFont = [UIFont systemFontOfSize:fontSizeForSmall];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
        }
        self.titleLabel.font = buttonTitleFont;
      

        // border
        self.layer.borderWidth = 0.0;
        self.layer.cornerRadius = 0.0;
        self.layer.masksToBounds = YES;
        [self setAdjustsImageWhenHighlighted:NO];
        self.layer.borderColor = [[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1] CGColor];
        
    }
    return self;
}
- (void)setSize
{
    
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height * RImageHeightPercent;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * (1 - RImageHeightPercent);
    if(self.titleAlignRight)
    {
        titleX = -15;
        titleY = 23;
    }
    
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
