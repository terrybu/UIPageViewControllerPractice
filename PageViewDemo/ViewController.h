//
//  ViewController.h
//  PageViewDemo
//
//  Created by Aditya Narayan on 12/17/14.
//  Copyright (c) 2014 TerryBuOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)startAgain:(id)sender;


@end

