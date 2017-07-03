//
//  ViewController.m
//  UI25_HomeWork_Block
//
//  Created by dllo on 16/9/14.
//  Copyright © 2016年 Guolefeng. All rights reserved.
//

#import "ViewController.h"
#import "BlockMethod.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *URLStr = @"http://api2.pianke.me/pub/today";
    
    NSString *bodyStr = @"auth=&client=1&deviceid=5F17F991-0D41-4B6E-AAC0-4DC946A29CAD&limit=10&start=0&version=3.0.6";
    
// ----- GET ------
    
    [BlockMethod getWithURL:URLStr block:^(id result) {
        NSLog(@"GET resutl: %@", result);
    }];
    
// ----- POST ------
    
   [BlockMethod postWithURL:URLStr body:bodyStr block:^(id result) {
       NSLog(@"POST result: %@",result);
   }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
