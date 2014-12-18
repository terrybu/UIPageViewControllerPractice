//
//  ViewController.m
//  PageViewDemo
//
//  Created by Aditya Narayan on 12/17/14.
//  Copyright (c) 2014 TerryBuOrganization. All rights reserved.
//

#import "ViewController.h"
#import "PageContentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create the data model
    self.pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features"];
    self.pageImages = @[@"page1.png", @"page2.png"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;

    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    self.title = self.pageTitles[0];

    //if you'd rather put your pagecontrol using Storyboard, do this below, and then place it and connect it using Storyboard
//    [self.view bringSubviewToFront:self.pageControl];
   
    UINavigationController *navController = self.navigationController;
    CGSize navBarSize = navController.navigationBar.bounds.size;
    CGPoint origin = CGPointMake( navBarSize.width/2, navBarSize.height/2 );
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(origin.x, origin.y,
                                                                       0, 30)];
    self.pageControl.backgroundColor = [UIColor clearColor];
    [self.pageControl setNumberOfPages:2];
    [navController.navigationBar addSubview:self.pageControl];
    navController.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Page View Controller Data Source


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;

    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;

    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    PageContentViewController *currentViewController = pageViewController.viewControllers[0];
    [self.pageControl setCurrentPage:currentViewController.pageIndex];
    self.title = self.pageTitles[currentViewController.pageIndex];

}

//creates a new view controller on demand
- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}



#pragma mark navigationBar delegate methods

//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    int index = [navigationController.viewControllers indexOfObject:viewController];
//    self.pageControl.currentPage = index;
//}


#pragma mark Page Control specific delegate methods 
//without these you don't get page control at the bottom

//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
//{
//    return [self.pageTitles count];
//}
//
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
//{
//    return 0;
//}






- (IBAction)startAgain:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

@end
