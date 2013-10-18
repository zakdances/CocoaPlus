//
//  UIViewPlus.m
//  Danceplanet
//
//  Created by Zak.
//  Copyright (c) 2013 Zak. All rights reserved.
//

#import "UIViewPlus.h"
#import "CAGradientLayerPlus.h"

@implementation UIViewPlus

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
//        RAC(self.bottom) = [RACSignal combineLatest:@[RACAbleWithStart(self.frame),RACAbleWithStart(self.bounds),RACAbleWithStart(self.center)]
//         reduce:^(NSValue *frame,NSValue *bounds,NSValue *center) {
//             NSLog(@"frame %@",frame);
//             return center.CGPointValue.y + CGRectGetMidY(bounds.CGRectValue);
//        }];
        self.layer.needsDisplayOnBoundsChange = YES;
        self.layer.opaque = NO;

        

       
    }
    return self;
}

// + (UIViewPlus *)viewWithFrame:(CGRect)frame
// {
//     UIViewPlus *view = [[UIViewPlus alloc] initWithFrame:frame];
//     return view;
// }

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

// TODO: Maybe this should be intrinsicContentSize?
- (CGSize)sizeThatFits:(CGSize)size
{

    
    
    NSMutableArray *bottoms = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        
        NSNumber *bottom = [NSNumber numberWithFloat:view.center.y + CGRectGetMidY(view.bounds)];
        [bottoms addObject:bottom];
    }
    
    [bottoms sortUsingComparator:^NSComparisonResult(NSNumber *a, NSNumber *b) {
           return [a compare:b];
    }];
    
    
    
    NSMutableArray *rights = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        
        NSNumber *right = [NSNumber numberWithFloat:view.center.x + CGRectGetMidX(view.bounds)];
   
        [rights addObject:right];
    }
    
    [rights sortUsingComparator:^NSComparisonResult(NSNumber *a, NSNumber *b) {
        return [a compare:b];
    }];
    



    CGFloat width = ((NSNumber *)[rights lastObject]).floatValue;
    CGFloat height = ((NSNumber *)[bottoms lastObject]).floatValue;
   
    return CGSizeMake(width,height);
}

+ (Class)layerClass
{
    return [CAGradientLayerPlus class];
}

@end
