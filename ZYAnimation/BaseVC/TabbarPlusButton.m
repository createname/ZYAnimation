//
//  TabbarPlusButton.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "TabbarPlusButton.h"

@implementation TabbarPlusButton
//+(void)load{
//    [super registerSubclass];
//}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}
//addButton
+(id)plusButton{
    TabbarPlusButton *button = [[TabbarPlusButton alloc] init];
    UIImage *normalButtonImage = [UIImage imageNamed:@"addButton"];
    UIImage *hlightButtonImage = [UIImage imageNamed:@"addButton"];
    [button setImage:normalButtonImage forState:UIControlStateNormal];
    [button setImage:hlightButtonImage forState:UIControlStateHighlighted];
    [button setImage:hlightButtonImage forState:UIControlStateSelected];
//    button.imageEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
//    button.titleLabel.font = [UIFont systemFontOfSize:9.5];
//    [button sizeToFit]; // or set frame in this way `button.frame = CGRectMake(0.0, 0.0, 250, 100);`
    button.frame = CGRectMake(0.0, 0.0, 49, 49);
    
    // if you use `+plusChildViewController` , do not addTarget to plusButton.
//    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
//- (void)clickPublish {}
+(CGFloat)multiplierOfTabBarHeight:(CGFloat)tabBarHeight{
    return 0.3;
}
@end
