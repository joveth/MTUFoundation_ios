//
//  UserTableViewController.m
//  FirstDemo
//
//  Created by jov jov on 5/27/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "UserTableViewController.h"

@interface UserTableViewController ()

@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView=[[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
