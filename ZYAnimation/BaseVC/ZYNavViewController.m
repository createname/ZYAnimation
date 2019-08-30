//
//  ZYNavViewController.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "ZYNavViewController.h"

@interface ZYNavViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong)TransitionAnimator *animator;
@end

@implementation ZYNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationBar.appearance.backgroundColor = [UIColor whiteColor];
    [UINavigationBar.appearance setTranslucent:NO];
    self.delegate = self;
    //  这句很核心 稍后讲解
    id target = self.interactivePopGestureRecognizer.delegate;
    //  这句很核心 稍后讲解
    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
    //  获取添加系统边缘触发手势的View
    UIView *targetView = self.interactivePopGestureRecognizer.view;
    
    //  创建pan手势 作用范围是全屏
    UIPanGestureRecognizer * fullScreenGes = [[UIPanGestureRecognizer alloc]initWithTarget:target action:handler];
    fullScreenGes.delegate = self;
    [targetView addGestureRecognizer:fullScreenGes];
    
    // 关闭边缘触发手势 防止和原有边缘手势冲突
    [self.interactivePopGestureRecognizer setEnabled:NO];
    
}
//  防止导航控制器只有一个rootViewcontroller时触发手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    //解决与左滑手势冲突
    CGPoint translation = [gestureRecognizer locationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    
    // 过滤执行过渡动画时的手势处理
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    
    return self.childViewControllers.count == 1 ? NO : YES;
}


#pragma mark- UINavigationControllerDelegate

-(void)pushToVC:(UIViewController *)viewController animated:(TransitionAnimator *)animated{
    self.animator = animated;
    [self pushViewController:viewController animated:YES];
}


-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (self.animator) {
        self.animator.operation = operation;
        return self.animator;
    }
    return nil;
}

@end
