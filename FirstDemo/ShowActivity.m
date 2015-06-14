//
//  ShowActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/13/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "ShowActivity.h"
#import "CommonData.h"
#import "MainService.h"
#import "Common.h"
#import "MBProgressHUD.h"


@interface ShowActivity ()
@property (weak, nonatomic) IBOutlet UITextView *theContent;

@end

@implementation ShowActivity{
    MBProgressHUD *hud;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=[CommonData shareInstance].title;
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadData{
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    [Common showHUD:@"正在加载" andView:self.view andHUD:hud];
    [MainService getMainContentWithUrl:[CommonData shareInstance].url andSuccess:^(NSString *result) {
        [hud hide:YES];
        _theContent.text=result;
    } andErr:^(NSString *result) {
        [hud hide:YES];
        [Common showMessageWithOkButton:@"加载失败了，请稍后再试" andDelegate:self];
    }];

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag==12){
        if(buttonIndex==0){
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }
    }
}

@end
