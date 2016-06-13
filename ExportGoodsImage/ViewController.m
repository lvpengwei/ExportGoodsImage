//
//  ViewController.m
//  ExportGoodsImage
//
//  Created by lvpengwei on 6/11/16.
//  Copyright © 2016 lvpengwei. All rights reserved.
//

#import "ViewController.h"
#import "ExportGoodsView.h"
#import <Masonry/Masonry.h>
#import "ImageLoadModel.h"
#import "HTTPServer.h"
#import "MyHTTPConnection.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#import "ExportImageManager.h"
#import "SDWebImageManager.h"
#import "Config.h"

@interface ViewController ()

//@property (nonatomic, strong) ImageLoadModel *loadModel;
@property (nonatomic, strong) HTTPServer *httpServer;
@property (weak, nonatomic) IBOutlet UILabel *createLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;
@property (weak, nonatomic) IBOutlet UILabel *processLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalCountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 临时显示
//    _loadModel = [[ImageLoadModel alloc] init];
//    _loadModel.goodsId = @"27021599157995855";
//    
//    UIScrollView *scrollView = _loadModel.contentScrollView;
//    [self.view addSubview:scrollView];
//    
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.trailing.top.bottom.equalTo(self.view);
//    }];
    
//    [_loadModel startLoad];
    
    _httpServer = [[HTTPServer alloc] init];
    [_httpServer setType:@"_http._tcp."];
    [_httpServer setDocumentRoot:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]];
    [_httpServer setConnectionClass:[MyHTTPConnection class]];
    _httpServer.port = 8081;
    [self startServer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createSuccess) name:@"CREATESUCCESSNOTIFICATION" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processNotification:) name:@"CREATEPROCESSNOTIFICATION" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(totalCountNotification:) name:@"CREATETOTALNOTIFICATION" object:nil];
}

- (void)createSuccess {
    self.processLabel.text = @"处理完毕";
}

- (void)totalCountNotification:(NSNotification *)notification {
    self.totalCountLabel.text = [NSString stringWithFormat:@"总共%@", notification.object];
}

- (void)processNotification:(NSNotification *)notification {
    self.processLabel.text = [NSString stringWithFormat:@"还剩%@", notification.object];
}

- (IBAction)cleanCache:(id)sender {
    [[NSFileManager defaultManager] removeItemAtPath:ImageExportPath error:nil];
    [[NSFileManager defaultManager] removeItemAtPath:ImageExportZipPath error:nil];
    [[SDWebImageManager sharedManager].imageCache clearDisk];
}

- (void)dealloc {
    [_httpServer stop];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)startServer {
    // Start the server (and check for problems)
    NSError *error;
    if ([_httpServer start:&error]) {
        NSLog(@"Started HTTP Server on port %hu", [_httpServer listeningPort]);
        UInt16 port = [_httpServer listeningPort];
        NSString *ip = [self getIPAddress];
        self.createLabel.text = [NSString stringWithFormat:@"%@:%hu/create?id,id,id...", ip, port];
        self.zipLabel.text = [NSString stringWithFormat:@"%@:%hu/zip", ip, port];
        self.downloadLabel.text = [NSString stringWithFormat:@"%@:%hu/export.zip", ip, port];
        [ExportImageManager sharedInstance].zipUrl = self.zipLabel.text;
        [ExportImageManager sharedInstance].downloadUrl = self.downloadLabel.text;
    } else {
        NSLog(@"Error starting HTTP Server: %@", error);
    }
}

- (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if (temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    // Free memory
    freeifaddrs(interfaces);
    
    return address;
}

@end
