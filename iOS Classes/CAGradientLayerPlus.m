//
//  CAGradientLayerPlus.m
//  Danceplanet
//
//  Created by Zak.
//  Copyright (c) 2013 Zak. All rights reserved.
//

#import "CAGradientLayerPlus.h"

@implementation CAGradientLayerPlus
//@dynamic foo;

static NSMutableArray *_animPropNames;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (id)initWithLayer:(id)layer
{
    self = [super initWithLayer:layer];
	if (self) {

		if ([layer isKindOfClass:self.class]) {

		  //	CAGradientLayerPlus *newLayer = (CAGradientLayerPlus *)layer;
          //  NSLog(@"presentation layer foo: %f",self.foo);
//            self.prop_float = newLayer.prop_float;
//			self.what = newLayer.what;
//			self.foo = newLayer.foo;
          //  _isPresentationLayer = TRUE;
		}

	}
	return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"foo"]) {
        return YES;
    }
    for (NSString *propertyName in [CAGradientLayerPlus animPropNames]) {
        if ([key isEqualToString:propertyName]) {
       
            return YES;
        }
    };
    
    return [super needsDisplayForKey:key];
    
}

//- (void)animateFloat1
//{
//   
//    
//    
//}


+ (NSMutableArray *)animPropNames {
    
    _animPropNames = _animPropNames ? : [NSMutableArray arrayWithObjects:@"float1",@"what",@"foo", nil];
    return _animPropNames;
}


//- (CGFloat)foo
//{
//    return _foo;
//}
//- (void)setFoo:(CGFloat)foo
//{
//    
//
//    _foo = foo;
//
//}
@end
