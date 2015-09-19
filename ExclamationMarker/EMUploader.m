//
//  EMUploader.m
//  ExclamationMarker
//
//  Created by shouding on 9/18/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import "EMUploader.h"

static NSString * const BOUNDRY = @"0xKhTmLbOuNdArY";
static NSString * const FORM_FLE_INPUT = @"uploaded";

#define ASSERT(x) NSAssert(x, @"")

@interface EMUploader(Private)

- (NSMutableURLRequest *)postPush;

@end

@implementation EMUploader

+ (void)initialize
{
    if (self == [EMUploader class]) {
        NSLog(@"init EMUploader");
    }
}

- (void) uploadFile: (NSURL *) aServerUrl
           filepath: (NSString *) aFilepath
            onReady: (void (^) (NSData *, NSURLResponse *, NSError *)) onReady
{
    NSData *data = [NSData dataWithContentsOfFile: aFilepath];
    NSMutableURLRequest *req = [self postRequestWithUrl: aServerUrl
                                                boundry: BOUNDRY
                                               filename: [aFilepath lastPathComponent]
                                                   data: data];
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask *reqTask = [session dataTaskWithRequest: req
                                               completionHandler: onReady];
    [reqTask resume];
}


- (NSMutableURLRequest *) postRequestWithUrl: (NSURL *) url
                                     boundry: (NSString *) boundry
                                    filename: (NSString *) filename
                                        data: (NSData *) data
{
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL: url];
    [req setHTTPMethod: @"POST"];
    [req setValue:
     [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundry]
forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *postData =
    [NSMutableData dataWithCapacity:[data length] + 512];
    [postData appendData:
     [[NSString stringWithFormat:@"--%@\r\n", boundry] dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:
     [[NSString stringWithFormat:
       @"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n\r\n", FORM_FLE_INPUT, filename]
      dataUsingEncoding:NSUTF8StringEncoding]];
    [postData appendData:data];
    [postData appendData:
     [[NSString stringWithFormat:@"\r\n--%@--\r\n", boundry] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [req setHTTPBody:postData];
    
    return req;

}


@end
