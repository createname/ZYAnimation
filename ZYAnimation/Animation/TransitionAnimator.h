//
//  TransitionAnimator.h
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

/**
 转场时间
 */
@property (nonatomic, assign)NSTimeInterval duration;

/**
 转场的上下文
 */
@property (nonatomic, assign)id <UIViewControllerContextTransitioning> context;

/**
 源控制器
 */
@property (nonatomic, strong)UIViewController *fromViewController;
/**
 目标控制器
 */
@property (nonatomic, strong)UIViewController *toViewController;

/**
 源控制器的view
 */
@property (nonatomic, strong)UIView *fromView;
/**
 目标控制器的view
 */
@property (nonatomic, strong)UIView *toView;

/**
 进行动画过度的场所的view
 */
@property (nonatomic, strong)UIView *contaionerView;

/**
 转场方式
 */
@property (nonatomic, assign)UINavigationControllerOperation operation;

-(void)startAnimation;
@end

NS_ASSUME_NONNULL_END
