//
//  FirstViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "FirstViewController.h"
#import "VideoManager.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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

// Begin parsing XML
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"videos"]) {
        //NSLog(@"Video Found");
        self.videosArray = [[NSMutableArray alloc] init];
        return;
    }
    if ([elementName isEqualToString:@"video"]) {
        self.currentVideo = [[VideoManager alloc] init];
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
        //NSLog(@"Video Tile = %@", self.currentStringValue);
        self.currentVideo.videoTitle = self.currentStringValue;
        self.currentStringValue = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"url"]) {
        //NSLog(@"Video Tile = %@", self.currentStringValue);
        self.currentVideo.videoUrl = self.currentStringValue;
        self.currentStringValue = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"thumbnail_small"]) {
        //NSLog(@"Video Tile = %@", self.currentStringValue);
        self.currentVideo.videoImgSml = self.currentStringValue;
        self.currentStringValue = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"thumbnail_medium"]) {
        //NSLog(@"Video Tile = %@", self.currentStringValue);
        self.currentVideo.videoImgMed = self.currentStringValue;
        self.currentStringValue = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"thumbnail_large"]) {
        //NSLog(@"Video Tile = %@", self.currentStringValue);
        self.currentVideo.videoImgLrg = self.currentStringValue;
        self.currentStringValue = nil;
        return;
    }
    
    if ([elementName isEqualToString:@"user_name"]) {
        //NSLog(@"Video Tile = %@", self.currentStringValue);
        self.currentVideo.videoUserName = self.currentStringValue;
        self.currentStringValue = nil;
        return;
    }
    
    if ( [elementName isEqualToString:@"video"] ) {
        // addresses and currentPerson are instance variables
        [self.videosArray addObject:self.currentVideo];
        NSLog(@" Array = %@", self.videosArray);
        return;
    }
    
}
// Fires when parsing is complete
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [self.videoListTable reloadData];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    
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
