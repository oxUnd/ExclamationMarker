//
//  EMConfig.h
//  ExclamationMarker
//
//  Created by shouding on 9/19/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const EMServerURl = @"serverUrl";
static NSString *const EMUrlPrefix = @"urlPrefix";

@interface EMConfig : NSObject
{
    NSString *serverUrl;
    NSString *urlPrefix;
    NSUserDefaults * userDefaults;
}

- (void) setValue:(NSString*) value forKey:(NSString *)key;
- (NSString *) getServerUrl;
- (NSString *) getUrlPrefix;
- (BOOL) empty;
- (void) resetFromDefault;

@end
