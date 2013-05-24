//
//  CocoaPlusMacros.h
//  Pods
//
//  Created by Zak.
//
//

#define RGBA(r, g, b, a) \
[UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define degreesToRadians(x) ((x) * M_PI / 180.0)

#import <Foundation/Foundation.h>

@interface CocoaPlusMacros : NSObject

@end
