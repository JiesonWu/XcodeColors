#import "AppDelegate.h"

// How to apply color formatting to your log statements:
// 
// To set the foreground color:
// Insert the ESCAPE_SEQ into your string, followed by "fg124,12,255;" where r=124, g=12, b=255.
// 
// To set the background color:
// Insert the ESCAPE_SEQ into your string, followed by "bg12,24,36;" where r=12, g=24, b=36.
// 
// To reset the foreground color (to default value):
// Insert the ESCAPE_SEQ into your string, followed by "fg;"
// 
// To reset the background color (to default value):
// Insert the ESCAPE_SEQ into your string, followed by "bg;"
// 
// To reset the foreground and background color (to default values) in one operation:
// Insert the ESCAPE_SEQ into your string, followed by ";"

#define XCODE_COLORS_ESCAPE_MAC @"\033["
#define XCODE_COLORS_ESCAPE_IOS @"\xC2\xA0["

#if TARGET_OS_IPHONE
  #define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_IOS
#else
  #define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_MAC
#endif

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSLog(@"If you don't see colors below, make sure you follow the installation instructions in the README.");
	
	NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;" @"Blue text" XCODE_COLORS_RESET);
	
	NSLog(XCODE_COLORS_ESCAPE @"bg220,0,0;" @"Red background" XCODE_COLORS_RESET);
	
	NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;"
		  XCODE_COLORS_ESCAPE @"bg220,0,0;"
		  @"Blue text on red background"
		  XCODE_COLORS_RESET);
	
	NSLog(XCODE_COLORS_ESCAPE @"fg209,57,168;" @"You can supply your own RGB values!" XCODE_COLORS_RESET);
}

@end
