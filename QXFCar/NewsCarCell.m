
//
//  NewsCarCell.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/18.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "NewsCarCell.h"

#import "UIView+Common.h"
#import <UIImageView+WebCache.h>
@implementation NewsCarCell {
    UIImageView *_img;
    UILabel *_showNameLabel;
    UILabel *_PriceLabel;

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
    _img = [UIImageView new];
    _img.contentMode = UIViewContentModeScaleAspectFill;
    _showNameLabel = [UILabel new];
    _showNameLabel.font = [UIFont boldSystemFontOfSize:18];
    //_showNameLabel.textAlignment = NSTextAlignmentCenter;
    _PriceLabel = [UILabel new];
    _PriceLabel.font = [UIFont boldSystemFontOfSize:14];
    _PriceLabel.textColor = [UIColor redColor];
    //_PriceLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_img];
    [self.contentView addSubview:_showNameLabel];
    [self.contentView addSubview:_PriceLabel];
}

- (void)setModel:(NewsCarDataModel *)model {
    _model = model;
    [_img sd_setImageWithURL:[NSURL URLWithString:model.Img] placeholderImage:nil];
    _showNameLabel.text = model.ShowName;
    _PriceLabel.text = model.Price;

}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat pading = 10;
    CGFloat W = 100;
    _img.frame = CGRectMake(pading, pading, W , W - 20);
    _showNameLabel.frame = CGRectMake(4*pading + W, pading, 200, W/2);
    _PriceLabel.frame = CGRectMake(4*pading + W, pading + W/2, 200, W/2);
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
