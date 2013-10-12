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
@property (strong, nonatomic) FMSGenerateCoffeeData *gen;

@end

@implementation FMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gen = [FMSGenerateCoffeeData new];
    [self.mapKit addAnnotations:[self.gen coffeeShops]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self makeRegionForMap:self.mapKit];
    [self setCameraForMap:self.mapKit];
    
    /**
     - (void)setCenterCoordinate:(CLLocationCoordinate2D)coordinate animated:(BOOL)animated
     Add a button that will set this for display purpose?
     */
}

- (void)makeRegionForMap:(MKMapView *)map
{
    //set the region
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 0.3;
    span.longitudeDelta = 0.3;
    region.span=span;
    region.center = [self.gen centerCoffeeShop];
    
    [map setRegion:region animated:TRUE];
    [map regionThatFits:region];
    
    // configure the map
    map.showsBuildings = YES;
    map.showsPointsOfInterest = YES;
    map.showsUserLocation = YES;
    map.pitchEnabled = YES;
}

- (void)setCameraForMap:(MKMapView *)map
{
    //get the center of the map
    CLLocationCoordinate2D mapCenter = map.centerCoordinate;
//    mapCenter = [map convertPoint:
//                 CGPointMake(1, (map.frame.size.height/2.0))
//                   toCoordinateFromView:map];
    // camera
    // Zoom into the Washington Monument with a pitch of 60°
    
     MKMapCamera *aCamera = [MKMapCamera camera];
     [aCamera setCenterCoordinate:mapCenter];
     [aCamera setAltitude:150];
     [aCamera setPitch:60];
     [map setCamera:aCamera];
     
     // setup the map for the user location
//     [self configureCalloutLocationForUser:self.mapKit];
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

#pragma mark -
#pragma mark MKMapDelegate Managing Annotation Views

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    if ([annotation isKindOfClass:[FMSCoffeeShop class]])
    {
        MKPinAnnotationView* pinView = (MKPinAnnotationView*)[mapView
                                                        dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                   reuseIdentifier:@"CustomPinAnnotationView"];
            
           /**
            UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            //Place holder code for new images.
            [infoButton setImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateNormal];
            [infoButton setImage:[UIImage imageNamed:@"images.jpeg"] forState:UIControlStateHighlighted];
            pinView.rightCalloutAccessoryView = infoButton;
            pinView.rightCalloutAccessoryView = infoButton;
            */
            
//            pinView.image = [UIImage imageNamed:@"images.jpeg"]; //This set the pin image to the image named
            [pinView.rightCalloutAccessoryView addSubview:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"images.jpeg"]]];
            //The left and right callouts can hold a UIView to display other data.
            
            pinView.enabled = YES;
            pinView.canShowCallout = YES;

        }
        else
            pinView.annotation = annotation;
        return pinView;
    }
    return nil;
}@end
