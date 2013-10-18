//
//  UIViewControllerPlusRAC.h
//  Pods
//
//  Created by Zak.
//
//

#import <UIKit/UIKit.h>
@class RACSignal;

@interface UIViewControllerPlusRAC : UIViewController

@property (strong) RACSignal *interfaceOrientationSignal;
@property (strong) RACSignal *rotationDurationSignal;

@end
