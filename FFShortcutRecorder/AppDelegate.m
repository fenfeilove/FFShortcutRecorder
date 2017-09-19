//
//  AppDelegate.m
//  FFShortcutRecord
//
//  Created by francis zhuo on 18/09/2017.
//

#import "AppDelegate.h"
#import "FFSettingMgr.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[FFSettingMgr shareSettingMgr] openSettingWindow];
    
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
@end
