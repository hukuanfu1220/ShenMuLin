//
//  HomeViewController.m
//  ShenMuLin
//
//  Created by 胡宽富 on 2018/9/28.
//  Copyright © 2018年 胡宽富. All rights reserved.
//

#import "HomeViewController.h"
#import "MyShenMuViewController.h"
@interface HomeViewController ()<SDCycleScrollViewDelegate>
/** cycleScrollView */
@property (nonatomic, weak) SDCycleScrollView * cycleScrollView;
/** UIScrollView */
@property (nonatomic, strong) UIScrollView * bgScrollerView;
@end

@implementation HomeViewController
-(UIScrollView *)bgScrollerView{
    if (_bgScrollerView == nil) {
        _bgScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT -STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)];
        _bgScrollerView.tag = 600 ;
        _bgScrollerView.bounces = YES;
        _bgScrollerView.showsVerticalScrollIndicator = NO;
        
        [self.view addSubview:_bgScrollerView];
    }
    
    return _bgScrollerView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%f--%f",fitScreenHeight,fitScreenWidth);
    
    
    if (@available(iOS 11.0, *)) {
        self.bgScrollerView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        self.bgScrollerView.contentInset = UIEdgeInsetsMake(0, 0, kBottomBarHeight, 0);
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self bgScrollerView];
    [self SDCycleScrollView];
    [self createSecondUI];
}

#pragma mark- 轮播图
/** 轮播图 */
-(void)SDCycleScrollView{
    
    SDCycleScrollView *cycleScrollView =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH,150*fitScreenHeight) delegate:self placeholderImage:nil];
    self.cycleScrollView = cycleScrollView;
    cycleScrollView.backgroundColor = [UIColor redColor];
    
    //本地加载
    cycleScrollView.localizationImageNamesGroup = @[@"1.jpg",@"2.jpg",@"3.jpg"];
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    //--- 轮播时间间隔，默认1.0秒，可自定义
    cycleScrollView.autoScrollTimeInterval = 5.0;
    cycleScrollView.hidesForSinglePage = NO;
    cycleScrollView.delegate = self;
    cycleScrollView.currentPageDotColor = [UIColor redColor];
    cycleScrollView.pageDotColor = [UIColor whiteColor];

    [self.bgScrollerView addSubview:cycleScrollView];
}
#pragma mark - CycleScrollView Delegate
//轮播图点击方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    
}
//滑动时禁止轮播防止卡顿  松开后恢复轮播
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.cycleScrollView.autoScroll = NO;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.cycleScrollView.autoScroll = YES;
}


-(void)createSecondUI{
    /*****/
    UIImageView *oneView = [[UIImageView alloc]init];
    [self.bgScrollerView addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10*fitScreenWidth);
        make.top.mas_equalTo(self.cycleScrollView.mas_bottom).offset(4*fitScreenHeight);
        make.width.mas_equalTo(82*fitScreenWidth);
        make.height.mas_equalTo(62*fitScreenHeight);
    }];
    oneView.image = [UIImage imageNamed:@"生态公园"];
    /*****/
    UIImageView *oneImageView = [[UIImageView alloc]init];
    [oneView addSubview:oneImageView];
    [oneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(3);
        make.top.offset(6);
        make.right.offset(-3);
        make.bottom.offset(-16);
    }];
    oneImageView.image = [UIImage imageNamed:@"生态公园图"];
    oneImageView.contentMode = UIViewContentModeScaleToFill;
    /*****/
    UIImageView *twoView = [[UIImageView alloc]init];
    [self.bgScrollerView addSubview:twoView];
    [twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(oneView.mas_right).offset(9*fitScreenWidth);
        make.top.mas_equalTo(self.cycleScrollView.mas_bottom).offset(4*fitScreenHeight);
        make.width.mas_equalTo(82*fitScreenWidth);
        make.height.mas_equalTo(62*fitScreenHeight);
    }];
    twoView.image = [UIImage imageNamed:@"古驿道"];
    /*****/
    UIImageView *twoImageView = [[UIImageView alloc]init];
    [twoView addSubview:twoImageView];
    [twoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(3);
        make.top.offset(6);
        make.right.offset(-3);
        make.bottom.offset(-16);
    }];
    twoImageView.image = [UIImage imageNamed:@"古驿道图"];
    /*****/
    UIImageView *threeView = [[UIImageView alloc]init];
    [self.bgScrollerView addSubview:threeView];
    [threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(twoView.mas_right).offset(9*fitScreenWidth);
        make.top.mas_equalTo(self.cycleScrollView.mas_bottom).offset(4*fitScreenHeight);
        make.width.mas_equalTo(82*fitScreenWidth);
        make.height.mas_equalTo(62*fitScreenHeight);
    }];
    threeView.image = [UIImage imageNamed:@"间歇泉"];
    /*****/
    UIImageView *threeImageView = [[UIImageView alloc]init];
    [threeView addSubview:threeImageView];
    [threeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(3);
        make.top.offset(6);
        make.right.offset(-3);
        make.bottom.offset(-16);
    }];
    threeImageView.image = [UIImage imageNamed:@"间歇泉图"];
    /*****/
    UIImageView *fouthView = [[UIImageView alloc]init];
    [self.bgScrollerView addSubview:fouthView];
    [fouthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(threeView.mas_right).offset(9*fitScreenWidth);
        make.top.mas_equalTo(self.cycleScrollView.mas_bottom).offset(4*fitScreenHeight);
        make.width.mas_equalTo(82*fitScreenWidth);
        make.height.mas_equalTo(62*fitScreenHeight);
    }];
    fouthView.image = [UIImage imageNamed:@"楼纳"];
    /*****/
    UIImageView *fouthImageView = [[UIImageView alloc]init];
    [fouthView addSubview:fouthImageView];
    [fouthImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(3);
        make.top.offset(6);
        make.right.offset(-3);
        make.bottom.offset(-16);
    }];
    fouthImageView.image = [UIImage imageNamed:@"楼纳图"];
    
    
    
    [self createThirdUI:oneView];
}


