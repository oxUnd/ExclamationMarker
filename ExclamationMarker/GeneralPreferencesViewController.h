//
//  GeneralPreferencesViewController.h
//  ExclamationMarker
//
//  Created by shouding on 9/19/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GeneralPreferencesViewController : NSViewController
@property (weak) IBOutlet NSTextField *serverUrl;
@property (weak) IBOutlet NSTextField *urlPrefix;

- (IBAction)updateConfig:(id)sender;
- (IBAction)resetConfig:(id)sender;
@end
