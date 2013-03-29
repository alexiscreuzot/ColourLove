//
//  Palette.m
//  colors
//
//  Created by Alex on 28/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Palette.h"

@implementation Palette

ignore_fields_do(
                 ignore_field(selected)
                 )

@synthesize selected;

- (id) initWithDict:(NSDictionary *) dict{
    if(self = [super init]){
        self.id = dict[@"id"];
        self.title = dict[@"title"];
        self.userName = dict[@"userName"];
        self.imageUrl = dict[@"imageUrl"];
        self.selected = NO;
    }
    return self;
}
@end
