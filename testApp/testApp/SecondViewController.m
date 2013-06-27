//
//  SecondViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"XML", @"XML");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

#pragma mark - NSConnection Section

// NSURL method
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.responseData setLength:0];
}

// NSURL method
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

// NSURL method
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSString *msg = [NSString stringWithFormat:@"Failed: %@", [error description]];
    NSLog(@"%@",msg);
    
    // Used for offline testing of XML data placed in Documents of simulator
    NSString *filePath = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    filePath = [documentsDirectory stringByAppendingPathComponent:@"videos.xml"];
    if ([fileManager fileExistsAtPath:filePath]) {
        NSData *fileData = [NSData dataWithContentsOfFile:filePath];
        
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:fileData];
        if (parser) {
            [parser setDelegate:self];
            [parser parse];
        }
    }
    
    
}

// Method to check received data from NSURL call and deal with it
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:self.responseData];
    if (parser) {
        [parser setDelegate:self];
        [parser parse];
    }
}

#pragma mark - XML Parsing

// Begin parsing XML
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"videos"]) {
        //NSLog(@"Video Found");
        [self.xmlTxt appendString:@"<videos>\r"];
        return;
    }
    if ([elementName isEqualToString:@"video"]) {
        [self.xmlTxt appendString:@"    <video>\r"];
    }
    if ([elementName isEqualToString:@"title"]) {
        [self.xmlTxt appendString:@"        <title>"];
    }
    if ([elementName isEqualToString:@"url"]) {
        [self.xmlTxt appendString:@"        <url>"];
    }
    if ([elementName isEqualToString:@"upload_date"]) {
        [self.xmlTxt appendString:@"        <upload_date>"];
        
    }
    if ([elementName isEqualToString:@"thumbnail_small"]) {
        [self.xmlTxt appendString:@"        <thumbnail_small>"];
        
    }
    if ([elementName isEqualToString:@"thumbnail_medium"]) {
        [self.xmlTxt appendString:@"        <thumbnail_medium>"];
        
    }
    if ([elementName isEqualToString:@"thumbnail_large"]) {
        [self.xmlTxt appendString:@"        <thumbnail_large>"];
        
    }
    if ([elementName isEqualToString:@"user_name"]) {
        [self.xmlTxt appendString:@"        <user_name>"];
    }
    
}
// Parse values for each element
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (!self.currentStringValue) {
        // currentStringValue is an NSMutableString instance variable
        self.currentStringValue = [[NSMutableString alloc] initWithCapacity:50];
    }
    [self.currentStringValue appendString:string];
}
// Fires when element closing is found
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"title"]) {
        [self.xmlTxt appendFormat:@"%@<title/>\r",self.currentStringValue];
        return;
    }
    
    if ([elementName isEqualToString:@"url"]) {
        [self.xmlTxt appendFormat:@"%@<url/>\r",self.currentStringValue];
        self.currentStringValue = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"thumbnail_small"]) {
        [self.xmlTxt appendFormat:@"%@<thumbnail_small/>\r",self.currentStringValue];
        self.currentStringValue = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"thumbnail_medium"]) {
        [self.xmlTxt appendFormat:@"%@<thumbnail_medium/>\r",self.currentStringValue];
        self.currentStringValue = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"thumbnail_large"]) {
        [self.xmlTxt appendFormat:@"%@<thumbnail_large/>\r",self.currentStringValue];
        self.currentStringValue = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"user_name"]) {
        [self.xmlTxt appendFormat:@"%@<user_name/>\r",self.currentStringValue];
        return;
    }
    
    if ([elementName isEqualToString:@"upload_date"]) {
        [self.xmlTxt appendFormat:@"%@<upload_date/>\r",self.currentStringValue];
        self.currentStringValue = nil;
        return;
    }
    
    if ( [elementName isEqualToString:@"video"] ) {
        [self.xmlTxt appendString:@"    <video/>\r"];
        self.currentStringValue = nil;
        return;
    }
    if ([elementName isEqualToString:@"videos"]) {
        [self.xmlTxt appendString:@"<videos/>"];
        return;
    }
    self.currentStringValue = nil;
}
// Fires when parsing is complete
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    // Parsed Mutable array of relevant data to project put in UITextView - Left out xml data that I did not use
    self.textView.text = self.xmlTxt;
}


- (void)viewDidLoad
{
    self.textView.scrollEnabled = YES;
    self.xmlTxt = [[NSMutableString alloc]initWithCapacity:100];
    
    // Create the request
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:
                                [NSURL URLWithString:@"http://vimeo.com/api/v2/user12064611/videos.xml"]];
    // Send the request
    NSURLConnection *theConnection=[[NSURLConnection alloc]
                                    initWithRequest:theRequest delegate:self];
    if(theConnection){
        self.responseData = [[NSMutableData alloc] init];
    } else {
        NSLog(@"failed");
    }
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
