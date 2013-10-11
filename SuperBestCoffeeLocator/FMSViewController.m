//
//  FMSViewController.m
//  SuperBestCoffeeLocator
//
//  Created by Frank McAuley on 10/9/13.
//  Copyright (c) 2013 Frank McAuley. All rights reserved.
//

#import "FMSViewController.h"
#import "FMSGenerateCoffeeData.h"
#import "FMSCoffeeShop.h"


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
    self.mapKit.pitchEnabled = YES;
    
    // camera
    // Zoom into the Washington Monument with a pitch of 60°
    MKMapCamera *aCamera = [MKMapCamera camera];
    [aCamera setCenterCoordinate:[gen centerCoffeeShop]];
    [aCamera setAltitude:500];
    [aCamera setPitch:45];
    [self.mapKit setCamera:aCamera];
    
    // setup the map for the user location
    [self configureCalloutLocationForUser:self.mapKit];
    
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
#pragma mark private methods
- (void)configureCalloutLocationForUser:(MKMapView*)mapView
{
    if (mapView.userLocation.location){
        NSMutableDictionary *locations = [[NSMutableDictionary alloc]initWithCapacity:[mapView.annotations count]];
        
        [mapView.annotations enumerateObjectsUsingBlock:^(FMSCoffeeShop <MKAnnotation> *store, NSUInteger idx, BOOL *stop) {
            CLLocationCoordinate2D coord = [store coordinate];
            CLLocation *anotLocation = [[CLLocation alloc] initWithLatitude:coord.latitude longitude:coord.longitude];
            locations[[NSNumber numberWithFloat:[mapView.userLocation.location distanceFromLocation:anotLocation]]] = store;
        }];
        
        [mapView selectAnnotation:locations[[[[[[NSMutableArray alloc]initWithArray:[locations allKeys]] sortedArrayUsingDescriptors: [NSArray arrayWithObject: [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: NO]]] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != 0"]] lastObject]]
                         animated:YES];
    } else if ([mapView.annotations count] > 0) {
        //select a random annotation since the user did not allow the app to show them on the map.
        int random = arc4random() % [mapView.annotations count];
        
        [mapView selectAnnotation:[mapView.annotations objectAtIndex:random] animated:YES];
    }
}

#pragma -
#pragma mark MKMapViewDelegate

@end
