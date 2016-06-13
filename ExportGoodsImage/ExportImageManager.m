//
//  ExportImageManager.m
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/12/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import "ExportImageManager.h"
#import "ImageLoadModel.h"
#import "SSZipArchive.h"
#import "Config.h"

@interface ExportImageManager () <ImageLoadModelDelegate>

@property (nonatomic, strong) NSMutableArray *imageLoadArray; // 在处理中的goodsIds

@end

@implementation ExportImageManager

+ (instancetype)sharedInstance {
    static ExportImageManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ExportImageManager alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _completed = NO;
        _imageLoadArray = [NSMutableArray array];
    }
    return self;
}

#pragma mark - ImageLoadModelDelegate

- (void)stateChanged:(ImageLoadModel *)model {
    if (model.state == Saved) {
        [_imageLoadArray removeObject:model];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CREATEPROCESSNOTIFICATION" object:@(_imageLoadArray.count)];
    if (_imageLoadArray.count == 0) {
        if ([UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
            UILocalNotification *notification = [[UILocalNotification alloc] init];
            if (notification != nil) {
                notification.fireDate = [NSDate new]; //触发通知的时间
                notification.repeatInterval = 0; //循环次数，kCFCalendarUnitWeekday一周一次
                notification.timeZone = [NSTimeZone defaultTimeZone];
                notification.soundName = UILocalNotificationDefaultSoundName;
                notification.alertBody=@"本次图片生成完毕";
                notification.alertAction = @"确定";  //提示框按钮
                notification.hasAction = NO; //是否显示额外的按钮，为no时alertAction消失
                //发送通知
                [[UIApplication sharedApplication] scheduleLocalNotification:notification];
            }
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CREATESUCCESSNOTIFICATION" object:nil];
        if (self.thread) {
            [self performSelector:@selector(customSetCompleted:) onThread:self.thread withObject:@(YES) waitUntilDone:YES modes:@[NSDefaultRunLoopMode]];
        } else {
            [self performSelector:@selector(customSetCompleted:) onThread:[NSThread mainThread] withObject:@(YES) waitUntilDone:YES modes:@[NSDefaultRunLoopMode]];
        }
    }
}

- (void)customSetCompleted:(NSNumber *)val {
    self.completed = [val boolValue];
}

- (void)createImageWithGoodsId:(NSString *)goodsId {
    ImageLoadModel *imageLoad = [[ImageLoadModel alloc] init];
    imageLoad.goodsId = goodsId;
    imageLoad.delegate = self;
    [_imageLoadArray addObject:imageLoad];
    dispatch_async(dispatch_get_main_queue(), ^{
        [imageLoad startLoad];
    });
}

- (void)createImageWithGoodsIds:(NSArray *)goodsIds {
    self.completed = NO;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CREATETOTALNOTIFICATION" object:@(goodsIds.count)];
    });
    for (NSString *goodsId in goodsIds) {
        [self createImageWithGoodsId:goodsId];
    }
}

- (void)createZipFile {
    [SSZipArchive createZipFileAtPath:ImageExportZipPath withContentsOfDirectory:ImageExportPath];
    // clean files in export
    [[NSFileManager defaultManager] removeItemAtPath:ImageExportPath error:nil];
}

@end
