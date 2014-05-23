//
//  MTZAppDelegate.m
//  What's New
//
//  Created by Matt Zanchelli on 5/16/14.
//  Copyright (c) 2014 Matt Zanchelli. All rights reserved.
//

#import "MTZAppDelegate.h"

#import "MTZViewController.h"

#import "MTZWhatsNew.h"
#import "MTZWhatsNewViewController.h"

#ifdef DEBUG
@interface MTZWhatsNew ()
+ (void)setLastAppVersion:(NSString *)version;
@end
#endif

@implementation MTZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	self.window.rootViewController = [[MTZViewController alloc] init];
	
#ifdef DEBUG
	[MTZWhatsNew setLastAppVersion:@"2.0"];
#endif
	
	[MTZWhatsNew handleWhatsNewWithBlock:^(NSDictionary *whatsNew) {
		MTZWhatsNewViewController *vc = [[MTZWhatsNewViewController alloc] init];
		vc.features = whatsNew;
		vc.topColor = [UIColor colorWithHue:0.77 saturation:0.77 brightness:0.76 alpha:1];
		vc.bottomColor = [UIColor colorWithHue:0.78 saturation:0.6 brightness:0.95 alpha:1];

		[self.window.rootViewController presentViewController:vc animated:NO completion:nil];
	}];
	
    return YES;
}

@end