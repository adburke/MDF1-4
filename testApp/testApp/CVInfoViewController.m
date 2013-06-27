//
//  CVInfoViewController.m
//  testApp
//
//  Created by Aaron Burke on 6/27/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "CVInfoViewController.h"
#import "VideoManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CVInfoViewController ()

@end

@implementation CVInfoViewController

- (void)viewSelectedInfo:(VideoManager*)videoObj
{
    self.currentVideo = videoObj;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Date and month labels
    NSString *yrStr = [self.currentVideo.videoDate substringWithRange:NSMakeRange(0,4)];
    NSString *mnthStr = [self.currentVideo.videoDate substringWithRange:NSMakeRange(5,2)];
    NSString *dayStr = [self.currentVideo.videoDate substringWithRange:NSMakeRange(8,2)];
    
    NSDictionary *months = @{@"01":@"JAN",
                             @"02":@"FEB",
                             @"03":@"MAR",
                             @"04":@"APR",
                             @"05":@"MAY",
                             @"06":@"JUN",
                             @"07":@"JUL",
                             @"08":@"AUG",
                             @"09":@"SEP",
                             @"10":@"OCT",
                             @"11":@"NOV",
                             @"12":@"DEC"
                             };
    for (id key in months) {
        if ([mnthStr isEqualToString:key]) {
            self.mnthLabel.text = [months objectForKey:key];
        }
    }
    self.dayLabel.text = dayStr;
    self.yrLabel.text = yrStr;
    
    // Title Label
    self.titleLabel.text = self.currentVideo.videoTitle;
    
    // User Label
    self.userNameLabel.text = self.currentVideo.videoUserName;
    
    // Image label
    [self.videoImg setImageWithURL:[NSURL URLWithString:self.currentVideo.videoImgLrg]placeholderImage:[UIImage imageNamed:@"placeHolder.png"]];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
