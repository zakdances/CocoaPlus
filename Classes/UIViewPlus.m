//
//  UIViewPlus.m
//  Danceplanet
//
//  Created by Zak.
//  Copyright (c) 2013 Zak. All rights reserved.
//

#import "UIViewPlus.h"
#import "EXTScope.h"

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

        
        _contentBoundsSignal = [RACBehaviorSubject behaviorSubjectWithDefaultValue:self];
        //@weakify(self);
        
        [[RACSignal combineLatest:@[RACAbleWithStart(self.frame),RACAbleWithStart(self.bounds),RACAbleWithStart(self.center)]]
          subscribeNext:^(RACTuple *tuple) {
              //@strongify(self);
              //RACTupleUnpack(NSValue *frame,NSValue *bounds,NSValue *center) = tuple;
             // NSValue *bounds = tuple.second;
             // NSValue *center = tuple.third;
             // self.bottom = center.CGPointValue.y + CGRectGetMidY(bounds.CGRectValue);
              
          }];
       
    }
    return self;
}

+ (UIViewPlus *)viewWithFrame:(CGRect)frame
{
    UIViewPlus *view = [[UIViewPlus alloc] initWithFrame:frame];
    return view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

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


- (void)addSubview:(UIView *)view
{
    [super addSubview:view];
    
//    [[RACSignal combineLatest:@[RACAbleWithStart(view,bounds),RACAbleWithStart(view,center)]]
//     subscribeNext:^(RACTuple *x) {
//         
//     }];
    @weakify(self);
    [[view.rcl_boundsSignal deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
        @strongify(self);
        [_contentBoundsSignal sendNext:self];
    }];
    
//    if (self.divLikeBehaviorForSubviews) {
//        
//
//    
//    @weakify(self);
//    [[RACSignal combineLatest:@[RACAbleWithStart(view,bounds),RACAbleWithStart(view,center)]]
//     subscribeNext:^(RACTuple *tuple) {
//        @strongify(self);
//       
//    }];
//        
//    }
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_stackSubviews == YES) {
    

        [self.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
            CGFloat newY;
            if (idx == 0) {
                
                newY = CGRectGetMidY(view.bounds);
            }
            else {
                UIView *previousView = self.subviews[idx-1];
                newY = (previousView.center.y + CGRectGetMidY(previousView.bounds)) + CGRectGetMidY(view.bounds);
            }
            
            //CGPoint newCenter = CGPointMake(view.center.x, newY + 20 );
            view.center = CGPointMake(view.center.x, newY + 20 );
            
            
        }];

        _stackSubviews = NO;
        
        if (_needsSizeThatFits) {
            _needsSizeThatFits = NO;
            [self sizeToFit];
        }
    };
}




- (void)layoutStackedSubviews
{
    _stackSubviews = YES;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)layoutStackedSubviewsAndSizeToFit
{
    _needsSizeThatFits = YES;
    [self layoutStackedSubviews];
}


//- (RACSignal *)contentBoundsSignal
//{
//    return [_contentBoundsSignal deliverOn:[RACScheduler mainThreadScheduler]];
//}
//- (void)setContentBoundsSignal:(RACSignal *)contentBoundsSignal
//{
//    
//}


- (CGSize)intrinsicContentSize
{
    return _intrinsicContentSize;
}
- (void)setIntrinsicContentSize:(CGSize)intrinsicContentSize
{
    _intrinsicContentSize = intrinsicContentSize;
}


+ (Class)layerClass
{
    return [CAGradientLayerPlus class];
}

@end
