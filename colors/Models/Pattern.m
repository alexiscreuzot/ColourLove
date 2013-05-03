//
//  Pattern.m
//  colors
//
//  Created by Alex on 29/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Pattern.h"

@implementation Pattern

- (id) initWithDict:(NSDictionary *) dict{
    if(self = [super init]){
        self.id = dict[@"id"];
        self.title = dict[@"title"];
        self.userName = dict[@"userName"];
        self.imageUrl = dict[@"imageUrl"];
    }
    return self;
}

@end
