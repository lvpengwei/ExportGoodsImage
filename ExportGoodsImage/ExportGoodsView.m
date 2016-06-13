//
//  ExportGoodsView.m
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/11/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import "ExportGoodsView.h"
#import <Masonry/Masonry.h>
#import "DashLineView.h"
#import "SizeParaLabel.h"
#import "GoodsData.h"
#import "UIImageView+WebCache.h"

@interface ExportGoodsView ()

@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *borderView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *sizeParaLabel1;
@property (nonatomic, strong) UILabel *sizeParaLabel2;
@property (nonatomic, strong) DashLineView *lineView1;
@property (nonatomic, strong) UIView *sizeParaContentView;
@property (nonatomic, strong) DashLineView *lineView2;
@property (nonatomic, strong) UILabel *sizeMaterialsLabel1;
@property (nonatomic, strong) UILabel *sizeMaterialsLabel2;
@property (nonatomic, strong) DashLineView *lineView3;
@property (nonatomic, strong) UIView *sizeMaterialsContentView;
@property (nonatomic, strong) DashLineView *lineView4;
@property (nonatomic, strong) UIView *tipImageBGView;
@property (nonatomic, strong) UIImageView *tipImageView;
@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation ExportGoodsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _topLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _topLabel.textColor = [UIColor blackColor];
        _topLabel.font = [UIFont systemFontOfSize:24];
        _topLabel.text = @"产品信息";
        [self addSubview:_topLabel];
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_imageView];
        
        _borderView = [[UIView alloc] initWithFrame:CGRectZero];
        _borderView.layer.borderColor = [UIColor blackColor].CGColor;
        _borderView.layer.borderWidth = 3;
        _borderView.backgroundColor = [UIColor clearColor];
        [self addSubview:_borderView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.text = @"短袖牛仔圆领T恤";
        [_borderView addSubview:_nameLabel];
        
        _descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _descLabel.textColor = [UIColor blackColor];
        _descLabel.font = [UIFont systemFontOfSize:13];
        _descLabel.backgroundColor = [UIColor clearColor];
        _descLabel.numberOfLines = 0;
        _descLabel.text = @"版型简洁舒适，领口和袖口毛毛边设计充满复古气息";
        [_borderView addSubview:_descLabel];
        
        _sizeParaLabel1 = [[UILabel alloc] initWithFrame:CGRectZero];
        _sizeParaLabel1.textColor = [UIColor blackColor];
        _sizeParaLabel1.font = [UIFont boldSystemFontOfSize:18.5];
        _sizeParaLabel1.text = @"尺码参数";
        [self addSubview:_sizeParaLabel1];
        
        _sizeParaLabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _sizeParaLabel2.textColor = [UIColor blackColor];
        _sizeParaLabel2.font = [UIFont systemFontOfSize:13];
        _sizeParaLabel2.text = @"Size Parameter";
        [self addSubview:_sizeParaLabel2];
        
        _lineView1 = [[DashLineView alloc] initWithFrame:CGRectZero];
        [self addSubview:_lineView1];
        
        _sizeParaContentView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_sizeParaContentView];
        
        _lineView2 = [[DashLineView alloc] initWithFrame:CGRectZero];
        [self addSubview:_lineView2];
        
        _sizeMaterialsLabel1 = [[UILabel alloc] initWithFrame:CGRectZero];
        _sizeMaterialsLabel1.textColor = [UIColor blackColor];
        _sizeMaterialsLabel1.font = [UIFont boldSystemFontOfSize:18.5];
        _sizeMaterialsLabel1.text = @"尺码材料";
        [self addSubview:_sizeMaterialsLabel1];
        
        _sizeMaterialsLabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _sizeMaterialsLabel2.textColor = [UIColor blackColor];
        _sizeMaterialsLabel2.font = [UIFont systemFontOfSize:13];
        _sizeMaterialsLabel2.text = @"Size Materials";
        [self addSubview:_sizeMaterialsLabel2];
        
        _lineView3 = [[DashLineView alloc] initWithFrame:CGRectZero];
        [self addSubview:_lineView3];
        
        _sizeMaterialsContentView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_sizeMaterialsContentView];
        
        _lineView4 = [[DashLineView alloc] initWithFrame:CGRectZero];
        [self addSubview:_lineView4];
        
        _tipImageBGView = [[UIView alloc] initWithFrame:CGRectZero];
        _tipImageBGView.backgroundColor = [UIColor blackColor];
        [self addSubview:_tipImageBGView];
        
        _tipImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _tipImageView.image = [UIImage imageNamed:@"tip_image"];
        [_tipImageBGView addSubview:_tipImageView];
        
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.textColor = [UIColor blackColor];
        _tipLabel.font = [UIFont systemFontOfSize:13];
        _tipLabel.text = @"因部分产品版型特殊及手工测量平铺尺寸可能与实际尺寸\n之间存在1~3cm误差，仅供参考！";
        _tipLabel.numberOfLines = 0;
        [self addSubview:_tipLabel];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 6.5;
        NSString *str = @"因部分产品版型特殊及手工测量平铺尺寸可能与实际尺寸\n之间存在1~3cm误差，仅供参考！";
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{ NSParagraphStyleAttributeName : paragraphStyle }];
        _tipLabel.attributedText = attributeStr;
        
        [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@50);
            make.centerX.equalTo(self);
        }];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(13);
            make.top.equalTo(_topLabel.mas_bottom).offset(50);
            make.width.height.equalTo(@300);
        }];
        [_borderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_imageView.mas_trailing).offset(-50);
            make.top.equalTo(_imageView).offset(15);
            make.width.equalTo(@240);
            make.height.greaterThanOrEqualTo(@163);
        }];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.equalTo(_borderView).offset(20);
            make.trailing.lessThanOrEqualTo(_borderView).offset(-20);
        }];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_borderView).offset(15);
            make.top.equalTo(_nameLabel.mas_bottom).offset(40);
            make.trailing.equalTo(_borderView).offset(-15);
            make.bottom.lessThanOrEqualTo(_borderView).offset(-15);
        }];
        [_sizeParaLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imageView.mas_bottom).offset(50);
            make.leading.equalTo(self).offset(40);
        }];
        [_sizeParaLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_sizeParaLabel1.mas_trailing).offset(12);
            make.baseline.equalTo(_sizeParaLabel1);
        }];
        [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(39);
            make.trailing.equalTo(self).offset(-39);
            make.top.equalTo(_sizeParaLabel1.mas_bottom).offset(10);
            make.height.equalTo(@0.5f);
        }];
        [_sizeParaContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(41);
            make.trailing.equalTo(self).offset(-41);
            make.top.equalTo(_lineView1.mas_bottom).offset(15);
        }];
        [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sizeParaContentView.mas_bottom).offset(20);
            make.leading.trailing.height.equalTo(_lineView1);
        }];
        [_sizeMaterialsLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_lineView2.mas_bottom).offset(50);
            make.leading.equalTo(_sizeParaLabel1);
        }];
        [_sizeMaterialsLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.baseline.equalTo(_sizeMaterialsLabel1);
            make.leading.equalTo(_sizeMaterialsLabel1.mas_trailing).offset(12);
        }];
        [_lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(39);
            make.trailing.equalTo(self).offset(-39);
            make.top.equalTo(_sizeMaterialsLabel1.mas_bottom).offset(10);
            make.height.equalTo(@0.5f);
        }];
        [_sizeMaterialsContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(41);
            make.trailing.equalTo(self).offset(-41);
            make.top.equalTo(_lineView3.mas_bottom).offset(15);
        }];
        [_lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sizeMaterialsContentView.mas_bottom).offset(20);
            make.leading.trailing.height.equalTo(_lineView3);
        }];
        [_tipImageBGView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(44);
            make.width.height.equalTo(@40);
            make.top.equalTo(_lineView4.mas_bottom).offset(13);
            make.bottom.equalTo(self).offset(-20);
        }];
        [_tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.bottom.equalTo(_tipImageBGView);
        }];
        [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_tipImageBGView);
            make.leading.equalTo(_tipImageBGView.mas_trailing).offset(10);
        }];
    }
    return self;
}

