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

        _topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame)*0.7)];

        _topImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_topImageView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_topImageView.frame), CGRectGetWidth(frame), CGRectGetHeight(frame)*0.3)];
        _titleLabel.highlightedTextColor = [UIColor redColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_titleLabel];
        
    

    }
    return self;
}
- (void)setContent:(NSString*)title {
    _titleLabel.text = title;
    _topImageView.image = [UIImage imageNamed:title];
}
- (void)setContentTitle:(NSString*)title img:(NSString*)name {
    _titleLabel.text = title;
    _topImageView.image = [UIImage imageNamed:name];
}

@end
