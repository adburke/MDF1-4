//
//  VideoManager.m
//  testApp
//
//  Created by Aaron Burke on 6/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "VideoManager.h"

@implementation VideoManager

-(id)init
{
    self = [super init];
    if (self)
    {
//        self.videoDict = @{
//                           @"title":nil,
//                           @"url":nil,
//                           @"userName":nil,
//                           @"imgSml":nil,
//                           @"imgMed":nil,
//                           @"imgLrg":nil
//                           };
        self.videoTitle = nil;
        self.videoUrl = nil;
        self.videoUserName = nil;
        self.videoImgSml = nil;
        self.videoImgMed = nil;
        self.videoImgLrg = nil;
        self.videoDate = nil;
    }
    return self;
}

@end
