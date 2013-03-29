//
//  LayoutManager.m
//  colors
//
//  Created by Alex on 29/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "LayoutManager.h"

@implementation LayoutManager

+ (id)loadController:(Class)classType {
    NSString *nibName = NSStringFromClass(classType);
    NSString *nibName4inches =  [nibName stringByAppendingString:@"_4in"];
    NSString *path4inches = [[NSBundle mainBundle] pathForResource:nibName4inches ofType:@"nib"];
    
    UIViewController *controller;
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if(screenBounds.size.height == 568 && path4inches){
        controller = [[classType alloc] initWithNibName:nibName4inches bundle:nil];
    }else{
        controller = [[classType alloc] initWithNibName:nibName bundle:nil];
    }
    return controller;
}

@end
