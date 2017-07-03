//
//  BlockMethod.m
//  UI25_HomeWork_Block
//
//  Created by dllo on 16/9/14.
//  Copyright © 2016年 Guolefeng. All rights reserved.
//

#import "BlockMethod.h"

@implementation BlockMethod

+ (void)getWithURL:(NSString *)URL block:(void (^)(id))block {
    NSURL *url = [NSURL URLWithString:URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
           
            if (!error) {
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                // 传值
                block(result);
            }
            
        });
        
    }];
    
    [dataTask resume];
    
}


+ (void)postWithURL:(NSString *)URL body:(NSString *)body block:(void (^)(id result))block {
    
    NSURL *url = [NSURL URLWithString:URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
           
            if (!error) {
                id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                // 传值
                block(result);
            }
            
        });
        
    }];
    
    [dataTask resume];
    
}


@end
