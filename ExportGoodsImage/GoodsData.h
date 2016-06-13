//
//  GoodsData.h
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/12/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsData : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSArray *sizes;
@property (nonatomic, strong) NSDictionary *sizeTable;
@property (nonatomic, copy) NSString *sellerMessage;
@property (nonatomic, strong) NSDictionary *customerProperties;

@end
