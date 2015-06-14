//
//  NewsActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/3/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "NewsActivity.h"
#import "MainService.h"
#import "MBProgressHUD.h"
#import "NewsBean.h"
#import "NewsCell.h"
#import "MJRefresh.h"
#import "CommonData.h"

@interface NewsActivity ()

@end

@implementation NewsActivity{

    NSMutableArray *items;
    NSInteger pageNo;
    NSString *totalPage;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    pageNo=0;
    items = [[NSMutableArray alloc] init];
//    // 设置文字
//    [self.tableView.footer setTitle:@"加载更多" forState:MJRefreshFooterStateIdle];
//    [self.tableView.footer setTitle:@"正在加载..." forState:MJRefreshFooterStateRefreshing];
//    [self.tableView.footer setTitle:@"没有更多了" forState:MJRefreshFooterStateNoMoreData];
//    [self.tableView.header setTitle:@"下拉刷新" forState:MJRefreshHeaderStateIdle];
//    self.tableView.header.updatedTimeHidden = YES;
//    [self.tableView.header setTitle:@"正在刷新..." forState:MJRefreshHeaderStatePulling];
//
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(items){
        
        return [items count];
    }else{
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
//    static NSString *cellidentifier = @"cellIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
//        cell.backgroundColor = [UIColor whiteColor];
//        cell.tintColor = [UIColor greenColor];
//    }
    
    static NSString *newsCellIdentifier = @"NewsCellId";
    

        UINib *nib = [UINib nibWithNibName:@"NewsCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:newsCellIdentifier];
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:newsCellIdentifier];
    NewsBean *bean = [items objectAtIndex:indexPath.row];
    if(bean){
        cell.title.text =bean.title;
        cell.date.text = bean.date;
        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:bean.img]]];
        
        cell.image.image = image;
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (IBAction)onBackBtnClick:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
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
    [MainService queryNewsWithPageNo:0 andCallBack:^(NSMutableArray *result){
        items=result;
        NewsBean *bean = [items objectAtIndex:0];
        if(bean&&bean.totalPage){
            totalPage = bean.totalPage;
        }
        
        [self.tableView.header endRefreshing];
        self.tableView.footer.hidden=NO;
        [self.tableView reloadData];
        pageNo=0;
    }];
}

-(void)loadMore{
    if(!totalPage){
        totalPage=@"1";
    }
    
    if(pageNo>totalPage.integerValue){
        pageNo = totalPage.integerValue;
        [self.tableView.footer endRefreshing];
        //[self.tableView.footer noticeNoMoreData];
        return;
    }
    pageNo+=1;
    [MainService queryNewsWithPageNo:pageNo andCallBack:^(NSMutableArray *result){
        if(result){
           
            for(int i=0;i<[result count];i++){
                [items addObject:[result objectAtIndex:i]];
            }
        }
        
        [self.tableView.footer endRefreshing];
        [self.tableView reloadData];
    }];

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsBean *bean = [items objectAtIndex:indexPath.row];
    if(bean){
        [CommonData shareInstance].url = bean.url;
        [self performSegueWithIdentifier:@"showNewsDetail" sender:self];
        
    }
}

@end
