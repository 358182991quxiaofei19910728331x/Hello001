//
//  KuTuDetailModel.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/21.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol KuTuAlbumsDetailModel
@end

@interface KuTuAlbumsDetailModel : JSONModel

@property (nonatomic, copy)NSString *id;
@property (nonatomic, copy)NSString *imageUrl;
@property (nonatomic, copy)NSString *content;
@end

@interface KuTuDataDetailModel : JSONModel
@property (nonatomic, copy)NSString *newsId;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *sourceName;
@property (nonatomic, copy)NSString *publishTime;
@property (nonatomic, strong) NSMutableArray <KuTuAlbumsDetailModel> *albums;

@end


@interface KuTuDetailModel : JSONModel
@property (nonatomic, copy)NSString *status;
@property (nonatomic, copy)NSString *message;
@property (nonatomic, strong) KuTuDataDetailModel *data;

@end
