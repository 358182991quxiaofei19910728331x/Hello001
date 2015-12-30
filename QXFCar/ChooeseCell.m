//
//  ChooeseCell.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/17.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "ChooeseCell.h"

#import <UIImageView+WebCache.h>

#import "UIView+Common.h"

@implementation ChooeseCell {
    UIImageView *_picCoverImage;
    UILabel *_titleLabel;

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
    _picCoverImage.layer.cornerRadius = 3.0;
    _picCoverImage.layer.masksToBounds = YES;
    _picCoverImage.contentMode = UIViewContentModeScaleAspectFill;
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.contentView addSubview:_picCoverImage];
    [self.contentView addSubview:_titleLabel];
}

- (void)setModel:(ChooeseDataModel *)model {
    _model = model;
    
    [_picCoverImage sd_setImageWithURL:[NSURL URLWithString:model.logoUrl] placeholderImage:nil];
    _titleLabel.text = model.name;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat pading = 10.0;
    
    _picCoverImage.frame = CGRectMake(pading, pading, 60, 60);
    _titleLabel.frame = CGRectMake(maxX(_picCoverImage) + 2*pading, 2*pading, width(self.contentView) - maxX(_picCoverImage) - 2 * pading, height(self.contentView) - 4 * pading);
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
