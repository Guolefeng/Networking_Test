//
//  BlockMethod.h
//  UI25_HomeWork_Block
//
//  Created by dllo on 16/9/14.
//  Copyright © 2016年 Guolefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockMethod : NSObject

+ (void)getWithURL:(NSString *)URL block:(void (^) (id result))block;

+ (void)postWithURL:(NSString *)URL body:(NSString *)body block:(void (^) (id result))block;

@end
