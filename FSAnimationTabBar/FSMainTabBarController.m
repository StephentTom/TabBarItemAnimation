//
//  FSMainTabBarController.m
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/16.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import "FSMainTabBarController.h"
#import "FSNavigationController.h"
#import "FSHomeViewController.h"
#import "FSSupermarketViewController.h"
#import "FSMineViewController.h"
#import "FSAnimationTabBarItem.h"
#import "FSBounceAnimation.h"

@interface FSMainTabBarController ()
{
    BOOL _isFirstLoadMainTabBarController;
}
@property(nonatomic, strong) NSArray *iconImages;
@property(nonatomic, strong) NSArray *iconSelectedImages;

@end

@implementation FSMainTabBarController

- (NSArray *)iconImages{
    if (!_iconImages) {
        _iconImages = @[@"v2_home",@"v2_order",@"v2_my"];
    }
    return _iconImages;
}

- (NSArray *)iconSelectedImages{
    if (!_iconSelectedImages) {
        _iconSelectedImages = @[@"v2_home_r",@"v2_order_r",@"v2_my_r"];
    }
    return _iconSelectedImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _isFirstLoadMainTabBarController = YES;
    [self normolIcons:self.iconImages selectedIcons:self.iconSelectedImages];
    [self buildMainTabBarChildViewController];
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (_isFirstLoadMainTabBarController) {
        //创建容器
        NSDictionary *containerDict = [self createContainerView];
        //创建容器中的icon和text
        [self createCustomIconAndText:containerDict];
        //修改bool
        _isFirstLoadMainTabBarController = NO;
    }
}

- (void)buildMainTabBarChildViewController{

    FSHomeViewController *home               = [FSHomeViewController new];
    FSSupermarketViewController *supermarket = [FSSupermarketViewController new];
    FSMineViewController *mine               = [FSMineViewController new];
    
    [self setTabBarViewControllerWithChildViewController:home title:@"首页" imageName:@"v2_home" seletcedImageName:@"v2_home_r" tag:0];
    [self setTabBarViewControllerWithChildViewController:supermarket title:@"超市" imageName:@"v2_order" seletcedImageName:@"v2_order_r" tag:1];
    [self setTabBarViewControllerWithChildViewController:mine title:@"我的" imageName:@"v2_my" seletcedImageName:@"v2_my_r" tag:2];
}

- (void)setTabBarViewControllerWithChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName seletcedImageName:(NSString *)selectedImageName tag:(int)tag{

    FSAnimationTabBarItem *AnimationItem = [[FSAnimationTabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imageName] selectedImage:[UIImage imageNamed:selectedImageName]];
    AnimationItem.animation = [FSBounceAnimation new];
    
    FSNavigationController *nav = [[FSNavigationController alloc] initWithRootViewController:childController];
    childController.tabBarItem = AnimationItem;
    childController.tabBarItem.tag = (int)tag;
    childController.navigationItem.title = title;
    [self addChildViewController:nav];
}

@end
