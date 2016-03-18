//
//  FSHomeViewController.m
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/17.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import "FSHomeViewController.h"
#import "FSTestViewController.h"

@interface FSHomeViewController ()

@end

@implementation FSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [button setFrame:CGRectMake(100, 100, 35, 35)];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick{
    FSTestViewController *test = [FSTestViewController new];
    [self.navigationController pushViewController:test animated:YES];
}
@end
