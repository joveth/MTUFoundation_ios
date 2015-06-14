//
//  IwantDonateActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/9/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "IwantDonateActivity.h"
#import "Common.h"

@interface IwantDonateActivity ()
@property (weak, nonatomic) IBOutlet UITextField *amountText;
@property (weak, nonatomic) IBOutlet UIImageView *recordIcon;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UITextView *descText;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UILabel *gendarText;
@property (weak, nonatomic) IBOutlet UILabel *isMemLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *telText;
@property (weak, nonatomic) IBOutlet UILabel *unknowLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressText;
@property (weak, nonatomic) IBOutlet UITextField *codeText;
@property (weak, nonatomic) IBOutlet UITextField *workText;


@end

@implementation IwantDonateActivity

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    self.tableView.tableFooterView=[[UIView alloc]init];
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
    [self.tableView addGestureRecognizer:tapGesture];
    tapGesture.cancelsTouchesInView =NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyBoard{
    [_amountText resignFirstResponder];
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
    [myHeader addSubview:myLabel];
    
    return myHeader;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        
    }else if(indexPath.section==1){
        
    }else if(indexPath.section==2){
        
    }else if(indexPath.section==3){
        if(indexPath.row==0){
            if(!_amountText.text){
                [Common showMessageWithOkButton:@"请输入金额"];
                return;
            }
            
            [self performSegueWithIdentifier:@"showPayId" sender:self];
            //消除cell选择痕迹
            [self performSelector:@selector(deselect) withObject:nil afterDelay:0.1f];
            return;
        }else if(indexPath.row==1){
            
        }
    }
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.1f];
}
- (void)deselect{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    
}

@end
