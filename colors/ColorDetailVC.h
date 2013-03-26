//
//  ColorDetailVC.h
//  colors
//
//  Created by Alex on 26/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Color.h"

@interface ColorDetailVC : UIViewController
@property (strong, nonatomic) Color * color;

- (id) initWithColor:(Color *) c;
@end
