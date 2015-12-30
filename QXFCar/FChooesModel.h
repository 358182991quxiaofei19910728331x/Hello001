//
//  FChooesModel.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/21.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface FChooesDataModel : JSONModel

@property (nonatomic, copy)NSString <Optional> *shareUrl;
@property (nonatomic, copy)NSString <Optional> *csID;
@property (nonatomic, copy)NSString <Optional> *csName;
@property (nonatomic, copy)NSString <Optional> *masterd;
@property (nonatomic, copy)NSString <Optional> *guidePriceRange;
@property (nonatomic, copy)NSString <Optional> *referencePriceRange;
@property (nonatomic, copy)NSString <Optional> *converImg;
@property (nonatomic, copy)NSString <Optional> *coverImg;
@property (nonatomic, copy)NSString <Optional> *whiteCoverImg;
@property (nonatomic, copy)NSString <Optional> *imgCount;
@property (nonatomic, copy)NSString <Optional> *oil;
@property (nonatomic, copy)NSString <Optional> *country;
@property (nonatomic, copy)NSString <Optional> *carType;
@property (nonatomic, copy)NSString <Optional> *serialLink;
@property (nonatomic, copy)NSString <Optional> *forumId;
@property (nonatomic, copy)NSString <Optional> *brandId;

@end

@interface FChooesModel : JSONModel
@property (nonatomic, assign)BOOL success;
@property (nonatomic, copy)NSString <Optional> *status;
@property (nonatomic, copy)NSString <Optional> *message;

@property (nonatomic, strong) FChooesDataModel *data;

@end
