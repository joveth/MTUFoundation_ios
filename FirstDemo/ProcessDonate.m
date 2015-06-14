//
//  ProcessDonate.m
//  FirstDemo
//
//  Created by jov jov on 6/13/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "ProcessDonate.h"
#import "CommonData.h"
#import "Common.h"

@interface ProcessDonate ()

@end

@implementation ProcessDonate

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    self.tableView.tableFooterView=[[UIView alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        if(indexPath.row==0){
            [CommonData shareInstance].imageName=@"general.png";
            [CommonData shareInstance].title=@"一般捐赠流程";
            [self performSegueWithIdentifier:@"showProcessId" sender:self];
        }else if(indexPath.row==1){
            [CommonData shareInstance].imageName=@"online.png";
            [CommonData shareInstance].title=@"在线捐赠流程";
            [self performSegueWithIdentifier:@"showProcessId" sender:self];
        }else{
            [Common showMessageWithOkButton:@"请返回到应用主菜单，点击‘我要捐赠‘功能，填写相关信息提交捐赠。"];
        }
    }

}

@end
