//
//  SWServiceDefine.h
//  yktapp
//
//  Created by 汤成 on 15/1/25.
//  Copyright (c) 2015年 Supwisdom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWServiceDefine : NSObject

@property (nonatomic, copy) NSString *serviceTitle;
@property (nonatomic, copy) NSString *serviceIcon;
@property (nonatomic, copy) NSString *position;
@property (nonatomic,copy) NSString *backColor;
@property NSInteger row;
@property NSInteger width;
@property NSInteger height;
@property NSInteger serviceId;

//- (id) initWithParameters:(NSString *)_serviceId title:(NSString *)_title icon:(NSString *)_icon;

@end
