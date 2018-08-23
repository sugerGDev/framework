//
//  SJUIKit.m
//  LXProject
//
//  Created by sharejoy_lx on 16-10-18.
//  Copyright © 2016年 MaiMaiMai. All rights reserved.
//

#import "SJUIKit.h"

@implementation SJUIKit


#pragma mark --------- Label --------

+ (QMUILabel *)labelTextColor:(UIColor *)textColor
                   fontSize:(CGFloat)size {
    return [SJUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:textColor textAlignment:NSTextAlignmentLeft numberOfLines:1 text:nil fontSize:size];

}

+ (QMUILabel *)labelWithText:(NSString *)text
                  fontSize:(CGFloat)size {
    return [SJUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:1 text:text fontSize:size];

}

+ (QMUILabel *)labelWithTextColor:(UIColor *)textColor
                  numberOfLines:(NSInteger)numberOfLines
                           text:(NSString *)text
                       fontSize:(CGFloat)size {
    return [SJUIKit labelWithBackgroundColor:[UIColor clearColor] textColor:textColor textAlignment:NSTextAlignmentLeft numberOfLines:numberOfLines text:text fontSize:size];

}

+ (QMUILabel *)labelWithBackgroundColor:(UIColor *)backgroundColor
                            textColor:(UIColor *)textColor
                        textAlignment:(NSTextAlignment)textAlignment
                        numberOfLines:(NSInteger)numberOfLines
                                 text:(NSString *)text
                             fontSize:(CGFloat)size {

    QMUILabel *label = [[QMUILabel alloc] init];
    label.backgroundColor = backgroundColor;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.numberOfLines = numberOfLines;
    label.text = text;
    label.height = size + 2;
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

#pragma mark --------- ImageView --------

+ (UIImageView *)imageViewWithImage:(UIImage *)image {

    return [SJUIKit imageViewWithContentMode:UIViewContentModeScaleToFill userInteractionEnabled:NO image:image];
}

+ (UIImageView *)imageViewWithImage:(UIImage *)image
             userInteractionEnabled:(BOOL)enabled {

    return [SJUIKit imageViewWithContentMode:UIViewContentModeScaleToFill userInteractionEnabled:enabled image:image];
}

+ (UIImageView *)imageViewWithContentMode:(UIViewContentMode)mode
                                    image:(UIImage *)image {

    return [SJUIKit imageViewWithContentMode:mode userInteractionEnabled:NO image:image];
}

+ (UIImageView *)imageViewWithContentMode:(UIViewContentMode)mode
                   userInteractionEnabled:(BOOL)enabled
                                    image:(UIImage *)image {

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = mode;
    imageView.userInteractionEnabled = enabled;
    imageView.image = image;
    return imageView;
}

#pragma mark --------- UIButton --------

+ (QMUIButton *)buttonWithImage:(UIImage *)image {
    QMUIButton *btn = [QMUIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    return btn;

}


+ (QMUIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor
                               titleColor:(UIColor *)titleColor
                                    title:(NSString *)title
                                 fontSize:(CGFloat)size {

    return [SJUIKit buttonWithBackgroundColor:backgroundColor titleColor:titleColor titleHighlightColor:titleColor title:title fontSize:size];
}

+ (QMUIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor
                               titleColor:(UIColor *)titleColor
                      titleHighlightColor:(UIColor *)titleHighlightColor
                                    title:(NSString *)title
                                 fontSize:(CGFloat)size {

    QMUIButton *btn = [[QMUIButton alloc]init];
    btn.backgroundColor = backgroundColor;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:titleHighlightColor forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:size];
    return btn;
}


+ (UITableView *)tableViewWithFrame:(CGRect)frame
                              style:(UITableViewStyle)style
                           delegate:(id)delegate {

    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [self sj_tableView:tableView withDelegate:delegate];

    return tableView;
}

+ (void)sj_tableView:(UITableView *)tableView withDelegate:(id)delegate {

    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = delegate;
    tableView.dataSource = delegate;

    if (@available(iOS 11, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
    }

    tableView.backgroundColor = [UIColor whiteColor];
    UIView *footerView = [[UIView alloc] init];
    tableView.tableFooterView = footerView;

}

+ (void)sj_collectionView:(UICollectionView *)collectionView {
    
    if (@available(iOS 11, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

}


+ (void)sj_cleanDelegateWithTableView:(UITableView *)tableView {
    tableView.delegate = nil;
    tableView.dataSource = nil;
}

+ (void)sj_cleanDelegateWithCollectionView:(UICollectionView *)collectionView {
    collectionView.delegate = nil;
    collectionView.dataSource = nil;

}


+ (CALayer *)layerWithSize:(CGSize)size CornerRadius:(CGFloat)cornerRadius {
    CALayer *layer = [self layerWithSize:size];

    layer.masksToBounds = YES;

    layer.cornerRadius = cornerRadius;

    return layer;
}


+ (CALayer *)layerWithSize:(CGSize)size {
    CALayer *layer = [CALayer layer];
    [layer qmui_removeDefaultAnimations];
    layer.size = size;
    return layer;
}


+ (CALayer *)layerWithSize:(CGSize)size CornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {

    CALayer *layer = [self layerWithSize:size CornerRadius:cornerRadius];

    layer.backgroundColor = borderColor.CGColor;

    layer.borderWidth = borderWidth;

    return layer;
}

@end
