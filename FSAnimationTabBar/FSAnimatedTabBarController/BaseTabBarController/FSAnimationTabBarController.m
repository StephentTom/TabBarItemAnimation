//
//  FSAnimationTabBarController.m
//  FSAnimationTabBar
//
//  Created by Hongfs on 16/3/16.
//  Copyright © 2016年 __Company__. All rights reserved.
//

#import "FSAnimationTabBarController.h"
#import "FSAnimationTabBarItem.h"
#import "FSTabBarItemModel.h"

#define ScreenBounds [UIScreen          mainScreen].bounds
#define AppWidth [UIScreen              mainScreen].bounds.size.width
#define AppHeight [UIScreen             mainScreen].bounds.size.height
#define KContainerMDictKey(i) [NSString stringWithFormat:@"container%d",(int)i]

static const CGFloat kIconWH        = 21.0f;
static const CGFloat kTextLabelFont = 10.0f;

@interface FSAnimationTabBarController ()
@property (nonatomic, strong) NSMutableDictionary *containerViewMDict;
@property (nonatomic, strong) NSArray             *customItems;
@property (nonatomic, strong) NSArray             *iconImages;
@property (nonatomic, strong) NSArray             *iconSelectedImages;
@property (nonatomic, strong) NSMutableArray      *containersViewMArr;
@end

@implementation FSAnimationTabBarController

- (NSMutableDictionary *)containerViewMDict{
    if (!_containerViewMDict) {
        _containerViewMDict = [NSMutableDictionary dictionary];
    }
    return _containerViewMDict;
}

- (NSArray *)customItems{
    if (!_customItems) {
        _customItems = self.tabBar.items;
    }
    return _customItems;
}

- (NSMutableArray *)containersViewMArr{
    if (!_containersViewMArr) {
        _containersViewMArr = [NSMutableArray array];
    }
    return _containersViewMArr;
}

#pragma mark - cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)normolIcons:(NSArray *)icons selectedIcons:(NSArray *)selectedIcons{
    self.iconImages = icons;
    self.iconSelectedImages = selectedIcons;
}

#pragma mark - 创建容器
- (NSDictionary *)createContainerView{
    
    if (!self.customItems.count) return self.containerViewMDict;
    
    for (int i = 0; i<self.customItems.count; i++) {
        UIView *containerView = [self createViewContainer:i];
        [self.containerViewMDict setObject:containerView forKey:KContainerMDictKey(i)];
    }
    return self.containerViewMDict;
}

- (void)createCustomIconAndText:(NSDictionary *)containers{

    if (self.customItems.count) {
        [self.customItems enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIView *containerView = [containers objectForKey:KContainerMDictKey(idx)];
            if (!containerView) {
                NSLog(@"No container given");
            }
            
            //icon
            CGFloat imageW = kIconWH;
            CGFloat imageH = kIconWH;
            CGFloat imageX = (containerView.bounds.size.width - imageW) * 0.5;
            CGFloat imageY = (containerView.bounds.size.height - imageH) * 1/3;
            
            UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
            icon.contentMode = UIViewContentModeScaleAspectFit;
            //显示正常状态的图片
            icon.image = obj.image;
            icon.tintColor = [UIColor clearColor];
            
            //text
            CGFloat textLabelX = 0;
            CGFloat textLabelY = CGRectGetMaxY(icon.frame)+2;
            CGFloat textLabelW = containerView.bounds.size.width;
            CGFloat textLabelH = containerView.bounds.size.height - textLabelY;
            
            UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(textLabelX, textLabelY, textLabelW, textLabelH)];
            textLabel.textAlignment = NSTextAlignmentCenter;
            textLabel.backgroundColor = [UIColor clearColor];
            textLabel.text = obj.title;
            textLabel.textColor = [UIColor grayColor];
            textLabel.font = [UIFont systemFontOfSize:kTextLabelFont];
            
            [containerView addSubview:icon];
            [containerView addSubview:textLabel];
            
            /**
             *  销毁系统icon和text
             */
            obj.image = nil;
            obj.selectedImage = nil;
            obj.title = @"";
            
            /**
             *  存每个自定义容器模型
             */
            FSTabBarItemModel *model = [FSTabBarItemModel new];
            model.icon               = icon;
            model.textLabel          = textLabel;
            [self.containersViewMArr addObject:model];
            
            /**
             *  设置默认选中的Item
             */
            if (idx == 0) {
                self.selectedIndex = 0;
                //设置默认图片为选中图片和选中文字的颜色
                [self selectedTabBarItem:0];
            }
        }];
    }
}

//点击tabBarItem触发
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    [self selectedItemFrom:(int)self.selectedIndex to:(int)item.tag];
}

#pragma mark - Private Method
- (UIView *)createViewContainer:(int)index{

    CGFloat containerViewW = AppWidth/self.customItems.count;
    CGFloat containerViewX = containerViewW * index;
    CGFloat containerViewH = self.tabBar.bounds.size.height;
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(containerViewX, 0, containerViewW, containerViewH)];
    containerView.backgroundColor = [UIColor clearColor];
    containerView.userInteractionEnabled = YES;
    [self.tabBar addSubview:containerView];
    
    return containerView;
}

- (void)selectedTabBarItem:(int)index{

    //设置选中的自定义tabbarItem的icon和text
    FSTabBarItemModel *model = self.containersViewMArr[index];
    if (self.iconSelectedImages.count) {
        model.icon.image = [UIImage imageNamed:self.iconSelectedImages[index]];
        //修改自定义容器上text文字颜色(自定义tabbarItem)
        FSAnimationTabBarItem *item = (FSAnimationTabBarItem *)self.customItems[index];
        [item selectedTabBarItemWithImageView:model.icon textLabel:model.textLabel];
    }
}

- (void)selectedItemFrom:(int)from to:(int)to{
    
    //deselected
    FSTabBarItemModel *fromModel = self.containersViewMArr[from];
    fromModel.icon.image = [UIImage imageNamed:self.iconImages[from]];
    FSAnimationTabBarItem *fromItem = (FSAnimationTabBarItem *)self.customItems[from];
    [fromItem deselectedTabBarItemWithImageView:fromModel.icon textLabel:fromModel.textLabel];
    
    //playAnimation
    FSTabBarItemModel *toModel = self.containersViewMArr[to];
    toModel.icon.image = [UIImage imageNamed:self.iconSelectedImages[to]];
    FSAnimationTabBarItem *toItem = (FSAnimationTabBarItem *)self.customItems[to];
    [toItem playSelectedTabBarItemAnimationWithImageView:toModel.icon textLabel:toModel.textLabel];
}
@end
