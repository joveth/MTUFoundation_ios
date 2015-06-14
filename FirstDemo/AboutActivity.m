//
//  AboutActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/13/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "AboutActivity.h"
#import "CommonData.h"

@interface AboutActivity ()

@end

@implementation AboutActivity


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
            [CommonData shareInstance].title=@"基金会简介";
            [CommonData shareInstance].url=@"http://edf.shmtu.edu.cn/about/about.htm";
            [CommonData shareInstance].imageName=nil;
        }else if(indexPath.row==1){
            [CommonData shareInstance].title=@"基金会章程";
            [CommonData shareInstance].url=@"http://edf.shmtu.edu.cn/about/consitution.htm";
            [CommonData shareInstance].imageName=nil;
        
        }else if(indexPath.row==2){
            [CommonData shareInstance].title=@"基金会登记决定书";
            [CommonData shareInstance].imageName=@"jijin.png";
            [self performSegueWithIdentifier:@"showTheAboutId" sender:self];
            return;
        }else if(indexPath.row==3){
            [CommonData shareInstance].title=@"组织架构";
            [CommonData shareInstance].url=@"http://edf.shmtu.edu.cn/articles/53.htm";
            [CommonData shareInstance].imageName=nil;
        }
    }else{
        if(indexPath.row==0){
            [CommonData shareInstance].title=@"接受捐赠管理办法";
            [CommonData shareInstance].url=@"http://edf.shmtu.edu.cn/articles/58.htm";
            
            
        }else if(indexPath.row==1){
            
            [CommonData shareInstance].title=@"捐赠项目管理办法";
            [CommonData shareInstance].url=@"http://edf.shmtu.edu.cn/articles/54.htm";
        }else if(indexPath.row==2){
            [CommonData shareInstance].title=@"捐赠资金管理办法";
            [CommonData shareInstance].url=@"http://edf.shmtu.edu.cn/articles/55.htm";        }
    }
    [self performSegueWithIdentifier:@"showContentId" sender:self];
}


@end
