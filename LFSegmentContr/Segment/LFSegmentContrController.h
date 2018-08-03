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

+ (LFSegmentContrController*)initBeeMessageTypeSegmentedControllerItems:(NSArray<NSString*>*)items frame:(CGRect)rect inBounds:(BOOL)inBounds;
- (void)segmentedClickItem:(void(^)(NSInteger index))indexPath;
- (void)setSelectItemIndex:(NSInteger)index;
@end
