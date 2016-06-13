//
//  ImageLoadModel.h
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/12/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Prepare,
    DataLoading,
    ImageLoading,
    ImageLoadCompleted,
    Saving,
    Saved,
} ImageLoadState;

@class ExportGoodsView, ImageLoadModel;

@protocol ImageLoadModelDelegate <NSObject>

- (void)stateChanged:(ImageLoadModel *)model;

@end

@interface ImageLoadModel : NSObject

@property (nonatomic, copy) NSString *goodsId;
@property (nonatomic) ImageLoadState state;
@property (nonatomic, weak) id<ImageLoadModelDelegate> delegate;
@property (nonatomic, strong) ExportGoodsView *goodsView;
@property (nonatomic, strong) UIScrollView *contentScrollView;

- (void)startLoad;

@end
