//
//  AppDelegate.m
//  ExclamationMarker
//
//  Created by shouding on 9/17/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import "AppDelegate.h"
#import "MASPreferences/MASPreferencesWindowController.h"
#import "GeneralPreferencesViewController.h"
#import "EMConfig.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    EMConfig *config = [[EMConfig alloc] init];
    if ([config empty]) {
        NSLog(@"empty");
        [config resetFromDefault];
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)openPreferences:(id)sender {
    NSLog(@"preferences");
    if (_preferencesController == nil) {

        NSViewController *generalView = [[GeneralPreferencesViewController alloc] init];

        NSArray *controllers = [[NSArray alloc] initWithObjects:generalView, nil];

        NSString *title = NSLocalizedString(@"Preferences", @"Common title for Preferences window");
        _preferencesController = [[MASPreferencesWindowController alloc] initWithViewControllers:controllers title:title];
    }
    [_preferencesController showWindow: nil];
}
@end
