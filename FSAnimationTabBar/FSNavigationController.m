//
//  FSNavigationController.m
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/16.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import "FSNavigationController.h"

@interface FSNavigationController ()

@end

@implementation FSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
