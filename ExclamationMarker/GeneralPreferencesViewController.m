//
//  GeneralPreferencesViewController.m
//  ExclamationMarker
//
//  Created by shouding on 9/19/15.
//  Copyright © 2015 shouding. All rights reserved.
//

#import "GeneralPreferencesViewController.h"
#import "EMConfig.h"

@implementation GeneralPreferencesViewController

- (id) init {
    return [super initWithNibName: @"GeneralPreferencesView" bundle: nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EMConfig * config = [[EMConfig alloc] init];
    [_serverUrl setStringValue:[config getServerUrl]];
    [_urlPrefix setStringValue:[config getUrlPrefix]];
    
    // Do any additional setup after loading the view.
}

- (NSString *)identifier
{
    return @"GeneralPreferences";
}

- (NSImage *)toolbarItemImage
{
    return [NSImage imageNamed:NSImageNamePreferencesGeneral];
}

- (NSString *)toolbarItemLabel
{
    return NSLocalizedString(@"General", @"Toolbar item name for the General preference pane");
}

- (IBAction)updateConfig:(id)sender {
    NSString *sUrl = [_serverUrl stringValue];
    NSString *prefix = [_urlPrefix stringValue];
    
    EMConfig * config = [[EMConfig alloc] init];
    [config setValue: sUrl  forKey: EMServerURl];
    [config setValue: prefix forKey: EMUrlPrefix];
}

- (IBAction)resetConfig:(id)sender {
    EMConfig * config = [[EMConfig alloc] init];
    [config resetFromDefault];
}

@end
