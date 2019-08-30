//
//  ImageViewController.h
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageViewController : BaseViewController
-(void)setImage:(UIImage *)image;
@property (nonatomic, strong)UIImage *transitionImage;
@end

NS_ASSUME_NONNULL_END
