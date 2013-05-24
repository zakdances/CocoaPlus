//
//  UIViewControllerPlus.m
//  Pods
//
//  Created by Zak.
//
//

#import "UIViewControllerPlus.h"

@interface UIViewControllerPlus ()

@end

@implementation UIViewControllerPlus

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        RACReplaySubject *interfaceOrientationSignal = [RACReplaySubject replaySubjectWithCapacity:10];
        self.interfaceOrientationSignal = interfaceOrientationSignal;
        
        RACSubject *rotationDurationSignal = [RACSubject subject];
        self.rotationDurationSignal = rotationDurationSignal;
        
        //[interfaceOrientationSignal sendNext:[NSNumber numberWithInteger:self.interfaceOrientation]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [(RACReplaySubject *)self.interfaceOrientationSignal sendNext:@(self.interfaceOrientation)];
}

#pragma mark Rotation

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
    [(RACSubject *)self.rotationDurationSignal sendNext:@(duration)];
    [(RACReplaySubject *)self.interfaceOrientationSignal sendNext:@(interfaceOrientation)];
}

@end
