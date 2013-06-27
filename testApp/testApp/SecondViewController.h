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

// XML parsing variables
@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSMutableString *currentStringValue;

// String for holding parsed xml structure
@property (nonatomic, strong) NSMutableString *xmlTxt;

@end
