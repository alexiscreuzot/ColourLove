//
//  KAViewController.m
//  KANibHelper
//
//  Created by Alex on 01/04/13.
//

#import "KAViewController.h"


@implementation KAViewController

- (id) init
{
    NSString *nibName = NSStringFromClass([self class]);
    return [self initWithNibName:nibName bundle:nil];
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil
{
    // Check if nibName exist
    if(!nibName){
        return [self init];
    }
    
    // Get screen bounds
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    // Names
    NSString *nibName4inches =  [nibName stringByAppendingString:@"~iphone4"];
    NSString *nibName4inchesLand =  [nibName4inches stringByAppendingString:@"_land"];
    NSString *nibName3_5inches =  [nibName stringByAppendingString:@"~iphone3_5"];
    NSString *nibName3_5inchesLand =  [nibName3_5inches stringByAppendingString:@"_land"];
    NSString *nibName3_5inchesLandBis =  [nibName stringByAppendingString:@"_land"];
    
    // paths
    NSString *path4inches = [[NSBundle mainBundle] pathForResource:nibName4inches ofType:@"nib"];
    NSString *path4inchesLand = [[NSBundle mainBundle] pathForResource:nibName4inchesLand ofType:@"nib"];
    NSString *path3_5inches = [[NSBundle mainBundle] pathForResource:nibName3_5inches ofType:@"nib"];
    NSString *path3_5inchesLand = [[NSBundle mainBundle] pathForResource:nibName3_5inchesLand ofType:@"nib"];
    NSString *path3_5inchesLandBis = [[NSBundle mainBundle] pathForResource:nibName3_5inchesLandBis ofType:@"nib"];
    
    // Detect orientation change
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];

    
    if(self.isLandscape){
        if(screenBounds.size.height == 568 && path4inchesLand){
            return  [super initWithNibName:nibName4inchesLand bundle:nibBundleOrNil];
        }else if(screenBounds.size.height == 480){
            if(path3_5inchesLand){
                return [super initWithNibName:nibName3_5inchesLand bundle:nibBundleOrNil];
            }else if(path3_5inchesLandBis){
                return [super initWithNibName:nibName3_5inchesLandBis bundle:nibBundleOrNil];
            }
        }
    }
    
    // Fallback if no landscape
    if(screenBounds.size.height == 568 && path4inches){
        return [super initWithNibName:nibName4inches bundle:nibBundleOrNil];
    }else if(screenBounds.size.height == 480 && path3_5inches){
        return [super initWithNibName:nibName3_5inches bundle:nibBundleOrNil];
    }else{
        return [super initWithNibName:nibName bundle:nibBundleOrNil];
    }    
}

- (void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationIsLandscape(deviceOrientation) && !self.isLandscape){
        KAViewController * controller = [[self class] alloc];
        controller.isLandscape = YES;
        controller = [controller init];
        [self presentViewController:controller animated:NO completion:nil];
    }else if (UIDeviceOrientationIsPortrait(deviceOrientation) && self.isLandscape){
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

@end