-(void)createThirdUI:(UIImageView *)oneView{
    /****************************************************************************/
    UITapGestureRecognizer *clickTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFourFunction:)];
    UITapGestureRecognizer *clickTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFourFunction:)];
    UITapGestureRecognizer *clickTap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFourFunction:)];
    UITapGestureRecognizer *clickTap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFourFunction:)];
    UITapGestureRecognizer *clickTap5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFourFunction:)];
    UITapGestureRecognizer *clickTap6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFourFunction:)];
    UITapGestureRecognizer *clickTap7 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFourFunction:)];
    UITapGestureRecognizer *clickTap8 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFourFunction:)];
    
    UIImageView *myTreeView = [[UIImageView alloc] init];
    myTreeView.tag = 10;
    myTreeView.userInteractionEnabled = YES;
    [self.bgScrollerView addSubview:myTreeView];
    [myTreeView addGestureRecognizer:clickTap1];
    [myTreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.mas_equalTo(oneView.mas_bottom).offset(4*fitScreenHeight);
        make.width.mas_equalTo(184*fitScreenWidth);
        make.height.mas_equalTo(106*fitScreenHeight);
    }];
    myTreeView.image = [UIImage imageNamed:@"我的神木"];
    /*****/
    UIImageView *myTreeImage = [[UIImageView alloc]init];
    myTreeImage.tag = 11;
    myTreeImage.userInteractionEnabled = YES;
    [myTreeView addSubview:myTreeImage];
    [myTreeImage addGestureRecognizer:clickTap2];
    [myTreeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18*fitScreenWidth);
        make.top.offset(25*fitScreenHeight);
        make.width.mas_equalTo(63*fitScreenWidth);
        make.height.mas_equalTo(63*fitScreenHeight);
    }];
    myTreeImage.image = [UIImage imageNamed:@"我的神木图片"];
    /*****/
    UIImageView *myTreeTravelView = [[UIImageView alloc] init];
    myTreeTravelView.tag = 20;
    myTreeTravelView.userInteractionEnabled = YES;
    [self.bgScrollerView addSubview:myTreeTravelView];
    [myTreeTravelView addGestureRecognizer:clickTap3];
    [myTreeTravelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.left.mas_equalTo(myTreeView.mas_right).offset(7*fitScreenWidth);
        make.top.mas_equalTo(oneView.mas_bottom).offset(4*fitScreenHeight);
        make.width.mas_equalTo(184*fitScreenWidth);
        make.height.mas_equalTo(106*fitScreenHeight);
    }];
    myTreeTravelView.image = [UIImage imageNamed:@"神木出行"];
    /*****/
    UIImageView *myTreeTravelImage = [[UIImageView alloc]init];
    myTreeTravelImage.tag = 21;
    myTreeTravelImage.userInteractionEnabled = YES;
    [myTreeTravelView addSubview:myTreeTravelImage];
    [myTreeTravelImage addGestureRecognizer:clickTap4];
    [myTreeTravelImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-18*fitScreenWidth);
        make.top.offset(25*fitScreenHeight);
        make.width.mas_equalTo(63*fitScreenWidth);
        make.height.mas_equalTo(63*fitScreenHeight);
    }];
    myTreeTravelImage.image = [UIImage imageNamed:@"神木出行图"];
    /*****/
    UIImageView *myTreeActivityView = [[UIImageView alloc] init];
    myTreeActivityView.tag = 30;
    myTreeActivityView.userInteractionEnabled = YES;
    [self.bgScrollerView addSubview:myTreeActivityView];
    [myTreeActivityView addGestureRecognizer:clickTap5];
    [myTreeActivityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.mas_equalTo(myTreeView.mas_bottom).offset(8*fitScreenHeight);
        make.width.mas_equalTo(184*fitScreenWidth);
        make.height.mas_equalTo(106*fitScreenHeight);
    }];
    myTreeActivityView.image = [UIImage imageNamed:@"活动推广"];
    /*****/
    UIImageView *myTreeActImage = [[UIImageView alloc]init];
    myTreeActImage.tag = 31;
    myTreeActImage.userInteractionEnabled = YES;
    [myTreeActivityView addSubview:myTreeActImage];
    [myTreeActImage addGestureRecognizer:clickTap6];
    [myTreeActImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(18*fitScreenWidth);
        make.top.offset(25*fitScreenHeight);
        make.width.mas_equalTo(63*fitScreenWidth);
        make.height.mas_equalTo(63*fitScreenHeight);
    }];
    myTreeActImage.image = [UIImage imageNamed:@"活动推广图"];
    /*****/
    UIImageView *myTreeServiceView = [[UIImageView alloc] init];
    myTreeServiceView.tag = 40;
    myTreeServiceView.userInteractionEnabled = YES;
    [self.bgScrollerView addSubview:myTreeServiceView];
    [myTreeServiceView addGestureRecognizer:clickTap7];
    [myTreeServiceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.left.mas_equalTo(myTreeActivityView.mas_right).offset(7*fitScreenWidth);
        make.top.mas_equalTo(myTreeTravelView.mas_bottom).offset(8*fitScreenHeight);
        make.width.mas_equalTo(184*fitScreenWidth);
        make.height.mas_equalTo(106*fitScreenHeight);
    }];
    myTreeServiceView.image = [UIImage imageNamed:@"增值服务"];
    /*****/
    UIImageView *myTreeServiceImage = [[UIImageView alloc]init];
    myTreeServiceImage.tag = 41;
    myTreeServiceImage.userInteractionEnabled = YES;
    [myTreeServiceView addSubview:myTreeServiceImage];
    [myTreeServiceImage addGestureRecognizer:clickTap8];
    [myTreeServiceImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-18*fitScreenWidth);
        make.top.offset(25*fitScreenHeight);
        make.width.mas_equalTo(63*fitScreenWidth);
        make.height.mas_equalTo(63*fitScreenHeight);
    }];
    myTreeServiceImage.image = [UIImage imageNamed:@"增值服务图"];
    /*****/
    UIImageView *discountsView = [[UIImageView alloc]init];
    [self.bgScrollerView addSubview:discountsView];
    [discountsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.mas_equalTo(myTreeActivityView.mas_bottom).offset(8*fitScreenHeight);
        make.height.mas_equalTo(94*fitScreenHeight);
    }];
    discountsView.image = [UIImage imageNamed:@"优惠券"];
}

-(void)clickFourFunction:(UITapGestureRecognizer *)sender{
    UIImageView *recordAnimImage = (UIImageView *)sender.view;
    NSLog(@"sender%ld",recordAnimImage.tag);
    if (recordAnimImage.tag == 10 || recordAnimImage.tag == 11) {
        MyShenMuViewController *shenmuVC = [[MyShenMuViewController alloc]init];
        [self.navigationController pushViewController:shenmuVC animated:YES];
    } else {
        NSLog(@"xxxxx");
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
