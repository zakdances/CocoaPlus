//
//  UIViewControllerPlus.h
//  Pods
//
//  Created by Zak.
//
//

#import <UIKit/UIKit.h>

@interface UIViewControllerPlus : UIViewController

@property (strong) RACSignal *interfaceOrientationSignal;
@property (strong) RACSignal *rotationDurationSignal;

@end
