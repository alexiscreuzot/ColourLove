//
//  NSString+Utilities.m
//  colors
//
//  Created by Alex on 28/03/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "NSString+Utilities.h"

@implementation NSString (Utilities)
- (NSString *)urlencode{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                NULL,
                                                                                (__bridge CFStringRef) self,
                                                                                NULL,
                                                                                CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                kCFStringEncodingUTF8));
}
@end
