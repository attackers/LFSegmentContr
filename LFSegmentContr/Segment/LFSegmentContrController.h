//
//  BeeMessageTypeSegmentedController.h
//  Floor
//
//  Created by leaf on 2018/1/15.
//  Copyright © 2018年 leaf. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LFSegmentContrController : UICollectionViewController
@property (nonatomic, strong) NSArray<NSString*> *itemsArray;
@property (nonatomic, assign) CGRect selfFrame;

/**
 初始化

 @param items 需要显示的内容数据，图片名字与title名字一样
 @param rect 布局
 @param inBounds 是否在可视区域展示，不滑动
 @return 返回类型
 */
+ (LFSegmentContrController*)initBeeMessageTypeSegmentedControllerItems:(NSArray<NSString*>*)items frame:(CGRect)rect inBounds:(BOOL)inBounds;

/**
 初始化

 @param items 需要显示的内容数据，图片名字与title名字一样
 @param rect 布局
 @param count 一排显示几个
 @return 返回类型
 */
+ (LFSegmentContrController*)initBeeMessageTypeSegmentedControllerItems:(NSArray<NSString*>*)items frame:(CGRect)rect horizontalCount:(NSInteger)count;

/**
返回选择的当前item

 @param indexPath 下标
 */
- (void)segmentedClickItem:(void(^)(NSInteger index))indexPath;

/**
 设置选择item

 @param index 所选择的下标
 */
- (void)setSelectItemIndex:(NSInteger)index;


/**
 设置CollectionView背景颜色

 @param color 需要设置的颜色
 */
- (void)setCollectionViewBackgroundColor:(UIColor*)color;
@end
