//
//  KuTuCell.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/17.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "KuTuCell.h"
#import "UIView+Common.h"
#import "Define.h"
#import <UIImageView+WebCache.h>
@implementation KuTuCell {
    UIImageView *_picCoverImage;
    UILabel *_titleLabel;
    UILabel *_srcLabel;
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
    _picCoverImage.contentMode = UIViewContentModeScaleAspectFit;
    
    
    _titleLabel = [UILabel new];
    _titleLabel.numberOfLines = 2;
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    _srcLabel = [UILabel new];
    _srcLabel.font = [UIFont systemFontOfSize:14];
    _srcLabel.textColor = [UIColor grayColor];
    
    [self.contentView addSubview:_picCoverImage];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_srcLabel];
}

- (void)setModel:(KuTuDataModel *)model {
    _model = model;
    NSArray *array = [model.picCover componentsSeparatedByString:@";"];
    //NSString *urlStr = nil;
    if (array.count > 1) {
     NSString *urlStr = array[0];
    [_picCoverImage sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:nil];
    }else {
        NSString *urlStr1 = model.picCover;
        
        [_picCoverImage sd_setImageWithURL:[NSURL URLWithString:urlStr1] placeholderImage:nil];
    
    }
    
    
    _titleLabel.text = model.title;
    _srcLabel.text = model.src;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat pading = 10.0;
    _titleLabel.frame = CGRectMake(pading, pading, width(self.contentView) - pading * 2, 25);
    _picCoverImage.frame = CGRectMake(pading, 35 + pading, width(_titleLabel),160);
    _srcLabel.frame = CGRectMake(pading, 195 + pading, 210, 20);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
