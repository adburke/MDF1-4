//
//  FirstViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoManager.h"

@interface FirstViewController : UIViewController <NSXMLParserDelegate, NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSMutableArray *videosArray;
@property (nonatomic, strong) VideoManager *currentVideo;
@property (nonatomic, strong) NSMutableString *currentStringValue;

@end
