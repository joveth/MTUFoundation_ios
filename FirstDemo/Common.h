//
//  Common.h
//  FirstDemo
//
//  Created by jov jov on 5/27/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface Common : NSObject
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;
+ (BOOL) isEmptyString:(NSString *)string ;
+ (void)showHUD:(NSString *)text andView:(UIView *)view andHUD:(MBProgressHUD *)hud;
+ (void)showMessageWithOkButton:(NSString*) message ;
//+ (void)subString:(NSString*) message ;
+ (void)showMessageWithCancelAndOkButton:(NSString*) message andTag:(NSInteger)tag andDelegate: id ;
+ (void)showMessageWithCancelAndOkButton:(NSString*) message andTag:(NSInteger)tag andDelegate: id andCancelMsg:(NSString *)cancelMsg andOkMsg:(NSString *)okMsg;
+ (void)showMessageWithOkButton:(NSString*) message andDelegate:id;
+(NSString *)getNowDate;
@end
