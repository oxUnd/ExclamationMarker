//
//  ViewController.m
//  ExclamationMarker
//
//  Created by shouding on 9/17/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import "ViewController.h"
#import "EMUploader.h"
#import "EMConfig.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSURL*) exOpenFile {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles: YES];
    [panel setCanCreateDirectories: NO];
    [panel setCanChooseDirectories: NO];
    
    NSInteger ret = [panel runModal];
    
#ifdef DEBUG
    NSLog(@"OpenFile: runModal ret code = %ld", (long)ret);
#endif
    
    if (ret == NSFileHandlingPanelOKButton) {
#ifdef DEBUG
        NSLog(@"OpenFile: open files = %@", [panel URLs]);
#endif
        return [[panel URLs] objectAtIndex:0];
    }
    
    return nil;
}

- (IBAction)uploadAction:(id)sender {
    NSURL * url = [self exOpenFile];
    
    if (url == nil) {
        return;
    }
    
    EMConfig *config = [[EMConfig alloc] init];
    
    NSURL * serverUrl = [NSURL URLWithString: [config getServerUrl]];
    
    EMUploader *uploader = [[EMUploader alloc] init];

    void (^onReady) (NSData *, NSURLResponse *, NSError *) = ^(NSData *onData, NSURLResponse *res, NSError *err) {
        
#ifdef DEBUG
        NSLog(@"onReady");
        NSLog(@"%@", [[NSString alloc] initWithData: onData encoding: NSUTF8StringEncoding]);
#endif
        
        NSMutableArray *json = [NSJSONSerialization JSONObjectWithData: onData options: NSJSONReadingMutableContainers error: nil];
        
#ifdef DEBUG
        NSLog(@"url http://127.0.0.1:8088%@", json);
#endif
        NSInteger code = [[json valueForKey: @"code"] integerValue];
        
        if (code == 0) {
            NSString *strUrl = [NSString stringWithFormat: @"%@%@", [config getUrlPrefix], [json valueForKey:@"url"]];
            [[self showUrl] setStringValue: strUrl];
        } else {
            [[self showUrl] setStringValue: @"server error"];
        }
    };

    [uploader uploadFile: serverUrl filepath: [url path] onReady: onReady];
    
}


@end
