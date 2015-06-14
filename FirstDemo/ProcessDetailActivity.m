//
//  ProcessDetailActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/13/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "ProcessDetailActivity.h"
#import "CommonData.h"

@interface ProcessDetailActivity ()
@property (weak, nonatomic) IBOutlet UIImageView *theImage;

@end

@implementation ProcessDetailActivity

- (void)viewDidLoad {
    [super viewDidLoad];
    if(![CommonData shareInstance].imageName){
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    self.title=[CommonData shareInstance].title;
    _theImage.image=[UIImage imageNamed:[CommonData shareInstance].imageName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
