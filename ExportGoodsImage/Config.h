//
//  Config.h
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/12/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define ImageExportPath [NSString stringWithFormat:@"%@/export", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]]
#define ImageExportZipPath [NSString stringWithFormat:@"%@/export.zip", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]]

#endif /* Config_h */
