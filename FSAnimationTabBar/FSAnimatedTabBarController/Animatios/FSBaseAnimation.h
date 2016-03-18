//
//  FSBaseAnimation.h
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/16.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FSBaseAnimation : NSObject
@property(nonatomic, assign) NSTimeInterval durationAnim;

- (void)playSelectedTabBarItemAnimationWithImageView:(UIImageView *)icon textLabel:(UILabel *)textLabel;
@end
