//
//  ImageTransition.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "ImageTransition.h"
#import "ImageViewController.h"

@implementation ImageTransition
-(void)startAnimation{
    [super startAnimation];
    
    self.toView.frame = [self.context finalFrameForViewController:self.toViewController];
    self.toView.alpha = 0;
    [self.contaionerView addSubview:self.toView];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:self.transitionimageView.image
                              ];
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    
    CGRect startRect = [self.transitionimageView convertRect:self.transitionimageView.bounds toView:window];
    
    if (self.operation == UINavigationControllerOperationPush) {
    
        imageView.frame = startRect;
    }else{
        imageView.frame = self.imageViewRect;
    }
    
    [self.contaionerView addSubview:imageView];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.toView.alpha = 1;
    }];
    
    [UIView animateWithDuration:self.duration animations:^{
        if (self.operation == UINavigationControllerOperationPush) {
           
            imageView.frame = self.imageViewRect;
        }else{
            imageView.frame = startRect;
        }
    }completion:^(BOOL finished) {
        if ([self.toViewController isKindOfClass:[ImageViewController class]]) {
            ImageViewController *imageVC = (ImageViewController *)self.toViewController;
            [imageVC setImage:imageView.image];
            
        }
        [imageView removeFromSuperview];
        
        self.transitionimageView.hidden = NO;
        [self.context completeTransition:!self.context.transitionWasCancelled];
    }];
}
@end
