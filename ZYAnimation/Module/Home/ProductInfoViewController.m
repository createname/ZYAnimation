//
//  ProductInfoViewController.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "ProductInfoViewController.h"
#import "ProductDetailCell.h"

@interface ProductInfoViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation ProductInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[ProductDetailCell class] forCellReuseIdentifier:@"ProductDetailCell"];
    [self.view addSubview:_tableView];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [_tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [_tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [_tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}
-(void)setImage:(UIImage *)image{
    [super setImage:image];
    [self.tableView reloadData];
}
#pragma mark-
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UIScreen.mainScreen.bounds.size.width;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductDetailCell"];
    cell.backImageView.image = self.transitionImage;
    return cell;
}
@end
