//
//  HomeController.m
//  QXFCar
//
//  Created by QXFqianfeng on 15/12/16.
//  Copyright © 2015年 屈晓飞. All rights reserved.
//

#import "HomeController.h"

#import "NewsController.h"
#import "AppListController.h"
#import "Define.h"
@interface HomeController ()<UIScrollViewDelegate>

@property (nonatomic)UIScrollView *scrollView;
//顶部按钮视图
@property (nonatomic)UIScrollView *topView;
//按钮下划线视图
@property (nonatomic)UIView *lineView;

@property (nonatomic)UICollectionView *collertionView;

@end

@implementation HomeController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.bounds = CGRectMake(0, 96, SCREEN_WIDTH, SCREEN_HEIGHT-36-49-30);
    //创建导航button
    [self creatNavigationButton];
    //创建scrollView
    [self createScrollView];
    //设置容器视图控制器的view，并粘贴到scrollView
    [self setViewToScrollView];
    
}

-(void)creatNavigationButton{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _topView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 30)];
    _topView.backgroundColor = [UIColor whiteColor];
    _topView.bounces = NO;
    _topView.delegate = self;
    _topView.showsVerticalScrollIndicator = NO;
    
    //创建button,@"新车"
    CGFloat width = (_topView.frame.size.width - 4)/4;
    CGFloat height = _topView.frame.size.height;
    CGFloat pading = 1;
    NSArray *arr = @[@"要闻",@"酷图",@"评测",@"导购"];
    for (NSInteger index = 0; index < arr.count; index++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(index*(width+pading),0, width, height);
        button.tintColor = [UIColor grayColor];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        
        [button setBackgroundImage:[UIImage imageNamed:@"backImage"] forState:UIControlStateNormal];
        [button setTitle:arr[index] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onClockButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+index;
        [_topView addSubview:button];
    }
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, _topView.frame.size.height-2, width, 2)];
    _lineView.backgroundColor = [UIColor grayColor];
    [_topView addSubview:_lineView];
    _topView.contentSize = CGSizeMake(width*4, height);
    [self.view addSubview:_topView];
    
}

-(void)onClockButton:(UIButton *)button
{
    CGFloat lineWidth = _topView.frame.size.width/4;
    [UIView animateWithDuration:0.3 animations:^{
        _lineView.frame = CGRectMake((button.tag-100)*lineWidth, _topView.frame.size.height - 2, lineWidth, 2);
    }];
    CGFloat x = SCREEN_WIDTH * (button.tag - 100);
    _scrollView.contentOffset = CGPointMake(x, 0);
    
}

//滚动视图
-(void)createScrollView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 94, SCREEN_WIDTH, SCREEN_SIZE.height - 64 - 30 -49)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(SCREEN_SIZE.width*4, SCREEN_SIZE.height - 64-30-49);
    //失去弹性
    _scrollView.bounces = NO;
    //设置按页翻
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
}

-(void)setViewToScrollView{
    
    NSArray *homeURL = @[QHome1URL,QHome3URL,QHome4URL,QHome5URL];
    NSArray *catagoryArray = @[QHome1Type,QHome3Type,QHome4Type,QHome5Type];
    
    int i = 0;
    NSArray *arr = @[@[@"News"],@[@"KuTu"],@[@"Review"],@[@"Shoppers"]];
    for (NSInteger index = 0; index < arr.count; index++) {
       // Class className = NSClassFromString([NSString stringWithFormat:@"%@Controller",arr[index][0]]);
        
        AppListController *base = [[AppListController alloc]init];
        base.requsetUrl = homeURL[i];
    
        base.categoryType = catagoryArray[i++];
        base.view.frame = CGRectMake(index*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self addChildViewController:base];
        [_scrollView addSubview:base.view];
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        CGPoint point = scrollView.contentOffset;
        double offsetX = point.x/SCREEN_SIZE.width;
        CGFloat lineWidth = _topView.frame.size.width/4;
        [UIView animateWithDuration:0.3 animations:^{
            _lineView.frame = CGRectMake(offsetX*lineWidth, _topView.frame.size.height-2, lineWidth, 2);
        }];
        if (offsetX >= 4) {
            self.topView.contentOffset = CGPointMake(SCREEN_SIZE.width/4*(offsetX - 4), 0);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
