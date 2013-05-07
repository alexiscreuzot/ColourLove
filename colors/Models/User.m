//
//  User.m
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
