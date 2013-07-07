#import "StatusItemView.h"

@implementation StatusItemView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    _textField = [[NSTextField alloc] initWithFrame:frame];
    [_textField setEditable:NO];
    [self addSubview:_textField];

    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    
}

- (NSString *)text
{
    return _text;
}
- (void)setText:(NSString *)text
{
    _text = text;
    [_textField setStringValue:text];
    [self setNeedsDisplay:YES];
}

@end
