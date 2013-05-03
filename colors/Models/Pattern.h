//
//  Pattern.h
//  colors
//
//  Created by Alex on 29/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "ActiveRecord.h"

@interface Pattern : ActiveRecord
@property (strong,nonatomic) NSString * title;
@property (strong,nonatomic) NSString * userName;
@property (strong,nonatomic) NSString * imageUrl;

- (id) initWithDict:(NSDictionary *) dict;

@end
