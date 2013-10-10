//
//  FMSViewController.m
//  SuperBestCoffeeLocator
//
//  Created by Frank McAuley on 10/9/13.
//  Copyright (c) 2013 Frank McAuley. All rights reserved.
//

#import "FMSViewController.h"
#import "FMSGenerateCoffeeData.h"


@interface FMSViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapKit;

@end

@implementation FMSViewController

- (void)viewDidLoad
{
    // TODO: create a core data store for the map data
    
    [super viewDidLoad];
	
    FMSGenerateCoffeeData *gen = [FMSGenerateCoffeeData new];
    
    [self.mapKit addAnnotations:[gen coffeeShops]];
    
    //set the region
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 0.3;
    span.longitudeDelta = 0.3;
    region.span=span;
    region.center = [gen centerCoffeeShop];
    
    [self.mapKit setRegion:region animated:TRUE];
    [self.mapKit regionThatFits:region];
    
    // configure the map
    self.mapKit.showsBuildings = YES;
    self.mapKit.showsPointsOfInterest = YES;
    self.mapKit.showsUserLocation = YES;
    
    // camera
    // Zoom into the Washington Monument with a pitch of 60°
    MKMapCamera *aCamera = [MKMapCamera camera];
    [aCamera setCenterCoordinate:[gen centerCoffeeShop]];
    [aCamera setAltitude:400];
    [aCamera setPitch:60];
    [self.mapKit setCamera:aCamera];
    
    /**
     - (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated
     Add a button that will set this for display purpose?
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -
#pragma mark MKMapViewDelegate

@end
