//
//  UIButton+ClickRange.h
//  NRCCustomer
//
//  Created by suger on 2017/7/12.
//  Copyright © 2017年 NutritionRite Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ClickRange)
- (BOOL)swizzle_pointInside:(CGPoint)point withEvent:(UIEvent *)event;
@end


@interface UIButton (Property)
@property(nonatomic, copy) NSString *btnTitle;
@property(nonatomic, strong) UIColor *btnTitleColor;
@property(nonatomic, strong) UIFont *btnFont;
@property(nonatomic, strong) UIImage *btnImage;
@end




@interface UIButton(Action)
- (void)target:(id)target action:(SEL)action;
@end

