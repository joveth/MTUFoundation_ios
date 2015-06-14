//
//  Common.m
//  FirstDemo
//
//  Created by jov jov on 5/27/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "Common.h"
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@implementation Common
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
+ (BOOL) isEmptyString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (void)showHUD:(NSString *)text andView:(UIView *)view andHUD:(MBProgressHUD *)hud
{
    [view addSubview:hud];
    hud.labelText = text;//显示提示
    //hud.dimBackground = YES;//使背景成黑灰色，让MBProgressHUD成高亮显示
    hud.square = YES;//设置显示框的高度和宽度一样
    [hud show:YES];
}

+(void)showMessageWithOkButton:(NSString*) message {
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"确定", nil];
    [view show];
}
+ (void)showMessageWithCancelAndOkButton:(NSString*) message andTag:(NSInteger)tag andDelegate: id{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:id
                                         cancelButtonTitle:@"取消"
                                         otherButtonTitles:@"确定", nil];
    view.tag=tag;
    [view show];
    
}
+ (void)showMessageWithCancelAndOkButton:(NSString*) message andTag:(NSInteger)tag andDelegate: id andCancelMsg:(NSString *)cancelMsg andOkMsg:(NSString *)okMsg{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:id
                                         cancelButtonTitle:cancelMsg
                                         otherButtonTitles:okMsg, nil];
    view.tag=tag;
    [view show];
}
+(void)showMessageWithOkButton:(NSString*) message andDelegate:id{
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:id
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"确定", nil];
    view.tag=12;
    [view show];
}

//yyyy-MM-dd HH:mm
 +(NSString *)getNowDate{
   NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init] ;
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *nowDate = [[NSDate alloc] init];
    NSString *str = [inputFormatter stringFromDate:nowDate];
   return str;
}
@end
