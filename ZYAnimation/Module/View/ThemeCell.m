//
//  ThemeCell.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "ThemeCell.h"

@implementation ThemeCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _backImageView = [UIImageView new];
        _backImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_backImageView];
        _backImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [_backImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
        [_backImageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor].active = YES;
        [_backImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
        [_backImageView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor].active = YES;
        
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_titleLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
        [_titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    }
    return self;
}
@end
