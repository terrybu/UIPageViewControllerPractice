//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by Aditya Narayan on 12/17/14.
//  Copyright (c) 2014 TerryBuOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;



@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;




@end
