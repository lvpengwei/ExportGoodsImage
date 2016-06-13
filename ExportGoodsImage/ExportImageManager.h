//
//  ExportImageManager.h
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/12/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExportImageManager : NSObject

@property (nonatomic, copy) NSString *zipUrl;
@property (nonatomic, copy) NSString *downloadUrl;
@property (nonatomic) BOOL completed;
@property (nonatomic, weak) NSThread *thread;

+ (instancetype)sharedInstance;
- (void)createImageWithGoodsId:(NSString *)goodsId;
- (void)createImageWithGoodsIds:(NSArray *)goodsIds;
- (void)createZipFile;

@end
