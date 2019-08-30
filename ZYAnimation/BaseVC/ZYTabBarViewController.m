//
//  ZYTabBarViewController.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "ZYTabBarViewController.h"
#import "ZYNavViewController.h"
#import "MineViewController.h"
#import "ViewController.h"
#import "TabbarPlusButton.h"
@interface ZYTabBarViewController ()

@end

@implementation ZYTabBarViewController
- (instancetype)init
{
    if (!(self = [super init])) {
        return nil;
    }
    
    CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:[self createTabBarViewControllers] tabBarItemsAttributes:[self createTabBarItemsAttributes]];
    tabBarController.delegate = self;

    self.navigationController.navigationBar.hidden = YES;
    return (self = (ZYTabBarViewController *)tabBarController);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self customizeInterface];
    [TabbarPlusButton registerPlusButton];
}

#pragma mark - 创建标签栏子控制器数组
-(NSArray *)createTabBarViewControllers{
    
    //主页
    ViewController *homeVC = [[ViewController alloc] init];
    ZYNavViewController *homeNaV = [[ZYNavViewController alloc]initWithRootViewController:homeVC];
    
    //我的
    MineViewController *mineVC = [[MineViewController alloc]init];
    ZYNavViewController *mineNaV = [[ZYNavViewController alloc]initWithRootViewController:mineVC];
    
    return @[homeNaV,mineNaV];
}

#pragma mark - 创建标签栏按钮item数组
-(NSArray *)createTabBarItemsAttributes{
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"home",
                            CYLTabBarItemSelectedImage : @"home_select",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"personal",
                            CYLTabBarItemSelectedImage : @"personal_select",
                            };
    
    return @[ dict1, dict2];
}

#pragma mark - 设置tabbar按钮的文字颜色
- (void)customizeInterface {
    
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}
@end
