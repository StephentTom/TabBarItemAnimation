//
//  FSAnimationTabBarItem.h
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/16.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FSBaseAnimation;

@interface FSAnimationTabBarItem : UITabBarItem

@property(nonatomic, strong) FSBaseAnimation *animation;

- (void)selectedTabBarItemWithImageView:(UIImageView *)icon textLabel:(UILabel *)textLabel;
- (void)deselectedTabBarItemWithImageView:(UIImageView *)icon textLabel:(UILabel *)textLabel;
- (void)playSelectedTabBarItemAnimationWithImageView:(UIImageView *)icon textLabel:(UILabel *)textLabel;
@end
