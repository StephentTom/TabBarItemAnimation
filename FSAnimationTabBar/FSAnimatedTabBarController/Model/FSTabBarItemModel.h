//
//  FSTabBarItemModel.h
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/18.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FSTabBarItemModel : NSObject
/**
 *  容器中icon
 */
@property(nonatomic, strong) UIImageView *icon;
/**
 *  容器中文本
 */
@property(nonatomic, strong) UILabel *textLabel;
@end
