//
//  SalesCell.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/18.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "SalesCell.h"

#import <UIImageView+WebCache.h>

@implementation SalesCell {
    UIImageView *_iconImageView;
    UIImageView *_whiteCoverImg;
    UILabel *_iconLabel;
    UILabel *_SerialNameLabel;
    UILabel *_priceLabel;
    UILabel *_IndexLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customViews];
    }
    return self;
}

- (void)customViews {
    _iconImageView = [UIImageView new];
    _whiteCoverImg = [UIImageView new];
    
    _whiteCoverImg.contentMode = UIViewContentModeScaleAspectFill;
    _whiteCoverImg.backgroundColor = [UIColor clearColor];
    _iconLabel = [UILabel new];
    _iconLabel.textAlignment = NSTextAlignmentCenter;
    _SerialNameLabel = [UILabel new];
    _SerialNameLabel.font = [UIFont boldSystemFontOfSize:18];
    _priceLabel = [UILabel new];
    _priceLabel.font = [UIFont boldSystemFontOfSize:14];
    _priceLabel.textColor = [UIColor redColor];
   // _priceLabel.textAlignment = NSTextAlignmentCenter;
    _IndexLabel = [UILabel new];
    _IndexLabel.font = [UIFont boldSystemFontOfSize:14];
    _IndexLabel.textColor = [UIColor grayColor];
   // _IndexLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self.contentView addSubview:_whiteCoverImg];
    [_iconImageView addSubview:_iconLabel];
    [self.contentView addSubview:_iconImageView];
    [self.contentView addSubview:_iconLabel];
    [self.contentView addSubview:_SerialNameLabel];
    [self.contentView addSubview:_priceLabel];
    [self.contentView addSubview:_IndexLabel];

}

- (void)setModel:(SalesListModel *)model {
    _model = model;
    _iconImageView.image = [UIImage imageNamed:@"详情-红色标签"];
    _iconLabel.text = model.Rank;
    
    NSString *rew = model.WhiteCoverImg;
    rew = [rew stringByReplacingOccurrencesOfString:@"{0}" withString:@"2"];
    
    [_whiteCoverImg sd_setImageWithURL:[NSURL URLWithString:rew] placeholderImage:nil];
    _SerialNameLabel.text = model.SerialName;
    
    
    
    
    _priceLabel.text = [NSString stringWithFormat:@"%.2f万-%.2f万",[model.MinPrice floatValue],[model.MaxPrice floatValue]];
    _IndexLabel.text = [NSString stringWithFormat:@"全国销量:%@辆",model.Index];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat pading = 10;
    CGFloat iconH = 16;
    _iconImageView.frame = CGRectMake(pading, 0, 2*pading, 2*iconH);
    _iconLabel.frame = CGRectMake(pading, 0, pading*2, pading*2);
    _whiteCoverImg.frame = CGRectMake(pading, iconH/2, 100, 80);
    _SerialNameLabel.frame = CGRectMake(pading*3 + 100, pading,  230, 23);
    _priceLabel.frame = CGRectMake(pading*3 + 100, pading + 26, 230, 20);
    _IndexLabel.frame = CGRectMake(pading*3 + 100, pading + 50, 230, 20);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
