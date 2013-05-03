//
//  Color.h
//  colors
//
//  Created by Alex on 25/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

@interface Color : ActiveRecord
@property (strong,nonatomic) NSString * title;
@property (strong,nonatomic) NSString * userName;
@property (strong,nonatomic) NSString * hexString;
@property (strong,nonatomic) UIColor * rgbColor;
@property (strong,nonatomic) UIColor * inversedColor;
@property (strong,nonatomic) UIColor * contrastColor;

- (id) initWithDict:(NSDictionary *) dict;

@end
