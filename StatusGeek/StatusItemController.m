#import "StatusItemController.h"

#define DEFAULT_INTERVAL 2.0
#define DEFAULT_LENGTH 30.0

@implementation StatusItemController

- (id)initWithFile:(NSString *)file
{
    return [self initWithFile:file interval:DEFAULT_INTERVAL];
}
- (id)initWithFile:(NSString *)file interval:(float)interval
{
    return [self initWithFile:file interval:interval length:DEFAULT_LENGTH];
}
- (id)initWithFile:(NSString *)file interval:(float)interval length:(float)length
{
    self = [super init];
    if (!self) return nil;

    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:30];
    statusView = [[StatusItemView alloc] initWithFrame:NSMakeRect(0, 0, 30, 25)];
    [statusItem setView:statusView];
    [statusItem setHighlightMode:YES];

    self.file = file;
    self.interval = interval;
    self.length = length;

    return self;
}

- (void)_performTask
{
    if (!task)
        task = [[NSTask alloc] init];
    NSString *home = [NSHomeDirectory() stringByAppendingString:@"/"];
    [task setCurrentDirectoryPath:home];
    [task setLaunchPath:[home stringByAppendingString:self.file]];
    [task setArguments:@[]];
    NSPipe *outpipe = [NSPipe pipe];
    [task setStandardOutput:outpipe];
    [task launch];
    [task waitUntilExit];
    NSString *stdOutString = [[NSString alloc] initWithData:[[outpipe fileHandleForReading] readDataToEndOfFile]
                                                   encoding:NSUTF8StringEncoding];
    statusView.text = stdOutString;
}

- (float)interval
{
    return _interval;
}
- (void)setInterval:(float)interval
{
    _interval = interval;
    [timer invalidate];
    timer = [NSTimer timerWithTimeInterval:interval
                                    target:self
                                  selector:@selector(_performTask)
                                  userInfo:nil
                                   repeats:YES];
    [timer fire];
}

@synthesize interval=_interval;
@end
