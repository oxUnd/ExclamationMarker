//
//  FileController.h
//  ExclamationMarker
//
//  Created by shouding on 9/17/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    EXSinaApp,
    EXQiNiu
} EXRemoteStorageType;

@interface FileController : NSFileManager

@property EXRemoteStorageType storageType;

- (BOOL) upload;

- (BOOL) exSinaAppUpload: (NSString *) receiver withURL:(NSURL *) url;
- (BOOL) exQiNiuUpload: (NSURL *) url;

@end
