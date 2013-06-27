//
//  SecondViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <NSXMLParserDelegate, NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSMutableString *currentStringValue;
@property (nonatomic, strong) NSMutableArray *videosArray;
@property (nonatomic, strong) NSMutableString *xmlTxt;

@end
