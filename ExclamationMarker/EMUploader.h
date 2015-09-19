//
//  EMUploader.h
//  ExclamationMarker
//
//  Created by shouding on 9/18/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMUploader : NSObject

- (void) uploadFile: (NSURL*) aServerUrl
           filepath: (NSString *) aFilepath
            onReady: (void (^) (NSData *, NSURLResponse *, NSError *)) onReady;


@end
