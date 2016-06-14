//
//  ImageLoadModel.m
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/12/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import "ImageLoadModel.h"
#import "ExportGoodsView.h"
#import "YYModel/NSObject+YYModel.h"
#import "GoodsData.h"
#import <Masonry/Masonry.h>
#import "Config.h"

@interface ImageLoadModel () <ExportGoodsViewDelegate>

@property (nonatomic, strong) NSDictionary *interfaceUrlDict;

@end

@implementation ImageLoadModel

#pragma mark - ExportGoodsViewDelegate

- (void)imageLoadCompleted {
    self.state = ImageLoadCompleted;
    UIImage *image = [ImageLoadModel imageFromView:self.goodsView];
    self.state = Saving;
    // save
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@.png", ImageExportPath, _goodsId];
    [[NSFileManager defaultManager] createDirectoryAtPath:[imagePath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
    [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    self.state = Saved;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _state = Prepare;
        _interfaceUrlDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"InterfaceUrl" ofType:@"plist"]];
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        
        _goodsView = [[ExportGoodsView alloc] initWithFrame:CGRectZero];
        _goodsView.delegate = self;
        [_contentScrollView addSubview:_goodsView];
        
        [_goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.bottom.equalTo(_contentScrollView);
            make.width.equalTo(@500);
        }];
    }
    return self;
}

- (void)setState:(ImageLoadState)state {
    if (_state != state) {
        _state = state;
        if ([self.delegate respondsToSelector:@selector(stateChanged:)]) {
            [self.delegate stateChanged:self];
        }
    }
}

- (void)startLoad {
    if (!_goodsId.length) {
        return;
    }
    self.state = DataLoading;
    if (_interfaceUrlDict && [[_interfaceUrlDict allKeys] containsObject:@"url"]) {
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@&goodsId=%@", _interfaceUrlDict[@"url"], _goodsId]] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0];
        __weak typeof(self)weakSelf = self;
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.state = ImageLoading;
                    GoodsData *goodsData = [GoodsData yy_modelWithJSON:data];
                    weakSelf.goodsView.data = goodsData;
                });
            }
        }];
        [task resume];
    } else {
        NSString *json = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"goods" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
        self.state = ImageLoading;
        GoodsData *goodsData = [GoodsData yy_modelWithJSON:json];
        self.goodsView.data = goodsData;
    }
}

+ (UIImage *)imageFromView:(UIView *)theView {
    UIGraphicsBeginImageContextWithOptions(theView.bounds.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
