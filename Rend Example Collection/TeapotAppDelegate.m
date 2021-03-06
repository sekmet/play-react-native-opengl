//
//  AppDelegate.m
//  Rend Example Collection
//
//  Created by Anton Holmquist on 6/26/12.
//  Copyright (c) 2012 Monterosa. All rights reserved.
//

#import "TeapotAppDelegate.h"
#import "GLViewController.h"
#import "TeapotController.h"
#import "RCTRootView.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSURL *jsCodeLocation;
    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/main.includeRequire.runModule.bundle"];
    
    EAGLContext *context = [[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2] autorelease];
    [EAGLContext setCurrentContext:context];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [rootView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    rootView.scriptURL = jsCodeLocation;
    rootView.moduleName = @"App";
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1 green:1 blue:1 alpha:0];

    RCTBridge *bridge = [rootView getBridge];
    TeapotController *vc = [bridge getModule:@"TeapotController"];

    [vc.view addSubview:rootView];
    [vc.view bringSubviewToFront:rootView];
    
    self.window.rootViewController = vc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
