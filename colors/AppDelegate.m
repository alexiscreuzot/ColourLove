//
//  AppDelegate.m
//  colors
//
// Copyright 2013 Alexis Creuzot
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "AppDelegate.h"

#import "ColorsVC.h"
#import "ColorDetailVC.h"
#import "UserDetailVC.h"
#import "PalettesVC.h"
#import "PatternsVC.h"

@implementation AppDelegate{
    UITabBarController * tabController;
    AFHTTPClient * client;
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
    
    // Set routes
    [[Routable sharedRouter] map:@"color/:id" toController:[ColorDetailVC class]];
    [[Routable sharedRouter] map:@"user/:id" toController:[UserDetailVC class]];
    [[Routable sharedRouter] setNavigationController:colorNavigationController];
    
    // Set rootViewController and display
    self.window.rootViewController = tabController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


@end
