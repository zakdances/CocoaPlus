//
//  UIViewPlus.h
//  Danceplanet
//
//  Created by Zak.
//  Copyright (c) 2013 Zak. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CAGradientLayerPlus;

@interface UIViewPlus : UIView {
    // BOOL _stackSubviews;
    // BOOL _needsSizeThatFits;
    // __strong RACBehaviorSubject *_contentBoundsSignal;
    // CGSize _intrinsicContentSize;
}

// @property CGSize intrinsicContentSize;
//@property BOOL divLikeBehaviorForSubviews;
@property (weak,nonatomic) CAGradientLayerPlus *layer;
//@property (strong) RACSignal *contentBoundsSignal;

// - (void)layoutStackedSubviews;
// - (void)layoutStackedSubviewsAndSizeToFit;

// + (UIViewPlus *)viewWithFrame:(CGRect)frame;

@end
