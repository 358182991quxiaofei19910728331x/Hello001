//
//  AppCell.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/17.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "AppCell.h"
#import <UIImageView+WebCache.h>
#import "UIView+Common.h"
#import "Define.h"

@implementation AppCell {

    UIImageView *_picCoverImage;
    UILabel *_titleLabel;
    UILabel *_publishTimeLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customViews];
    }
    return self;
}

- (void)customViews {
    _picCoverImage = [UIImageView new];
    _picCoverImage.layer.cornerRadius = 8.0;
    _picCoverImage.layer.masksToBounds = YES;
    _picCoverImage.contentMode = UIViewContentModeScaleAspectFill;
    
    _titleLabel = [UILabel new];
    _titleLabel.numberOfLines = 2;
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];

    _publishTimeLabel = [UILabel new];
    _publishTimeLabel.font = [UIFont systemFontOfSize:14];
    _publishTimeLabel.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:_picCoverImage];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_publishTimeLabel];
}

- (void)setModel:(NewCarListModel *)model {
    _model = model;
    NSString *urlStr = [model.picCover stringByReplacingOccurrencesOfString:@"wapimg-{0}-{1}" withString:@"" ];
    [_picCoverImage sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil];
    _titleLabel.text = model.title;
    
    _publishTimeLabel.text = model.publishTime;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat pading = 10.0;
    _picCoverImage.frame = CGRectMake(pading, pading, 80, 80);
    _titleLabel.frame = CGRectMake(maxX(_picCoverImage) + pading, pading, width(self.contentView) - maxX(_picCoverImage) - 2 * pading, 55);
    _publishTimeLabel.frame = CGRectMake(maxX(_picCoverImage) + pading, maxY(_titleLabel) + pading / 2, 150, 20);
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