- (void)setData:(GoodsData *)data {
    if (_data != data) {
        _data = data;
        
        _nameLabel.text = data.name;
        _descLabel.text = data.sellerMessage;
        __weak typeof(self)weakSelf = self;
        [_imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://image.yourdream.cc/%@", data.image]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (!error) {
                if ([weakSelf.delegate respondsToSelector:@selector(imageLoadCompleted)]) {
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [weakSelf.delegate imageLoadCompleted];
                    });
                }
            }
        }];
        
        NSInteger count = data.customerProperties.count;
        [_sizeParaContentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(41);
            make.trailing.equalTo(self).offset(-41);
            make.top.equalTo(_lineView1.mas_bottom).offset(2);
            make.height.equalTo(@((count / 3 + (count % 3 == 0 ? 0 : 1)) * 30));
        }];
        CGFloat width = (520 - 41 * 2) / 3;
        CGFloat height = 16;
        CGFloat left = 0;
        CGFloat top = 14;
        NSArray *keys = data.customerProperties.allKeys;
        for (int i = 0; i < count; i++) {
            left = width * (i % 3);
            top = (height + 14) * (i / 3) + 14;
            SizeParaLabel *label = [[SizeParaLabel alloc] initWithFrame:CGRectMake(left, top, width, height)];
            NSArray *arr = data.customerProperties[keys[i]];
            label.contentLabel.text = [NSString stringWithFormat:@"%@:%@", keys[i], arr[0]];
            [_sizeParaContentView addSubview:label];
        }
        
        NSArray *sizes = data.sizes;
        NSDictionary *sizeTables = data.sizeTable;
        [_sizeMaterialsContentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(41);
            make.trailing.equalTo(self).offset(-41);
            make.top.equalTo(_lineView3.mas_bottom).offset(2);
            make.height.equalTo(@((sizes.count + 1) * 30));
        }];
        NSArray *sizeTablesKey = [sizeTables allKeys];
        width = (520 - 41 * 2) / (sizeTablesKey.count + 1);
        top = 14;
        for (int i = 0; i < sizes.count + 1; i++) {
            left = 0;
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(left, top, width, height)];
            label.font = [UIFont systemFontOfSize:13];
            label.textColor = [UIColor blackColor];
            label.textAlignment = NSTextAlignmentCenter;
            if (i == 0) {
                label.text = @"尺码";
            } else {
                label.text = sizes[i - 1];
            }
            [_sizeMaterialsContentView addSubview:label];
            left = width;
            for (int j = 0; j < sizeTablesKey.count; j++) {
                NSString *key = sizeTablesKey[j];
                NSDictionary *val = sizeTables[key];
                label = [[UILabel alloc] initWithFrame:CGRectMake(left, top, width, height)];
                label.font = [UIFont systemFontOfSize:13];
                label.textColor = [UIColor blackColor];
                label.textAlignment = NSTextAlignmentCenter;
                if (i == 0) {
                    label.text = sizeTablesKey[j];
                } else {
                    label.text = val[sizes[i - 1]];
                }
                left += width;
                [_sizeMaterialsContentView addSubview:label];
            }
            top += (height + 14);
        }
        [self setNeedsUpdateConstraints];
        [self layoutIfNeeded];
    }
}

@end
