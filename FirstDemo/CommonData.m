//
//  CommonData.m
//  FirstDemo
//
//  Created by jov jov on 6/13/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "CommonData.h"

@implementation CommonData
@synthesize imageName;
@synthesize title;
@synthesize url;

static CommonData *instance;
+(CommonData *)shareInstance{
    if(instance==nil){
        instance = [[super alloc] init];
    }
    return instance;
}

-(id)init{
    if(self==[super init]){
    }
    return self;
}@end
