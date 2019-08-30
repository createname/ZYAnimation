//
//  ZYNavViewController.h
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionAnimator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYNavViewController : UINavigationController
-(void)pushToVC:(UIViewController *)viewController animated:(TransitionAnimator *)animated;
@end

NS_ASSUME_NONNULL_END
