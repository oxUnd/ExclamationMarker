//
//  AppDelegate.h
//  ExclamationMarker
//
//  Created by shouding on 9/17/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSWindowController * _preferencesController;
}

- (IBAction)openPreferences:(id)sender;
@end

