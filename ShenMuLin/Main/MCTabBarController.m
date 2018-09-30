//
//  MCTabBarController.m
//  MCTabBarDemo
//
//  Created by chh on 2017/12/4.
//  Copyright © 2017年 Mr.C. All rights reserved.
//

#import "MCTabBarController.h"
#import "ViewController.h"
#import "BaseNavigationController.h"
#import "MCTabBar.h"

#import "HomeViewController.h"
#import "ManagerViewController.h"
#import "TreeCicleViewController.h"
#import "OrderListViewController.h"
#import "MineViewController.h"


@interface MCTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) MCTabBar *mcTabbar;
@property (nonatomic, assign) NSUInteger selectItem;//选中的item
@end

@implementation MCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mcTabbar = [[MCTabBar alloc] init];
     [_mcTabbar.centerBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    //选中时的颜色
    _mcTabbar.tintColor = [UIColor clearColor];
    _mcTabbar.barTintColor = [UIColor colorWithRed:222.0/255.0 green:212.0/255.0 blue:184.0/255.0 alpha:1];
    //设置默认背景图片
    [_mcTabbar.centerBtn setBackgroundImage:[[UIImage imageNamed:@"树友圈"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    //设置按下时背景图片
    [_mcTabbar.centerBtn setBackgroundImage:[[UIImage imageNamed:@"树友圈选中"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState:UIControlStateSelected];
    [_mcTabbar.centerBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
   //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    _mcTabbar.translucent = NO;
    //利用KVC 将自己的tabbar赋给系统tabBar
    [self setValue:_mcTabbar forKeyPath:@"tabBar"];
    
    self.selectItem = 0; //默认选中第一个
    self.delegate = self;
    [self addChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//添加子控制器
- (void)addChildViewControllers{
    //图片大小建议32*32
    //图片大小建议32*32
    [self addChildrenViewController:[[HomeViewController alloc] init] andTitle:@"首页" andImageName:@"首页" andSelectImage:@"首页选中1"];
    [self addChildrenViewController:[[ManagerViewController alloc] init] andTitle:@"管护" andImageName:@"管护" andSelectImage:@"管护选中"];
    //中间这个不设置东西，只占位
    [self addChildrenViewController:[[TreeCicleViewController alloc] init] andTitle:@"树友圈" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[OrderListViewController alloc] init] andTitle:@"订单" andImageName:@"订单" andSelectImage:@"订单选中"];
    [self addChildrenViewController:[[MineViewController alloc] init] andTitle:@"我的" andImageName:@"我的" andSelectImage:@"我的选中"];

    
}



- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectImage:(NSString *)selectedImage{
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage =  [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.title = title;
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11.5];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    selectTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11.5];
    
    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];

    BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:childVC];

    [self addChildViewController:baseNav];
}

- (void)buttonAction:(UIButton *)button{
    self.selectedIndex = 2;//关联中间按钮
    if (self.selectItem != 2){
//        [self rotationAnimation];
    }
    self.selectItem = 2;
}

//tabbar选择时的代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    if (tabBarController.selectedIndex == 2){//选中中间的按钮
        
        if (self.selectItem != 2){
//             [self rotationAnimation];
        }
    }else {
        
        [_mcTabbar.centerBtn.layer removeAllAnimations];
    }
    self.selectItem = tabBarController.selectedIndex;
}
//旋转动画
- (void)rotationAnimation{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 3.0;
    rotationAnimation.repeatCount = HUGE;
    [_mcTabbar.centerBtn.layer addAnimation:rotationAnimation forKey:@"key"];
}
@end
