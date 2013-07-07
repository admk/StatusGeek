#import <Cocoa/Cocoa.h>

@interface StatusItemView : NSView
{
    NSString *_text;
    NSTextField *_textField;
}

@property (assign, getter=isHighlight) BOOL *highlight;
@property (strong) NSString *text;

@end
