//
//  ProductDetailCell.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "ProductDetailCell.h"

@implementation ProductDetailCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _backImageView = [UIImageView new];
        [self.contentView addSubview:_backImageView];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.backImageView.frame = self.bounds;
}
@end
