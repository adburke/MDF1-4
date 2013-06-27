//
//  FirstViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoManager.h" 

// Deletgate for passing info on a cell
@protocol CVInfoDelegate <NSObject>

@required
// Required method that will be passed the corresponding dictionary from the cell selected
- (void)viewSelectedInfo:(VideoManager*)videoObj;

@end

@interface FirstViewController : UIViewController <NSXMLParserDelegate, NSURLConnectionDataDelegate, NSURLConnectionDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSMutableArray *videosArray;
@property (nonatomic, strong) VideoManager *currentVideo;
@property (nonatomic, strong) NSMutableString *currentStringValue;


// Property id of the delegate
@property (nonatomic, weak) id <CVInfoDelegate> delegate;

@end
