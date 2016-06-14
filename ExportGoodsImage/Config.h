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

#define Font_Lantinghei_jian_xian @"FZLTXHK--GBK1-0"
#define Font_Lantinghei_jian_zhong @"FZLTZHK--GBK1-0"
#define Font_Lantinghei_jian_bold @"FZLTTHK--GBK1-0"
#define Font_Bradley_Hand_Bold @"BradleyHandITCTT-Bold"
#define Font_AdobeHeitiStd_Regular @"AdobeHeitiStd-Regular"
#define Font_ACaslonPro_SemiboldItalic @"ACaslonPro-SemiboldItalic"
#define Font_ACaslonPro_Italic @"ACaslonPro-Italic"
#define Font_ACaslonPro_BoldItalic @"ACaslonPro-BoldItalic"

#define mRGBToColor(rgb) [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0 green:((float)((rgb & 0xFF00) >> 8))/255.0 blue:((float)(rgb & 0xFF))/255.0 alpha:1.0]
#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#endif /* Config_h */
