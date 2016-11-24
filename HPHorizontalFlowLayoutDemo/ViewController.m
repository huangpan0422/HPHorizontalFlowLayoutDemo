//
//  ViewController.m
//  HPHorizontalFlowLayoutDemo
//
//  Created by huangpan on 16/11/24.
//  Copyright © 2016年 Leon. All rights reserved.
//

#import "ViewController.h"
#import "SMPageControl.h"
#import "ZWChangePreferencesCell.h"
#import "HPHorizontalScrollFlowLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) SMPageControl *pageControl;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _configurePageControl];
    [self _configureCollectionView];
}

- (void)_configurePageControl {
    _pageControl = [[SMPageControl alloc] init];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    self.pageControl.indicatorMargin = 6.4f;
    self.pageControl.alignment = SMPageControlAlignmentCenter;
    self.pageControl.verticalAlignment = SMPageControlVerticalAlignmentBottom;
    self.pageControl.hidesForSinglePage = YES;
    self.pageControl.numberOfPages = 5;
    [self.view addSubview:self.pageControl];
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)_configureCollectionView {
    UIEdgeInsets edgeInset = UIEdgeInsetsMake(0.0f, 12.0f, 0.0f, 12.0f);
    CGFloat columns = 4;
    CGFloat itemHeight = 28.0f;
    CGFloat horizontalGap = 13.0f;
    //
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width - edgeInset.left - edgeInset.right - columns * horizontalGap + horizontalGap) / columns;
    
    HPHorizontalScrollFlowLayout * layout = [[HPHorizontalScrollFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.minimumInteritemSpacing = 12;
    layout.minimumLineSpacing = horizontalGap;
    layout.numberOfItemsInPage = 24;
    layout.columnsInPage = 4;
    layout.pageInset = edgeInset;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView registerClass:[ZWChangePreferencesCell class] forCellWithReuseIdentifier:ZWChangePreferencesCellIdentifier];
    
    //
    NSDictionary *_views = @{@"collection":self.collectionView,
                             @"page":self.pageControl};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collection]-0-|" options:0 metrics:nil views:_views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[collection(==250)]" options:0 metrics:nil views:_views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[page]-0-|" options:0 metrics:nil views:_views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[collection]-10-[page(==10)]" options:0 metrics:nil views:_views]];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = floor(scrollView.contentOffset.x) / self.view.bounds.size.width;
    if ( page >=0 && page <= self.pageControl.numberOfPages ) {
        self.pageControl.currentPage = page;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZWChangePreferencesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZWChangePreferencesCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试%zd",indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
