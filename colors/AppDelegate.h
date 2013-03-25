//
//  AppDelegate.h
//  colors
//
//  Created by Alex on 28/11/12.
//  Copyright (c) 2012 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ColorsVC;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ColorsVC *viewController;

@end
