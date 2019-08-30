//
//  TransitionAnimator.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "TransitionAnimator.h"

@interface TransitionAnimator()

@end
@implementation TransitionAnimator

-(instancetype)init{
    if (self = [super init]) {
        self.duration = 0.2;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return self.duration;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    self.context = transitionContext;
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    self.fromView = self.fromViewController.view;
    self.toView = self.toViewController.view;
    
    self.contaionerView = transitionContext.containerView;
    
    [self startAnimation];
    
}

-(void)startAnimation{
    
}
@end
