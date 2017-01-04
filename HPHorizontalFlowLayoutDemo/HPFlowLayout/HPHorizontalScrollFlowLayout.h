//
//  HPHorizontalScrollFlowLayout.h
//  HPHorizontalFlowLayoutDemo
//
//  Created by huangpan on 16/10/25.
//  Copyright © 2016年 CZX. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSUInteger numberOfPages(NSUInteger itemsInPage, NSUInteger totalCount);

/**
 水平方向滑动与布局（暂时只考虑一个section的情形，后期再完善）
 */
@interface HPHorizontalScrollFlowLayout : UICollectionViewFlowLayout
/**
 每页的缩进
 */
@property (nonatomic, assign) UIEdgeInsets pageInset;
/**
 每个页面所包含的数量
 */
@property (nonatomic, assign) NSUInteger numberOfItemsInPage;
/**
 每页分多少列
 */
@property (nonatomic, assign) NSUInteger columnsInPage;
@end
