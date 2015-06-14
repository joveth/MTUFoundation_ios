//
//  NewsDetailActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/14/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "NewsDetailActivity.h"
#import "Common.h"
#import "CommonData.h"
#import "MBProgressHUD.h"
#import "MainService.h"

@interface NewsDetailActivity ()
@property (weak, nonatomic) IBOutlet UIWebView *theWeb;

@end

@implementation NewsDetailActivity{
    MBProgressHUD *hud;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)loadData{
    if([CommonData shareInstance].url){
        [Common showHUD:@"正在加载" andView:self.view andHUD:hud];
        CGRect frame = [UIScreen mainScreen].applicationFrame;
        
        [MainService getNewsContentWithUrl:[CommonData shareInstance].url andWidth:frame.size.width-20 andSuccess:^(NSString *result) {
            [hud hide:YES];
            if(result){
                [_theWeb loadHTMLString:result baseURL:nil];
                
                 
            }else{
            
             [Common showMessageWithOkButton:@"加载失败了,请稍后再试" andDelegate:self];
            }
        } andErr:^(NSString *result) {
            [hud hide:YES];
             [Common showMessageWithOkButton:@"加载失败了，请稍后再试" andDelegate:self];
        
        }];
    }else{
        [Common showMessageWithOkButton:@"加载失败了" andDelegate:self];
    }
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
