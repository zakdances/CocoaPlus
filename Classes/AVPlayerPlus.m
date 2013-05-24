//
//  AVPlayerPlus.m
//  Danceplanet
//
//  Created by Zak.
//  Copyright (c) 2013 Zak. All rights reserved.
//

#import "AVPlayerPlus.h"

@implementation AVPlayerPlus

- (id)init
{
    self = [super init];
    if (self) {
        // Init here
        
        
//        AVAsset *avAsset = self.currentItem.asset;
//        NSArray *audioTracks = [asset tracksWithMediaType:AVMediaTypeAudio];
//        
//        NSMutableArray *allAudioParams = [NSMutableArray array];
//        for (AVAssetTrack *track in audioTracks) {
//            AVMutableAudioMixInputParameters *audioInputParams =
//            [AVMutableAudioMixInputParameters audioMixInputParameters];
//            [audioInputParams setVolume:volume atTime:kCMTimeZero];
//            [audioInputParams setTrackID:[track trackID]];
//            [allAudioParams addObject:audioInputParams];
//        }
//        
//        AVMutableAudioMix *audioMix = [AVMutableAudioMix audioMix];
//        [audioMix setInputParameters:allAudioParams];
//        
//        [playerItem setAudioMix:audioMix];
    }
    return self;
}

@end
