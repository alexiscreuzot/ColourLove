//
//  Palette.h
//  colors
//
//  Created by Alex on 28/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Palette : ActiveRecord
@property (strong,nonatomic) NSString * title;
@property (strong,nonatomic) NSString * userName;
@property (strong,nonatomic) NSString * imageUrl;
@property (nonatomic) BOOL selected;

- (id) initWithDict:(NSDictionary *) dict;
    
@end
