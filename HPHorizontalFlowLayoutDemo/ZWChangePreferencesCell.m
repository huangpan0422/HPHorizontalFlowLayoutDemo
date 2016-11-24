//
//  ZWChangePreferencesCell.m
//  BingoDu
//
//  Created by huangpan on 16/10/24.
//  Copyright © 2016年 2.1.6. All rights reserved.
//

#import "ZWChangePreferencesCell.h"

@implementation ZWChangePreferencesCell
@synthesize selected = _selected;
#pragma mark - Init
- (instancetype) initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame] ) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.contentView.layer.borderWidth = 1.0f;
    self.contentView.layer.borderColor = [UIColor purpleColor].CGColor;
    self.contentView.layer.cornerRadius = 14.0f;
    self.contentView.clipsToBounds = YES;
    self.contentView.backgroundColor = [UIColor whiteColor];
    //
    _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
    self.textLabel.font = [UIFont systemFontOfSize:12.0f];
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.minimumScaleFactor = 0.4f;
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.textLabel];
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    //
    NSDictionary *_views = @{@"text":self.textLabel};
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[text]-0-|" options:0 metrics:nil views:_views]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[text]-0-|" options:0 metrics:nil views:_views]];
}

@end
