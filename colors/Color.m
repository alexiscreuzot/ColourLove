//
//  Color.m
//  colors
//
//  Created by Alex on 25/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Color.h"
#import "UIColor+Utilities.h"

@implementation Color

- (id) initWithDict:(NSDictionary *) dict{
    self.title = dict[@"title"];
    self.description = dict[@"description"];
    self.hexString = [NSString stringWithFormat:@"#%@", dict[@"hex"]];
    self.rgbColor = [UIColor colorWithHexString:dict[@"hex"]];
    return self;
}

- (UIColor *) inversedColor
{
    const CGFloat *componentColors = CGColorGetComponents(self.rgbColor.CGColor);
    
    UIColor *newColor = [[UIColor alloc] initWithRed:(1.0 - componentColors[0])
                                               green:(1.0 - componentColors[1])
                                                blue:(1.0 - componentColors[2])
                                               alpha:componentColors[3]];
    return newColor;
}

@end
