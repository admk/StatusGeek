#import <Foundation/Foundation.h>
#import "StatusItemView.h"

@interface StatusItemController : NSObject
{
    NSStatusItem *statusItem;
    StatusItemView *statusView;

    NSTimer *timer;
    NSTask *task;
}

@property (strong) NSString *file;
@property (assign) float interval;
@property (assign) float length;

- (id)initWithFile:(NSString *)file;
- (id)initWithFile:(NSString *)file interval:(float)interval;
- (id)initWithFile:(NSString *)file interval:(float)interval length:(float)length;

@end
