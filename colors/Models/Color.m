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

ignore_fields_do(
                 ignore_field(rgbColor)
                 ignore_field(inversedColor)
                 ignore_field(contrastColor)
                 )

- (id) initWithDict:(NSDictionary *) dict{
    if(self = [super init]){
        self.id = dict[@"id"];
        self.title = dict[@"title"];
        self.userName = dict[@"userName"];
        self.hexString = dict[@"hex"];
    }
    return self;
}

- (UIColor *)rgbColor
{
    return [UIColor colorWithHexString:self.hexString];
}

- (UIColor *)inversedColor
{
    return [UIColor inversedColor:self.rgbColor];
}

- (UIColor *)contrastColor
{
    return [UIColor contrastColorFor:self.rgbColor];
}

@end
