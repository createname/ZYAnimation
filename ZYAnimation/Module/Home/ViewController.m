//
//  ViewController.m
//  ZYAnimation
//
//  Created by wzy on 2019/8/13.
//  Copyright © 2019 wzy. All rights reserved.
//

#import "ViewController.h"
#import "ThemeCell.h"
#import "ProductCell.h"
#import "ImageTransition.h"
#import "ProductInfoViewController.h"
#import "ThemeSheetViewController.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, assign)CGFloat cellHeight;
@property (nonatomic, strong)NSArray *productImgArray;
@end

@implementation ViewController
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[ThemeCell class] forCellWithReuseIdentifier:@"ThemeCell"];
        [_collectionView registerClass:[ProductCell class] forCellWithReuseIdentifier:@"ProductCell"];
        
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    _cellHeight = 100;
    _productImgArray = @[         @"product_1",
                                  @"product_2",
                                  @"product_3",
                                  @"product_4",
                                  @"product_5",
                                  @"product_6",];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}
#pragma mark-

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    switch (section) {
    case 0:
            return 2;
    case 1:
            return 1;
    case 2:
            return 6;
    default:
            return 0;
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            ThemeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeCell" forIndexPath:indexPath];
            cell.contentView.backgroundColor = [UIColor blueColor];
            cell.titleLabel.text = @"定制\nHid Dikeng";
            cell.layer.cornerRadius = 2;
            cell.layer.masksToBounds = true;
            return cell;
        }
            break;
        case 1:
        {
            UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
            cell.layer.cornerRadius = 2;
            cell.layer.masksToBounds = YES;
            cell.backgroundColor = [UIColor purpleColor];
            return cell;
            
        }
            break;
        case 2:
        {
            ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductCell" forIndexPath:indexPath];
            cell.iconImgView.image = [UIImage imageNamed:self.productImgArray[indexPath.row]];
            return cell;
        }
            break;
        default:
        {
            UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor blueColor];
            return cell;
        }
            break;
    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(20, 15, 0, 15);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            CGFloat width = (collectionView.frame.size.width - 15*2 - 15)/2;
            return CGSizeMake(width, 80);
        }
            break;
        case 1:
        {
            CGFloat width = (collectionView.frame.size.width - 15*2);
            return CGSizeMake(width, _cellHeight);
        }
            break;
            
        default:
        {
            CGFloat width = (collectionView.frame.size.width - 15*2 - 15)/2;
            return CGSizeMake(width, width+50);
        }
            break;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            ThemeCell *cell = (ThemeCell *)[collectionView cellForItemAtIndexPath:indexPath];
            ThemeSheetViewController *vc = [ThemeSheetViewController sheetWithshotView:cell];
            [vc showSheet];
        }
            break;
        case 1:
        {
            if (_cellHeight == 200) {
                _cellHeight = 100;
            }else{
                _cellHeight = 200;
            }
            [UIView animateWithDuration:0.4 animations:^{
                [collectionView performBatchUpdates:^{
                    [self.collectionView reloadData];
                } completion:nil];
            }];
        }
            break;
        case 2:
        {
            ProductCell *cell = (ProductCell *)[collectionView cellForItemAtIndexPath:indexPath];
            ImageTransition *animtor = [ImageTransition new];
            animtor.duration = 0.5;
            animtor.imageViewRect = CGRectMake(0, 88, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width);
            animtor.transitionimageView = cell.iconImgView;
            ProductInfoViewController *vc = [ProductInfoViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            [self.nav pushToVC:vc animated:animtor];
            
        }
            break;
        default:
            break;
    }
}
@end
