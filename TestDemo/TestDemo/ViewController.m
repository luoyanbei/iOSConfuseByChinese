//
//  ViewController.m
//  TestDemo
//
//  Created by King on 2019/9/2.
//  Copyright © 2019年 King. All rights reserved.
//

#import "ViewController.h"
#import "codeObfuscation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self myName];
    
    [self myDream];

}

-(void)myName {
    NSLog(@"My name is Jack Ma.");
}

-(void)myDream {
    NSLog(@"My dream is becoming a teacher.");
}

@end
