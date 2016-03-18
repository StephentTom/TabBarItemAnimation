//
//  FSAnimationTabBarItem.m
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/16.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import "FSAnimationTabBarItem.h"
#import "FSBaseAnimation.h"

@implementation FSAnimationTabBarItem

- (UIColor *)selectedTabBarItemTextColor{
    return [UIColor grayColor];
}

- (UIColor *)normalTabBarItemTextColor{
    return [UIColor grayColor];
}

- (void)selectedTabBarItemWithImageView:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self setTabBarItemPropertyWithIcon:icon textLabel:textLabel textLabelColor:self.selectedTabBarItemTextColor];
}

- (void)deselectedTabBarItemWithImageView:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self setTabBarItemPropertyWithIcon:icon textLabel:textLabel textLabelColor:self.normalTabBarItemTextColor];
}

- (void)playSelectedTabBarItemAnimationWithImageView:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self setTabBarItemPropertyWithIcon:icon textLabel:textLabel textLabelColor:self.selectedTabBarItemTextColor];
    if (!self.animation) {
        NSLog(@"please add animation In UITabBarItem");
        return;
    }
    [self.animation playSelectedTabBarItemAnimationWithImageView:icon textLabel:textLabel];
}

#pragma mark - Private Method
- (void)setTabBarItemPropertyWithIcon:(UIImageView *)icon textLabel:(UILabel *)textLabel textLabelColor:(UIColor *)color{
    textLabel.textColor = color;
    if (icon.image) {
        [icon.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}
@end
