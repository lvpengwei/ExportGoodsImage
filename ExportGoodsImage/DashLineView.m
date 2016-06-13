//
//  DashLineView.m
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/12/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import "DashLineView.h"

@interface DashLineView ()

@property (nonatomic, strong) CAShapeLayer *dashLineLayer;

@end

@implementation DashLineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _dashLineLayer = [CAShapeLayer layer];
        _dashLineLayer.frame = CGRectZero;
        _dashLineLayer.strokeStart = 0.0;
        _dashLineLayer.strokeColor = [UIColor blackColor].CGColor;
        _dashLineLayer.lineWidth = 4;
        _dashLineLayer.lineJoin = kCALineJoinRound;
        _dashLineLayer.lineDashPattern = @[@4, @4];
        _dashLineLayer.lineDashPhase = 0.0f;
        _dashLineLayer.masksToBounds = YES;
        [self.layer addSublayer:_dashLineLayer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, 0)];
    _dashLineLayer.path = path.CGPath;
    _dashLineLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

@end
