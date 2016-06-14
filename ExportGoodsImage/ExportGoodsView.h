//
//  ExportGoodsView.h
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/11/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

// width 500

@class GoodsData;

@protocol ExportGoodsViewDelegate <NSObject>

- (void)imageLoadCompleted;

@end

@interface ExportGoodsView : UIView

@property (nonatomic, strong) GoodsData *data;
@property (nonatomic, weak) id<ExportGoodsViewDelegate> delegate;

@end
