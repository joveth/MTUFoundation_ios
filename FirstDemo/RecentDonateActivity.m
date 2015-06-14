//
//  RecentDonateActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/7/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "RecentDonateActivity.h"
#import "MainService.h"
#import "DonateCell.h"
#import "ThankBean.h"
#import "MJRefresh.h"

@interface RecentDonateActivity ()

@end

@implementation RecentDonateActivity{
    NSMutableArray *items;
    NSInteger pageNo;
    NSString *totalPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    pageNo=0;
    items = [[NSMutableArray alloc] init];
    
    self.tableView.tableFooterView=[[UIView alloc]init];
    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    [self.tableView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [items count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    static NSString *newsCellIdentifier = @"DonateCellId";

        UINib *nib = [UINib nibWithNibName:@"DonateCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:newsCellIdentifier];
    
    DonateCell *cell = [tableView dequeueReusableCellWithIdentifier:newsCellIdentifier];
    ThankBean *bean = [items objectAtIndex:indexPath.row];
    if(bean){
        cell.name.text = bean.username;
        cell.date.text = bean.date;
        cell.amount.text = bean.amount;
        cell.item.text =bean.item;
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
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
-(void)loadData{
    self.tableView.footer.hidden=YES;
    [MainService queryRecendDonateWithPageNo:0 andCallBack:^(NSMutableArray *result){
        items=result;
        ThankBean *bean = [items objectAtIndex:0];
        if(bean&&bean.totalPage){
            totalPage = bean.totalPage;
        }
        
        [self.tableView.header endRefreshing];
        pageNo=0;
        self.tableView.footer.hidden=NO;
        [self.tableView reloadData];
    }];
}

-(void)loadMore{
    if(!totalPage){
        totalPage=@"1";
    }
    
    NSLog(@"pageNobef=%d,total=%@",pageNo,totalPage);
    if(pageNo>totalPage.integerValue){
        pageNo = totalPage.integerValue;
        [self.tableView.footer endRefreshing];
        //[self.tableView.footer noticeNoMoreData];
        return;
    }
    //self.tableView.footer.hidden=NO;
    pageNo+=1;
    NSLog(@"pageNo=%d,totalPage=%@",pageNo,totalPage);
    [MainService queryRecendDonateWithPageNo:pageNo andCallBack:^(NSMutableArray *result){
        if(result){
            
            for(int i=0;i<[result count];i++){
                [items addObject:[result objectAtIndex:i]];
            }
        }
        
        [self.tableView.footer endRefreshing];
        //self.tableView.footer.hidden=YES;
        [self.tableView reloadData];
    }];
    
}

@end
