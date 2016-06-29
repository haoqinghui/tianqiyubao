//
//  RTCMasterViewController.m
//  RippleTableViewControllerExample
//
//  Created by Denis Berton
//  Copyright (c) 2013 clooket.com. All rights reserved.
//

#import "RTCTableViewController.h"
#import "HQHTableView.h"

@interface RTCTableViewController () {
    NSMutableArray *_objects;
}
@end

@implementation RTCTableViewController


- (void)viewDidLoad
{
    self.rippleImageName = @"hao.jpg";  //REQUIRED BEFORE CALL [super viewDidLoad]
    [super viewDidLoad];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;    
    self.tableView.rowHeight=736;
    //Test purpose
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.backgroundColor=[UIColor clearColor];
    
    HQHTableView *hqhTView=[[HQHTableView alloc]init];
    [self.tableView addSubview:hqhTView];
    hqhTView.frame=self.tableView.frame;
    hqhTView.dataSource=hqhTView;
    hqhTView.delegate=hqhTView;
    hqhTView.backgroundColor=[UIColor clearColor];
   hqhTView.separatorStyle = UITableViewCellSeparatorStyleNone;
    hqhTView.rowHeight=736;
    
}

#pragma mark - random datasource's values

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]init];
    }
//    NSNumber *number = _objects[indexPath.row];
//    cell.textLabel.text = [number stringValue];
//    cell.textLabel.textColor = [UIColor whiteColor];
    //取消选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}








- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
