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
+ (LFSegmentContrController*)initBeeMessageTypeSegmentedControllerItems:(NSArray<NSString*>*)items;
- (void)segmentedClickItem:(void(^)(NSInteger index))indexPath;
- (void)setSelectItemIndex:(NSInteger)index;
@end
