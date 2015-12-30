//
//  NCCell.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/20.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "NCCell.h"
#import <UIImageView+WebCache.h>
@implementation NCCell {
    UIImageView *_Picture;
    UILabel *_dealerPrice;
    UILabel *_serialName;
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
    _Picture = [UIImageView new];
    _Picture.contentMode = UIViewContentModeScaleAspectFill;
    _Picture.backgroundColor = [UIColor clearColor];
    _dealerPrice = [UILabel new];
    _dealerPrice.font = [UIFont boldSystemFontOfSize:15];
    _dealerPrice.textColor = [UIColor redColor];
    
    _serialName = [UILabel new];
    _serialName.font = [UIFont boldSystemFontOfSize:20];
    
    [self.contentView addSubview:_Picture];
    [self.contentView addSubview:_dealerPrice];
    [self.contentView addSubview:_serialName];
}

- (void)setModel:(NCSerialListModel *)model {
    _model = model;
    
    NSString *rew = model.Picture;
    rew = [rew stringByReplacingOccurrencesOfString:@"{0}" withString:@"2"];
    [_Picture sd_setImageWithURL:[NSURL URLWithString:rew] placeholderImage:nil];
    _dealerPrice.text = model.dealerPrice;
    _serialName.text = model.serialName;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat W = 110;
    CGFloat H = 90;
    CGFloat pading = 20;
    _Picture.frame = CGRectMake(pading, pading/2, W, H);
    _serialName.frame = CGRectMake( pading * 3 + W, pading, W*2, (H - pading*2)/2);
    _dealerPrice.frame = CGRectMake(pading * 3 + W, pading + (H - pading*2)/2,  W*2, (H - pading*2)/2);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
