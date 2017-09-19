//
//  FFSettingMgr.m
//  FFShortcutRecord
//
//  Created by francis zhuo on 18/09/2017.
//

#import "FFSettingMgr.h"
#import "FFSettingWindowController.h"

@implementation FFSettingMgr
+ (instancetype)shareSettingMgr{
    static FFSettingMgr* shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[FFSettingMgr alloc] init];
    });
    return shareInstance;
}
- (id)init{
    self = [super init];
    if(self){
        _settingWindowController = [[FFSettingWindowController alloc] init];
    }
    return self;
}

- (void)openSettingWindow{
    [_settingWindowController showWindow:self];
}
@end
