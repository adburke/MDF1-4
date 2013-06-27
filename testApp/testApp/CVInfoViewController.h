//
//  CVInfoViewController.h
//  testApp
//
//  Created by Aaron Burke on 6/27/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoManager.h"

@interface CVInfoViewController : UIViewController

// Outlets
@property (weak, nonatomic) IBOutlet UIImageView *videoImg;
@property (weak, nonatomic) IBOutlet UILabel *mnthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yrLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

// Properties
@property (nonatomic, strong) VideoManager *currentVideo;

@end
