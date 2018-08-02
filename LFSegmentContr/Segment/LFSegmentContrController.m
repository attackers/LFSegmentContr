//
//  BeeMessageTypeSegmentedController.m
//  Floor
//
//  Created by leaf on 2018/1/15.
//  Copyright © 2018年 leaf. All rights reserved.
//

#import "LFSegmentContrController.h"
#import "LFSegmentContrCell.h"

@interface LFSegmentContrController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic,copy) void(^Item)(NSInteger);
@end

@implementation LFSegmentContrController

static NSString * const reuseIdentifier = @"LFSegmentContrCell";

+ (LFSegmentContrController*)initBeeMessageTypeSegmentedControllerItems:(NSArray<NSString*>*)items {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    LFSegmentContrController *segmented = [[LFSegmentContrController alloc]initWithCollectionViewLayout:layout];
    segmented.itemsArray = items;
    CGFloat h = CGRectGetMaxY([UIApplication sharedApplication].statusBarFrame);
    h = h>=44? 140 : 116;
    segmented.view.frame = CGRectMake(0,0,CGRectGetWidth([UIScreen mainScreen].bounds), h);
    return segmented;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self.collectionView registerClass:[LFSegmentContrCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredVertically];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)setSelectItemIndex:(NSInteger)index{
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredVertically];
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemsArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LFSegmentContrCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setContent:_itemsArray[indexPath.row]];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    if (_itemsArray.count > 4) {
        return CGSizeMake(width/4, 49);
    }
    return CGSizeMake(width/_itemsArray.count, 49);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(1, 0, 1, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (_Item) {
        _Item(indexPath.row);
    }
}
- (void)segmentedClickItem:(void(^)(NSInteger index))indexPath{

    _Item = ^(NSInteger index){
        indexPath(index);
    };
}
@end
