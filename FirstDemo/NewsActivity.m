//
//  NewsActivity.m
//  FirstDemo
//
//  Created by jov jov on 6/3/15.
//  Copyright (c) 2015 jov jov. All rights reserved.
//

#import "NewsActivity.h"

@interface NewsActivity ()

@end

@implementation NewsActivity

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 0;
}
- (IBAction)onBackBtnClick:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
}

@end
