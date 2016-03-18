//
//  FSBounceAnimation.m
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/16.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import "FSBounceAnimation.h"

@implementation FSBounceAnimation

- (void)playSelectedTabBarItemAnimationWithImageView:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self playAnimationWithIcon:icon];
}

- (void)playAnimationWithIcon:(UIImageView *)icon{
    /**
     *  是CApropertyAnimation的子类，跟CABasicAnimation的区别是：CABasicAnimation只能从一个数值(fromValue)变到另一个数值(toValue)，而CAKeyframeAnimation会使用一个NSArray保存这些数值
     */
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = @[@1.0, @1.4, @.9, @1.15, @.95, @1.05, @1.0];
    bounceAnimation.duration = self.durationAnim;
//    bounceAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    bounceAnimation.calculationMode = kCAAnimationCubic;
    [icon.layer addAnimation:bounceAnimation forKey:nil];
}
@end
