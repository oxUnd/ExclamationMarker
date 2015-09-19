//
//  EMConfig.m
//  ExclamationMarker
//
//  Created by shouding on 9/19/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import "EMConfig.h"

@implementation EMConfig


- (id) init {
    if (userDefaults == nil) {
        userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (BOOL) empty {
    if ([self getServerUrl] == nil) {
        return YES;
    }
    return NO;
}

- (void) resetFromDefault {
    [self setValue: @"http://127.0.0.1:8088/index/upload"  forKey:EMServerURl];
    [self setValue: @"http://127.0.0.1:8088" forKey: EMUrlPrefix];
}

- (void) setValue:(NSString *)value forKey:(NSString *)key {
    [userDefaults setObject:value forKey:key];
}

- (NSString *) getUrlPrefix {
    return [userDefaults stringForKey: EMUrlPrefix];
}

- (NSString *) getServerUrl {
    return [userDefaults stringForKey: EMServerURl];
}

@end