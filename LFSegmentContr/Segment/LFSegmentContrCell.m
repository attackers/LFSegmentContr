//
//  LFSegmentContrCell.m
//  Floor
//
//  Created by leaf on 2018/1/15.
//  Copyright © 2018年 leaf. All rights reserved.
//

#import "LFSegmentContrCell.h"
@interface LFSegmentContrCell()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *topImageView;
@end
@implementation LFSegmentContrCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];

        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        _titleLabel.highlightedTextColor = [UIColor redColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        
        _topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(frame) - 1.5 , CGRectGetWidth(frame), 1.5)];
        _topImageView.highlightedImage = [UIImage imageNamed:@"BeeMessageTypeBottomBackground"];
        [self.contentView addSubview:_topImageView];

    }
    return self;
}
- (void)setContent:(NSString*)title {
    _titleLabel.text = title;
}
@end
