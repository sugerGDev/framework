//
//  SJUIKit.h
//  LXProject
//
//  Created by sharejoy_lx on 16-10-18.
//  Copyright © 2016年 MaiMaiMai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYKit-fork/YYKit.h>
#import <YYKit-fork/YYKitMacro.h>

#import <QMUIKit/QMUIKit.h>
#import <MJRefresh/MJRefresh.h>


#import <WHC_AutoLayoutKit/WHC_AutoLayout.h>



#import "UIButton+ClickRange.h"


static inline CGFloat kRate() {
    return  (375.f / YYScreenSize().width );
}


/**
 * size 按指定的倍数缩放
 * @param targetSize 需缩放的Size
 * @param facter  指定倍数
 * @return 缩放 后的 size
 */
static inline CGSize kSizeMultipyByFactor(const CGSize targetSize, float facter) {
    return CGSizeMake(targetSize.width * facter, targetSize.height * facter);
}

/**
 * 创建等宽高Size
 * @param facter  指定宽高
 * @return 创建 后的 size
 */

static inline CGSize kSizeEqualByFactor(float facter) {
    return CGSizeMake(facter, facter);
}

/**
 * 设置距离
 * @param targetFloat 当前距离
 * @return 根据屏幕大小返回指定距离
 */
static inline CGFloat kFloatFit(float targetFloat) {
    return MIN(targetFloat, (targetFloat / kRate() ) );
}

/**
 * 获取图片实际大小
 * @param imageSize 图片大小
 * @return 图片实际大小
 */
static inline CGSize kImageSize(CGSize imageSize) {
    return CGSizeMake(imageSize.width * YYScreenScale(), imageSize.height * YYScreenScale());
}


/**
 * 限制图片实际大小在指定范围
 * @param imageSize 图片大小
 * @param limit 限制
 * @return 图片限制后大小
 */
static inline CGSize kImageSizeLimit(CGSize imageSize, CGFloat limit) {

    CGSize tImageSize = CGSizeCeil(imageSize);
    CGFloat tLimit = limit;

    if (tImageSize.width > tLimit) {
        tImageSize = CGSizeMake(tLimit, tImageSize.height);
    }

    if (tImageSize.height > tLimit) {
        tImageSize = CGSizeMake(tImageSize.width, tLimit);
    }

    return tImageSize;


}


@interface SJUIKit : NSObject

#pragma mark --------- UILabel --------

/** Label 字色 字号 */
+ (QMUILabel *)labelTextColor:(UIColor *)textColor
                   fontSize:(CGFloat)size;

/** Label 文字 字号 */
+ (QMUILabel *)labelWithText:(NSString *)text
                  fontSize:(CGFloat)size;

/** Label 字色 行数 文字 字号 */
+ (QMUILabel *)labelWithTextColor:(UIColor *)textColor
                  numberOfLines:(NSInteger)numberOfLines
                           text:(NSString *)text
                       fontSize:(CGFloat)size;

/** Label 背景色 字色 对其 行数 文字 字号 */
+ (QMUILabel *)labelWithBackgroundColor:(UIColor *)backgroundColor
                            textColor:(UIColor *)textColor
                        textAlignment:(NSTextAlignment)textAlignment
                        numberOfLines:(NSInteger)numberOfLines
                                 text:(NSString *)text
                             fontSize:(CGFloat)size;

#pragma mark --------- UIImageView --------

/** ImageView 图片 */
+ (UIImageView *)imageViewWithImage:(UIImage *)image;

/** ImageView 图片 交互 */
+ (UIImageView *)imageViewWithImage:(UIImage *)image
             userInteractionEnabled:(BOOL)enabled;

/** ImageView 填充方式 图片 */
+ (UIImageView *)imageViewWithContentMode:(UIViewContentMode)mode
                                    image:(UIImage *)image;

/** ImageView 填充方式 交互 图片 */
+ (UIImageView *)imageViewWithContentMode:(UIViewContentMode)mode
                   userInteractionEnabled:(BOOL)enabled
                                    image:(UIImage *)image;

#pragma mark --------- UIButton --------

/** UIButton 前景图 */
+ (QMUIButton *)buttonWithImage:(UIImage *)image;

/** UIButton 背景色 标题色 标题 字号 */
+ (QMUIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor
                               titleColor:(UIColor *)titleColor
                                    title:(NSString *)title
                                 fontSize:(CGFloat)size;

/** UIButton 背景色 标题色 标题高亮色 标题 字号 */
+ (QMUIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor
                               titleColor:(UIColor *)titleColor
                      titleHighlightColor:(UIColor *)titleHighlightColor
                                    title:(NSString *)title
                                 fontSize:(CGFloat)size;



#pragma mark --------- TableView --------

+ (UITableView *)tableViewWithFrame:(CGRect)frame
                              style:(UITableViewStyle)style
                           delegate:(id)delegate;

+ (void)sj_tableView:(UITableView *)tableView withDelegate:(id)delegate;

+ (void)sj_cleanDelegateWithTableView:(UITableView *)tableView;


#pragma mark --------- CollectionView --------

+ (void)sj_cleanDelegateWithCollectionView:(UICollectionView *)collectionView;

+ (void)sj_collectionView:(UICollectionView *)collectionView;

#pragma mark --------- Layer --------

+ (CALayer *)layerWithSize:(CGSize)size;

+ (CALayer *)layerWithSize:(CGSize)size CornerRadius:(CGFloat)cornerRadius;

+ (CALayer *)layerWithSize:(CGSize)size CornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;
@end







