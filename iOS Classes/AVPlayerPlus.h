//
//  AVPlayerPlus.h
//  Danceplanet
//
//  Created by Zak.
//  Copyright (c) 2013 Zak. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface AVPlayerPlus : AVPlayer {
    BOOL _volumeSetManually;
}

@property CGFloat volume;

@end
