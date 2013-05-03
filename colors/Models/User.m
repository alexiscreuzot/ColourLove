//
//  User.m
//  colors
//
//  Created by Alex on 28/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "User.h"

@implementation User

- (id) initWithDict:(NSDictionary *) dict{
    if(self = [super init]){
        self.userName = dict[@"userName"];
        self.location = dict[@"location"];
        self.rating = dict[@"rating"];
        self.numColors = dict[@"numColors"];
    }
    return self;
}

@end
