//
//  FFSettingWindowController.m
//  FFShortcutRecord
//
//  Created by francis zhuo on 18/09/2017.
//

#import "FFSettingWindowController.h"

@interface FFSettingWindowController ()<NSTableViewDelegate,NSTableViewDataSource>

@end

@implementation FFSettingWindowController
- (id)init{
    self = [super init];
    if(self){
        //create window
        self.window = [[[NSWindow alloc] initWithContentRect:NSZeroRect
                                                   styleMask:NSTitledWindowMask|NSClosableWindowMask|NSResizableWindowMask
                                                     backing:NSBackingStoreBuffered
                                                       defer:NO
                                                      screen:[NSScreen mainScreen]] autorelease];
        [self initSubView];
        [self.window center];

    }
    return self;
}
- (void)initSubView{
    NSScrollView* scrollView = [[[NSScrollView alloc] init] autorelease];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.hasVerticalScroller = YES;
    scrollView.hasHorizontalScroller = NO;
    [self.window.contentView addSubview:scrollView];
    NSArray* layoutContains = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[theView(>=460)]|" options:0 metrics:nil views:@{@"theView":scrollView}];
    [self.window.contentView addConstraints:layoutContains];
    layoutContains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[theView(>=500)]-50-|" options:0 metrics:nil views:@{@"theView":scrollView}];
    [self.window.contentView addConstraints:layoutContains];
    
    _tableView = [[NSTableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = NSViewMinXMargin|NSViewMaxXMargin|NSViewMinYMargin|NSViewMaxYMargin|NSViewWidthSizable|NSViewHeightSizable;
    [scrollView setDocumentView:_tableView];
    
    NSTableColumn* column = [[[NSTableColumn alloc] initWithIdentifier:@"title identifier"] autorelease];
    [_tableView addTableColumn:column];
    [column setMinWidth:150];
    [column setResizingMask:NSTableColumnAutoresizingMask];
    
    column = [[[NSTableColumn alloc] initWithIdentifier:@"recorder identifier"] autorelease];
    [_tableView addTableColumn:column];
    [column setMaxWidth:180];
    [column setMinWidth:150];
    [column setWidth:150];
    [column setResizingMask:NSTableColumnNoResizing];
    [_tableView sizeLastColumnToFit];
    [_tableView sizeToFit];
    
    NSButton* button = [[[NSButton alloc] init] autorelease];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.title = @"apply";
    button.target = self;
    button.action = @selector(onButtonClick:);
    [self.window.contentView addSubview:button];
    layoutContains = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[theView(==50@1)]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"theView":button}];
    [self.window.contentView addConstraints:layoutContains];
    layoutContains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[theView(20)]-10-|" options:0 metrics:nil views:@{@"theView":button}];
    [self.window.contentView addConstraints:layoutContains];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return 50;
}
- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    return @"wo shi da shuai ge";
}

- (void)onButtonClick:(id)sender{
    NSLog(@"%s",__func__);
    [_tableView reloadData];
}
@end
