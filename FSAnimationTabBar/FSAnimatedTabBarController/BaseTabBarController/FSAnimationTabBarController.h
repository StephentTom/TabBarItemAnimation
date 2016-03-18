//
//  FSAnimationTabBarController.h
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/16.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSAnimationTabBarController : UITabBarController
/**
 *  创建存放icon和text的视图容器
 *
 *  @return 存放此容器的字典
 */
- (NSDictionary *)createContainerView;
/**
 *  创建每个容器中对应的icon和text
 */
- (void)createCustomIconAndText:(NSDictionary *)containers;
/**
 *  normolIcons, selectedIcons
 */
- (void)normolIcons:(NSArray *)icons selectedIcons:(NSArray *)selectedIcons;
@end

