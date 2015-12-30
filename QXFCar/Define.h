//
//  Define.h
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/15.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#ifndef Define_h
#define Define_h


#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
#define SCREEN_RECT   [UIScreen mainScreen].bounds
#define SIZE self.view.frame.size



#define QHome1Type @"mews"
#define QHome2Type @"newCar"
#define QHome3Type @"KuTu"
#define QHome4Type @"Review"
#define QHome5Type @"Shoppers"
#define KChooseType @"choose"
#define KNewCarType @"newsCar"
#define KSalesType @"sales"

//选车详情
#define XChooseType @"XChoose"
//
#define FChooseTypr @"FChoose"
#pragma mark ---------------------

//紧凑型车
#define QSales1Type @"Compact"
//微型车
#define QSales2Type @"Mini"
//小型车
#define QSales3Type @"Small"
//中型车
#define QSales4Type @"Midsize"
//中大型车
#define QSales5Type @"Large"


#pragma mark - 首页
//要闻

#define QHome1URL @"http://api.ycapp.yiche.com/appnews/toutiaov64/?platform=1&length=20&page=%ld&deviceid=864832020524832"
//新车
#define QHome2URL @"http://api.ycapp.yiche.com/news/getnewslist?serialid=&pageindex=%ld&pagesize=20&categoryid=3"

//酷图
#define QHome3URL @"http://api.ycapp.yiche.com/AppNews/GetAppNewsAlbumList?platform=1&length=20&page=%ld"


//评测
#define QHome4URL @"http://api.ycapp.yiche.com/news/getnewslist?serialid=&pageindex=%ld&pagesize=20&categoryid=3"

//导购
#define QHome5URL @"http://api.ycapp.yiche.com/news/getnewslist?serialid=&pageindex=%ld&pagesize=20&categoryid=2"


#pragma mark - 选车
#define QChooseURL @"http://api.ycapp.yiche.com/car/getmasterbrandlist?allmasterbrand=true"

#pragma mark - 新车上市

#define QNewCarURL @"http://api.ycapp.yiche.com/car/getserialinfoforNew"

#pragma mark - 销量
//紧凑型车
#define QSales1URL @"http://api.ycapp.yiche.com/indexdata/GetSerialSaleDataList/?length=20&carlevel=3&page=%ld&cityid=0&month=2015-10-01"
//微型车
#define QSales2URL @"http://api.ycapp.yiche.com/indexdata/GetSerialSaleDataList/?length=20&carlevel=2&page=%ld&cityid=0&month=2015-10-01"
//小型车
#define QSales3URL @"http://api.ycapp.yiche.com/indexdata/GetSerialSaleDataList/?length=20&carlevel=1&page=%ld&cityid=0&month=2015-10-01"
//中型车
#define QSales4URL @"http://api.ycapp.yiche.com/indexdata/GetSerialSaleDataList/?length=20&carlevel=4&page=%ld&cityid=0&month=2015-10-01"
//中大型车
#define QSales5URL @"http://api.ycapp.yiche.com/indexdata/GetSerialSaleDataList/?length=20&carlevel=5&page=%ld&cityid=0&month=2015-10-01"


#pragma mark - 首页详情

//要闻

#define XHome1URL @"http://h5.ycapp.yiche.com/news/%@.html?appver=6.6&lastmodify=%@&plat=1"

//酷图
#define XHome2URL @"http://api.ycapp.yiche.com/appnews/GetNewsAlbum?newsid=%@&lastmodify=%@"
//评测//导购//新车
#define XHome3URL @"http://h5.ycapp.yiche.com/ycnews/%@.html?appver=6.6&lastmodify=%@&plat=1"


#pragma mark - 选车详情
#define XChooseURL @"http://api.ycapp.yiche.com/car/getseriallist?masterid=%@&allserial=true"
#define FChooseURL @"http://api.ycapp.yiche.com/car/GetSerialInfo?csid=%@"

#pragma mark - 新车上市详情

#define XNewCarURL @"http://api.ycapp.yiche.com/car/GetCarListV61?cityid=1001&csid=%@"

#pragma mark - 销量详情

#define FNewCarURL @"http://api.ycapp.yiche.com/car/GetSerialInfo?csid=%@"

#endif /* Define_h */
