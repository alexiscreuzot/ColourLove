//
//  User.h
//  colors
//
//  Created by Alex on 28/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "ActiveRecord.h"

@interface User : ActiveRecord

@property (strong,nonatomic) NSString * userName;
@property (strong,nonatomic) NSString * location;
@property (strong,nonatomic) NSNumber * rating;
@property (strong,nonatomic) NSNumber * numColors;

- (id) initWithDict:(NSDictionary *) dict;
    
@end
