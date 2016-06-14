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
#import "Config.h"

@interface ExportGoodsView ()

@property (nonatomic, strong) UIView *leftLineView;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UIView *rightLineView;
@property (nonatomic, strong) UILabel *productInformationLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *imageViewBG;
@property (nonatomic, strong) UIView *borderView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *dressLabel;
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
        
        _leftLineView = [[UIView alloc] initWithFrame:CGRectZero];
        _leftLineView.backgroundColor = [UIColor blackColor];
        [self addSubview:_leftLineView];
        
        _topLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _topLabel.textColor = [UIColor blackColor];
        _topLabel.text = @"产品信息";
        _topLabel.font = [UIFont fontWithName:Font_Lantinghei_jian_zhong size:18];
        [self addSubview:_topLabel];
        
        _rightLineView = [[UIView alloc] initWithFrame:CGRectZero];
        _rightLineView.backgroundColor = [UIColor blackColor];
        [self addSubview:_rightLineView];
        
        _productInformationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _productInformationLabel.font = [UIFont fontWithName:Font_ACaslonPro_Italic size:13];
        _productInformationLabel.text = @"Product Information";
        _productInformationLabel.textColor = RGB(0xa3, 0xa3, 0xa3);
        [self addSubview:_productInformationLabel];
        
        _borderView = [[UIView alloc] initWithFrame:CGRectZero];
        _borderView.layer.borderColor = RGB(0x7f, 0x7f, 0x7f).CGColor;
        _borderView.layer.borderWidth = 1;
        _borderView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_borderView];
        
        _imageViewBG = [[UIView alloc] initWithFrame:CGRectZero];
        _imageViewBG.backgroundColor = RGBA(0xf4, 0xf4, 0xf4, 1);
        [self addSubview:_imageViewBG];
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont fontWithName:Font_Lantinghei_jian_zhong size:15];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.text = @"短袖牛仔圆领T恤";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [_borderView addSubview:_nameLabel];
        
        _dressLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _dressLabel.text = @"Dress";
        _dressLabel.font = [UIFont fontWithName:Font_Bradley_Hand_Bold size:15];
        _dressLabel.textColor = RGB(0xa3, 0xa3, 0xa3);
        [_borderView addSubview:_dressLabel];
        
        _descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _descLabel.textColor = [UIColor blackColor];
        _descLabel.font = [UIFont fontWithName:Font_Lantinghei_jian_xian size:12];
        _descLabel.backgroundColor = [UIColor clearColor];
        _descLabel.numberOfLines = 0;
        _descLabel.text = @"版型简洁舒适，领口和袖口毛毛边设计充满复古气息";
        [_borderView addSubview:_descLabel];
        
        _sizeParaLabel1 = [[UILabel alloc] initWithFrame:CGRectZero];
        _sizeParaLabel1.textColor = [UIColor blackColor];
        _sizeParaLabel1.font = [UIFont fontWithName:Font_AdobeHeitiStd_Regular size:17];
        _sizeParaLabel1.text = @"尺码参数";
        [self addSubview:_sizeParaLabel1];
        
        _sizeParaLabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _sizeParaLabel2.textColor = [UIColor blackColor];
        _sizeParaLabel2.font = [UIFont fontWithName:Font_Lantinghei_jian_xian size:12];
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
        _sizeMaterialsLabel1.font = [UIFont fontWithName:Font_AdobeHeitiStd_Regular size:17];
        _sizeMaterialsLabel1.text = @"尺码材料";
        [self addSubview:_sizeMaterialsLabel1];
        
        _sizeMaterialsLabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _sizeMaterialsLabel2.textColor = [UIColor blackColor];
        _sizeMaterialsLabel2.font = [UIFont fontWithName:Font_Lantinghei_jian_xian size:12];
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
        _tipLabel.font = [UIFont fontWithName:Font_Lantinghei_jian_xian size:14];
        _tipLabel.text = @"因部分产品版型特殊及手工测量平铺尺寸可能与实际尺寸\n之间存在1~3cm误差，仅供参考！";
        _tipLabel.numberOfLines = 0;
        [self addSubview:_tipLabel];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 6.5;
        NSString *str = @"因部分产品版型特殊及手工测量平铺尺寸可能与实际尺寸\n之间存在1~3cm误差，仅供参考！";
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str attributes:@{ NSParagraphStyleAttributeName : paragraphStyle }];
        _tipLabel.attributedText = attributeStr;
        
        [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@80);
            make.centerX.equalTo(self);
        }];
        [_leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(40);
            make.trailing.equalTo(_topLabel.mas_leading).offset(-5);
            make.height.equalTo(@1.5);
            make.centerY.equalTo(_topLabel);
        }];
        [_rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_topLabel.mas_trailing).offset(5);
            make.trailing.equalTo(self).offset(-40);
            make.height.equalTo(@1.5);
            make.centerY.equalTo(_topLabel);
        }];
        [_productInformationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topLabel.mas_bottom).offset(6);
            make.centerX.equalTo(_topLabel);
        }];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.top.equalTo(self).offset(189);
            make.width.equalTo(@230);
            make.height.equalTo(@300);
        }];
        [_imageViewBG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_imageView).offset(10);
            make.top.equalTo(_imageView).offset(15);
            make.trailing.equalTo(_imageView).offset(8);
            make.bottom.equalTo(_imageView).offset(8);
        }];
        [_borderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(40);
            make.trailing.equalTo(self).offset(-30);
            make.top.equalTo(_imageView).offset(50);
            make.bottom.equalTo(_imageView).offset(27.5);
        }];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_borderView).offset(33);
            make.leading.equalTo(_borderView).offset(228);
            make.trailing.equalTo(_borderView).offset(-10);
        }];
        [_dressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_nameLabel);
            make.top.equalTo(_nameLabel.mas_bottom).offset(15);
        }];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_borderView).offset(233);
            make.top.equalTo(_dressLabel.mas_bottom).offset(20);
            make.trailing.equalTo(_borderView).offset(-15);
            make.bottom.lessThanOrEqualTo(_borderView).offset(-15);
        }];
        [_sizeParaLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_borderView.mas_bottom).offset(85);
            make.leading.equalTo(self).offset(20);
        }];
        [_sizeParaLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_sizeParaLabel1.mas_trailing).offset(10);
            make.baseline.equalTo(_sizeParaLabel1);
        }];
        [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.trailing.equalTo(self).offset(-20);
            make.top.equalTo(_sizeParaLabel1.mas_bottom).offset(10);
            make.height.equalTo(@0.5f);
        }];
        [_sizeParaContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.trailing.equalTo(self).offset(-20);
            make.top.equalTo(_lineView1.mas_bottom).offset(14);
        }];
        [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sizeParaContentView.mas_bottom).offset(4);
            make.leading.trailing.height.equalTo(_lineView1);
        }];
        [_sizeMaterialsLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_lineView2.mas_bottom).offset(45);
            make.leading.equalTo(_sizeParaLabel1);
        }];
        [_sizeMaterialsLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.baseline.equalTo(_sizeMaterialsLabel1);
            make.leading.equalTo(_sizeMaterialsLabel1.mas_trailing).offset(10);
        }];
        [_lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.trailing.equalTo(self).offset(-20);
            make.top.equalTo(_sizeMaterialsLabel1.mas_bottom).offset(10);
            make.height.equalTo(@0.5f);
        }];
        [_sizeMaterialsContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.trailing.equalTo(self).offset(-20);
            make.top.equalTo(_lineView3.mas_bottom).offset(14);
        }];
        [_lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sizeMaterialsContentView.mas_bottom).offset(4);
            make.leading.trailing.height.equalTo(_lineView3);
        }];
        [_tipImageBGView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(25);
            make.width.height.equalTo(@40);
            make.top.equalTo(_lineView4.mas_bottom).offset(12);
            make.bottom.equalTo(self).offset(-21);
        }];
        [_tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.bottom.equalTo(_tipImageBGView);
        }];
        [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_tipImageBGView);
            make.leading.equalTo(_tipImageBGView.mas_trailing).offset(12);
            make.trailing.equalTo(self).offset(-20);
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
            make.leading.equalTo(self).offset(20);
            make.trailing.equalTo(self).offset(-20);
            make.top.equalTo(_lineView1.mas_bottom).offset(14);
            make.height.equalTo(@((count / 3 + (count % 3 == 0 ? 0 : 1)) * 30));
        }];
        CGFloat width = (520 - 41 * 2) / 3;
        CGFloat height = 16;
        CGFloat left = 0;
        CGFloat top = 0;
        NSArray *keys = data.customerProperties.allKeys;
        for (int i = 0; i < count; i++) {
            left = width * (i % 3);
            top = (height + 14) * (i / 3);
            SizeParaLabel *label = [[SizeParaLabel alloc] initWithFrame:CGRectMake(left, top, width, height)];
            NSArray *arr = data.customerProperties[keys[i]];
            label.contentLabel.text = [NSString stringWithFormat:@"%@:%@", keys[i], arr[0]];
            [_sizeParaContentView addSubview:label];
        }
        
        NSArray *sizes = data.sizes;
        NSDictionary *sizeTables = data.sizeTable;
        [_sizeMaterialsContentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(20);
            make.trailing.equalTo(self).offset(-20);
            make.top.equalTo(_lineView3.mas_bottom).offset(14);
            make.height.equalTo(@((sizes.count + 1) * 30));
        }];
        NSArray *sizeTablesKey = [sizeTables allKeys];
        width = (520 - 41 * 2) / (sizeTablesKey.count + 1);
        top = 0;
        for (int i = 0; i < sizes.count + 1; i++) {
            left = 0;
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(left, top, width, height)];
            label.font = [UIFont fontWithName:Font_Lantinghei_jian_xian size:14];
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
                label.font = [UIFont fontWithName:Font_Lantinghei_jian_xian size:14];
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
