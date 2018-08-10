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

+ (LFSegmentContrController*)initBeeMessageTypeSegmentedControllerItems:(NSArray*)items frame:(CGRect)rect inBounds:(BOOL)inBounds{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    if (inBounds) {
        layout.itemSize = CGSizeMake(CGRectGetWidth(rect)/items.count, CGRectGetHeight(rect));
    }else {
        if (items.count > 4) {
            layout.itemSize = CGSizeMake(CGRectGetWidth(rect)/4, CGRectGetHeight(rect));
        } else {
            layout.itemSize = CGSizeMake(CGRectGetWidth(rect)/items.count, CGRectGetHeight(rect));
        }
    }
    
    layout.sectionInset = UIEdgeInsetsMake(0, 0.0, 0, 0.0);
    layout.minimumInteritemSpacing = 0.0;
    layout.minimumLineSpacing = 0.0;
    LFSegmentContrController *segmented = [[LFSegmentContrController alloc]initWithCollectionViewLayout:layout];
    segmented.itemsArray = items;
    segmented.view.frame = rect;
    segmented.view.backgroundColor = [UIColor greenColor];
    return segmented;
}

+ (LFSegmentContrController*)initBeeMessageTypeSegmentedControllerItems:(NSArray*)items frame:(CGRect)rect horizontalCount:(NSInteger)count{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(CGRectGetWidth(rect)/count, CGRectGetWidth(rect)/count);
    layout.sectionInset = UIEdgeInsetsMake(0, 0.0, 0, 0.0);
    layout.minimumInteritemSpacing = 0.0;
    layout.minimumLineSpacing = 0.0;
    LFSegmentContrController *segmented = [[LFSegmentContrController alloc]initWithCollectionViewLayout:layout];
    segmented.itemsArray = items;
    segmented.view.frame = rect;
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
    [self.collectionView registerClass:[LFSegmentContrCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
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
    id objc = _itemsArray[indexPath.row];
    [cell setContentTitle:[objc objectForKey:@"name"] img:[objc objectForKey:@"icon"]];
    return cell;
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

- (void)setCollectionViewBackgroundColor:(UIColor*)color {
    self.collectionView.backgroundColor = color;
}

@end
