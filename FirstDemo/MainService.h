//
//  MainService.h
//  FirstDemo
//
//  Created by jov jov on 6/6/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainService : NSObject
typedef void (^CallBack)(NSArray *result);
typedef void (^CallBackMutable)(NSMutableArray *result);
typedef void (^CallBackString)(NSString *result);

+(void) queryNewsWithPageNo:(NSInteger)pageno andCallBack:(CallBackMutable)callback;
+(void) queryRecendDonateWithPageNo:(NSInteger)pageno andCallBack:(CallBackMutable)callback;
+(void)getMainContentWithUrl:(NSString *)url andSuccess:(CallBackString)success andErr:(CallBackString)err;

+(void)getNewsContentWithUrl:(NSString *)url andWidth:(NSInteger)width andSuccess:(CallBackString)success andErr:(CallBackString)err;


@end
