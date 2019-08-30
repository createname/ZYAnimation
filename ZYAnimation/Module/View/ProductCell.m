//
//  ProductCell.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2;
        self.layer.masksToBounds = YES;
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.contentView.layer.shadowOffset = CGSizeZero;
        self.contentView.layer.shadowOpacity = 0.2;
        
        self.iconImgView = [UIImageView new];
        [self.contentView addSubview:self.iconImgView];
        self.iconImgView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.iconImgView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:5].active = YES;
        [self.iconImgView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:5].active = YES;
        [self.iconImgView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-5].active = YES;
        [self.iconImgView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-5].active = YES;
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        self.titleLabel.text = @"发了啥";
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.iconImgView.bottomAnchor constant:8].active = YES;
        [self.detailLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8].active = YES;
        
        self.detailLabel = [UILabel new];
        self.detailLabel.font = [UIFont boldSystemFontOfSize:14];
        self.detailLabel.text = @"发了啥";
        [self.contentView addSubview:self.detailLabel];
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.detailLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:4].active = YES;
        [self.detailLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:8].active = YES;
    }
    return self;
}

@end
