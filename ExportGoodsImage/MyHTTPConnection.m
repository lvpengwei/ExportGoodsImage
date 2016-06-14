//
//  MyHTTPConnection.m
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/12/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import "MyHTTPConnection.h"
#import "HTTPMessage.h"
#import "HTTPDataResponse.h"
#import "SSZipArchive.h"
#import "ExportImageManager.h"

@implementation MyHTTPConnection

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path {
    if ([path isEqualToString:@"/zip"]) {
        [[ExportImageManager sharedInstance] createZipFile];
        NSData *response = [[NSString stringWithFormat:@"<html><body><a href='http://%@'>Download</a><body></html>", [ExportImageManager sharedInstance].downloadUrl] dataUsingEncoding:NSUTF8StringEncoding];
        return [[HTTPDataResponse alloc] initWithData:response];
    } else if ([path hasPrefix:@"/create"]) {
        NSString *query = [path stringByReplacingOccurrencesOfString:@"/create?" withString:@""];
        NSArray *goodsIdArr = [query componentsSeparatedByString:@","];
        NSPort *port = [NSMachPort port];
        [[NSRunLoop currentRunLoop] addPort:port forMode:NSDefaultRunLoopMode];
        [ExportImageManager sharedInstance].thread = [NSThread currentThread];
        [[ExportImageManager sharedInstance] createImageWithGoodsIds:goodsIdArr];
        while (![ExportImageManager sharedInstance].completed) {
            NSLog(@"runloop start......");
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            NSLog(@"runloop end......");
        }
        [[NSRunLoop currentRunLoop] removePort:port forMode:NSDefaultRunLoopMode];
        CFRunLoopStop(CFRunLoopGetCurrent());
        [ExportImageManager sharedInstance].thread = nil;
        // 压缩
        [[ExportImageManager sharedInstance] createZipFile];
        NSData *response = [[NSString stringWithFormat:@"<html><body><a href='http://%@'>Download</a><body></html>", [ExportImageManager sharedInstance].downloadUrl] dataUsingEncoding:NSUTF8StringEncoding];
//        NSData *response = [[NSString stringWithFormat:@"<html><body><a href='http://%@'>Zip</a><body></html>", [ExportImageManager sharedInstance].zipUrl] dataUsingEncoding:NSUTF8StringEncoding];
        return [[HTTPDataResponse alloc] initWithData:response];
    }
    return [super httpResponseForMethod:method URI:path];
}

@end
