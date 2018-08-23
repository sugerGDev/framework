//
//  UIButton+ClickRange.m
//  NRCCustomer
//
//  Created by suger on 2017/7/12.
//  Copyright © 2017年 NutritionRite Co.,Ltd. All rights reserved.
//

#import "UIButton+ClickRange.h"
#import <YYKit-fork/YYKit.h>

@implementation UIButton (ClickRange)

+ (void)load {
    [self swizzleInstanceMethod:@selector(pointInside:withEvent:)
                           with:@selector(swizzle_pointInside:withEvent:)];
    
}

- (BOOL)swizzle_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //通过修改bounds 的x,y 值就可以只向X 轴或者Y轴的某一个方向扩展
    
    //当bounds 的X 为负,Y 为0,就只向X的正方向扩展点击区域,反之亦然
    
    //当bounds 的Y 为负,X 为0,就只向Y的正方向扩展点击区域,反之亦然
    
    //当bounds 的Y 为0,X 为0,widthDelta,heightDelta来控制扩大的点击区域 ,这个是同时向X 轴正负方向或者同时向Y轴的正负方向
    
    CGRect bounds = self.bounds;
    //30.f 是希望的X 轴或者Y轴方向的点击区域的宽度或者高度
    CGFloat w = 30.f;
    CGFloat h = 30.f;
    
    CGFloat widthDelta = 0.f;
    CGFloat heightDelta = 0.f;
    
    if (bounds.size.width < w) {
        widthDelta = w - bounds.size.width;
    }
    
    if (bounds.size.height < h) {
        heightDelta = h - bounds.size.height;
    }
    
    bounds = CGRectInset(bounds, - 0.5f* widthDelta, - 0.5f* heightDelta);//注意这里是负数，扩大了之前的bounds的范围
    
    
    return CGRectContainsPoint(bounds, point);
    
}



@end


@implementation UIButton(Property)
@dynamic btnImage;

- (NSString *)btnTitle {
    return [self titleForState:UIControlStateNormal];
}

- (void)setBtnTitle:(NSString *)btnTitle {
    [self setTitle:btnTitle forState:UIControlStateNormal];
}

- (UIColor *)btnTitleColor {
    return [self titleColorForState:UIControlStateNormal];
}

- (void)setBtnTitleColor:(UIColor *)btnTitleColor{
    [self setTitleColor:btnTitleColor forState:UIControlStateNormal];
}

- (UIFont *)btnFont {
    return self.titleLabel.font;
}

- (void)setBtnFont:(UIFont *)btnFont {
    self.titleLabel.font = btnFont;
}

- (void)setBtnImage:(UIImage *)btnImage {
    [self setImage:btnImage forState:(UIControlStateNormal)];
}

- (UIImage *)btnImage {
    return [self imageForState:UIControlStateNormal];
}
@end






@implementation UIButton (Action)
- (void)target:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
}
@end

