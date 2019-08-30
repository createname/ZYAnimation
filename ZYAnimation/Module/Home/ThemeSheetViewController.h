//
//  ThemeSheetViewController.h
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SnapView : UIView
@property (nonatomic, strong)UIImageView *imageView;
@end

@interface ThemeSheetViewController : UIViewController
/**
 初始化视图
 */
+(instancetype)sheetWithshotView:(UIView *)view;
-(void)showSheet;
@end

NS_ASSUME_NONNULL_END
