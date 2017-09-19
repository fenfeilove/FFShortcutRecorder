//
//  FFSettingMgr.h
//  FFShortcutRecord
//
//  Created by francis zhuo on 18/09/2017.
//

#import <Foundation/Foundation.h>
@class FFSettingWindowController;
@interface FFSettingMgr : NSObject
{
    FFSettingWindowController* _settingWindowController;
}
+ (instancetype)shareSettingMgr;
- (void)openSettingWindow;
@end
