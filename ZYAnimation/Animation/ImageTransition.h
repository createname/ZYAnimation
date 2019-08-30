//
//  ImageTransition.h
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "TransitionAnimator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageTransition : TransitionAnimator
@property (nonatomic, assign)CGRect imageViewRect;
@property (nonatomic, strong)UIImageView *transitionimageView;

@end

NS_ASSUME_NONNULL_END
