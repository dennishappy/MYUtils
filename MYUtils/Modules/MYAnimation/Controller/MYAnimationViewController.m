//
//  MYAnimationViewController.m
//  MYUtils
//
//  Created by Michael on 2017/9/12.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

#import "MYAnimationViewController.h"
#import "MYActionSheet.h"
#import "MYTestViewController.h"
#import "MYCustomTransitionViewController.h"

@interface MYAnimationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation MYAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIKitDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.dataSource addObject:@"有多种自定义动画效果的下拉菜单-MYIGLDemoViewController"];
    [self.dataSource addObject:@"自定义转场动画-MYCustomTransitionViewController"];
    [self.dataSource addObject:@"左右滑动列表cell-MGSwipeTableCellDemo"];
    [self.dataSource addObject:@"*原生UI控件替代方案-TYGUIListTableViewController"];
    [self.dataSource addObject:@"*Progress进度条-TYGProgressTableViewController"];
    [self.dataSource addObject:@"*启动引导-TYGLoadingTableViewController"];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.0f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 0.01f;
    }
    return 10.00f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = [self.dataSource objectAtIndex:indexPath.row];
    NSString *className = [[title componentsSeparatedByString:@"-"] lastObject];
    
    UIViewController *viewController = [[NSClassFromString(className) alloc] init];
    viewController.title = [[title componentsSeparatedByString:@"-"] firstObject];
   
    [self.navigationController pushViewController:viewController animated:YES];
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
