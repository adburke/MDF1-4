//
//  VideoManager.h
//  testApp
//
//  Created by Aaron Burke on 6/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoManager : NSObject

//@property (nonatomic, strong) NSDictionary *videoDict;
@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, strong) NSString *videoUserName;
@property (nonatomic, strong) NSString *videoImgSml;
@property (nonatomic, strong) NSString *videoImgMed;
@property (nonatomic, strong) NSString *videoImgLrg;
@property (nonatomic, strong) NSString *videoDate;

@end
