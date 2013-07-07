#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

}

- (void)awakeFromNib
{
    statusItemController = [[StatusItemController alloc] initWithFile:nil];
}

@end
