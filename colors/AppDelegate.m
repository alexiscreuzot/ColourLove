//
//  AppDelegate.m
//  colors
//
//  Created by Alex on 28/11/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import "AppDelegate.h"

#import "ColorsVC.h"
#import "PalettesVC.h"
#import "PatternsVC.h"

@implementation AppDelegate{
    UITabBarController * tabController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Init both Navigation controllers with respective rootControllers
    ColorsVC * colorController = [[ColorsVC alloc] init];
    colorController.title = @"Colors";
    colorController.tabBarItem.image = [UIImage imageNamed:@"color"];
    UINavigationController * colorNavigationController = [[UINavigationController alloc] initWithRootViewController:colorController];
    
    PalettesVC * paletteController = [[PalettesVC alloc] init];
    paletteController.title = @"Palettes";
    paletteController.tabBarItem.image = [UIImage imageNamed:@"palette"];

    PatternsVC * patternController = [[PatternsVC alloc] init];
    patternController.title = @"Patterns";
    patternController.tabBarItem.image = [UIImage imageNamed:@"pattern"];
    
    // Init UITabBarController
    tabController = [[UITabBarController alloc] init];
    tabController.viewControllers = @[colorNavigationController,paletteController,patternController];
    
    // Set rootViewController and display
    self.window.rootViewController = tabController;
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
