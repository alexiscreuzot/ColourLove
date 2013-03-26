//
//  AppDelegate.m
//  colors
//
//  Created by Alex on 28/11/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "AppDelegate.h"

#import "ColorsVC.h"

@implementation AppDelegate{
    UINavigationController * navigationController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ColorsVC * colorController = [[ColorsVC alloc] init];
    navigationController = [[UINavigationController alloc] initWithRootViewController:colorController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
