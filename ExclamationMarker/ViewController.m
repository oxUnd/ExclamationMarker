//
//  ViewController.m
//  ExclamationMarker
//
//  Created by shouding on 9/17/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import "ViewController.h"

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
    [panel setCanChooseFiles: NO];
    [panel setCanCreateDirectories: NO];
    [panel setCanChooseDirectories: NO];
    
    NSInteger ret = [panel runModal];
    
#ifdef DEBUG
    NSLog(@"OpenFile: runModal ret code = %ld", (long)ret);
#endif
    
    if (ret == NSFileHandlingPanelOKButton) {
#ifdef DEBUG
        NSLog(@"OpenFIle: open files = %@", [panel URLs]);
#endif
        return [[panel URLs] objectAtIndex:0];
    }
    
    return nil;
}

- (IBAction)uploadAction:(id)sender {
    NSURL * url = [self exOpenFile];
}
@end
