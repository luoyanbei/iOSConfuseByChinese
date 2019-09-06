//
//  main.m
//  TestDemo
//
//  Created by King on 2019/9/2.
//  Copyright © 2019年 King. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSLog(@"testDemo");
    
    int i = 2018;
    NSString * str = [NSString stringWithFormat:@"exchen %d",i];
    NSLog(@"%@",str);

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
