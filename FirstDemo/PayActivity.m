//
//  PayActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/9/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "PayActivity.h"
#import "Common.h"

@interface PayActivity ()

@end

@implementation PayActivity

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
   self.tableView.tableFooterView=[[UIView alloc]init];
    self.tableView.backgroundColor = [Common colorWithHexString:@"e0e0e0"];
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

//secltion head
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *myHeader = [[UIView alloc] init];
    if(section==0){
        return [[UIView alloc] init];
    }
    UILabel *myLabel = [[UILabel alloc] init];
    [myLabel setFrame:CGRectMake(8, 0, 200, 20)];
    [myLabel setTag:101];
    [myLabel setAlpha:0.5];
    [myLabel setFont: [UIFont fontWithName:@"Arial" size:14]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myHeader setBackgroundColor:[Common colorWithHexString:@"#e0e0e0"]];
    [myLabel setText:[NSString stringWithFormat:@" "]];
    if(section==1){
        [myLabel setText:[NSString stringWithFormat:@"选择支付方式"]];    }
    
    [myHeader addSubview:myLabel];
    
    return myHeader;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        
    }else if(indexPath.section==1){
       
    }else if(indexPath.section==2){
       
    }else if(indexPath.section==3){
        if(indexPath.row==0){
            [self performSegueWithIdentifier:@"showPayId" sender:self];
            //消除cell选择痕迹
            [self performSelector:@selector(deselect) withObject:nil afterDelay:0.1f];
            return;
        }
    }
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.1f];
}
- (void)deselect{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    
}



@end
