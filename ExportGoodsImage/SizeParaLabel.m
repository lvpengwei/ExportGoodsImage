//
//  SizeParaLabel.m
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/11/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import "SizeParaLabel.h"
#import "Masonry/Masonry.h"
#import "Config.h"

@interface SizeParaLabel ()

@property (nonatomic, strong) UIView *leftView;

@end

@implementation SizeParaLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _leftView = [[UIView alloc] initWithFrame:CGRectZero];
        _leftView.backgroundColor = [UIColor blackColor];
        [self addSubview:_leftView];
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont fontWithName:Font_Lantinghei_jian_xian size:13];
        [self addSubview:_contentLabel];
        
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(5);
            make.width.height.equalTo(@10);
            make.centerY.equalTo(self);
        }];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_leftView.mas_trailing).offset(10);
            make.centerY.equalTo(self);
            make.trailing.lessThanOrEqualTo(self);
        }];
    }
    return self;
}

@end
