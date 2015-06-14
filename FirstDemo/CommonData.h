//
//  CommonData.h
//  FirstDemo
//
//  Created by jov jov on 6/13/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonData : NSObject{
    NSString *_imageName;
    NSString *_title;
    NSString *_url;
}

@property(atomic,retain) NSString *imageName;
@property(atomic,retain) NSString *title;
@property(atomic,retain) NSString *url;


+(CommonData *) shareInstance;

@end
