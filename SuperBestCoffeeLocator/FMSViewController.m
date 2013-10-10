//
//  FMSViewController.m
//  SuperBestCoffeeLocator
//
//  Created by Frank McAuley on 10/9/13.
//  Copyright (c) 2013 Frank McAuley. All rights reserved.
//

#import "FMSViewController.h"
#import "FMSCoffeeShop.h"


@interface FMSViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapKit;

@end

@implementation FMSViewController

- (void)viewDidLoad
{
    // TODO: create a core data store for the map data
    
    [super viewDidLoad];
	FMSCoffeeShop <MKAnnotation> *coffeeShop = [[FMSCoffeeShop alloc]initWithName:@"Sample" rating:@"123 Main St" Lat:39.948838 andLng:-82.995103];
    
    [self.mapKit addAnnotation:coffeeShop];
    
    //set the region
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 0.3;
    span.longitudeDelta = 0.3;
    region.span=span;
    region.center = coffeeShop.coordinate;
    
    [self.mapKit setRegion:region animated:TRUE];
    [self.mapKit regionThatFits:region];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -
#pragma mark MKMapViewDelegate

@end
