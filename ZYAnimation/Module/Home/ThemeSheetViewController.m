//
//  ThemeSheetViewController.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "ThemeSheetViewController.h"
@implementation SnapView
-(instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.imageView];
        self.imageView.autoresizesSubviews = YES;
        self.imageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    }
    return self;
}
@end

@interface ThemeSheetViewController ()
@property (nonatomic, assign)double duration;
@property (nonatomic, assign)CGFloat dampingRatio;
@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, strong)UIVisualEffectView *effectView;
@property (nonatomic, strong)SnapView *snapView;
@property (nonatomic, assign)CGRect startRect;
@property (nonatomic, strong)UIView *fromView;
@property (nonatomic, strong)UIView *madeView;
@end

@implementation ThemeSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.duration = 0.1;
    self.dampingRatio = 0.9;
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    _effectView = [[UIVisualEffectView alloc]init];
    _effectView.effect = blurEffect;
    _effectView.frame = self.view.bounds;
    [self.view addSubview:_effectView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [_effectView addGestureRecognizer:tap];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self startAnimation];
}

/**
 初始化视图
 */
+(instancetype)sheetWithshotView:(UIView *)view{
    ThemeSheetViewController *sheet = [ThemeSheetViewController new];
    sheet.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;//动画类型(渐显)
    sheet.providesPresentationContextTransitionStyle = YES;
    sheet.definesPresentationContext = YES;
    sheet.modalPresentationStyle = UIModalPresentationCurrentContext;//视图全部被透过
    [sheet setupView:view];
    return sheet;
}

-(void)setupView:(UIView *)view{
    _snapView = [self snapshotView:view];
    
    self.startRect = _snapView.frame;
    
    _contentView = [UIView new];
    _contentView.backgroundColor = [UIColor blueColor];
    _contentView.layer.cornerRadius = 5;
    _contentView.layer.masksToBounds = YES;
    _contentView.frame = self.startRect;
    
    _snapView.frame = CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.height);
    
    [self.view addSubview:_contentView];
    
    _contentView.autoresizesSubviews = YES;
    
    _snapView.autoresizingMask =  UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    
    _madeView = [UIView new];
    _madeView.frame = CGRectMake(0, -100, self.view.frame.size.width*0.6, 370);
    _madeView.alpha = 0;
    _madeView.backgroundColor = [UIColor redColor];
    [_contentView addSubview:_madeView];
}

-(void)showSheet{
    UIViewController *vc = UIApplication.sharedApplication.keyWindow.rootViewController;
    [vc presentViewController:self animated:YES completion:nil];
}


/**
 弹出动画效果
 */
-(void)startAnimation{
    self.fromView.hidden = YES;
    _effectView.userInteractionEnabled = NO;
    CGFloat width = self.view.bounds.size.width - 80;
    CGFloat height = self.view.bounds.size.height * 0.55;
    [self.view setNeedsLayout];
    
    [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect rect = self.contentView.frame;
        rect.size = CGSizeMake(width, height);
        self.contentView.frame = rect;
        self.contentView.center = self.view.center;
        
        CGRect madeRect = self.madeView.frame;
        madeRect.size = CGSizeMake(width, height);
        self.madeView.frame = madeRect;
        self.madeView.center = CGPointMake(width/2, height/2);
        
        self.snapView.alpha = 0;
        
        self.madeView.alpha = 1;
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        self.effectView.userInteractionEnabled = YES;
    }];
}


/**
 关闭动画
 */
-(void)closeAnimation{
    self.effectView.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:self.duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentView.frame = self.startRect;
        self.madeView.frame = CGRectMake(0, -100, self.view.bounds.size.width*0.6, 370);
        
        self.snapView.alpha = 1;
        self.madeView.alpha = 0;
        self.effectView.alpha = 0;
        
    } completion:^(BOOL finished) {
        self.effectView.hidden = YES;
        self.fromView.hidden = NO;
        [self dismissViewControllerAnimated:false completion:^{
            self.effectView.userInteractionEnabled = YES;
        }];
    }];
}


/**
 截取当前屏幕
 */
-(SnapView *)snapshotView:(UIView *)shotView{
    self.fromView = shotView;
    
    CALayer *layer = shotView.layer;
    
    SnapView *snapView = [SnapView new];
    
    UIWindow *window = UIApplication.sharedApplication.keyWindow;
    CGRect frame = [shotView convertRect:shotView.bounds toView:window];
    snapView.frame = frame;
    snapView.imageView.center = snapView.center;
    snapView.frame = snapView.bounds;
    
    //c创建上下文
    UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.opaque, UIScreen.mainScreen.scale);
    
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //截屏
    [layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    snapView.imageView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    return snapView;
}

-(void)tapClick{
    [self closeAnimation];
}

@end
