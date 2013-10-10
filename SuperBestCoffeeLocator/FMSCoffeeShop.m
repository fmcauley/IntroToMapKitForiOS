//
//  FMSCoffeeShop.m
//  SuperBestCoffeeLocator
//
//  Created by Frank McAuley on 10/9/13.
//  Copyright (c) 2013 Frank McAuley. All rights reserved.
//

#import "FMSCoffeeShop.h"

@interface FMSCoffeeShop ()

@end

@implementation FMSCoffeeShop

-(instancetype)initWithName:(NSString *)storeName rating:(NSString *)address Lat:(double)lat andLng:(double)lng
{
    self = [super init];
    
    if (self) {
        _cofeeShopName = storeName;
        _storeAddress = address;
        _lat = lat;
        _lng = lng;
    }
    
    return self;
}

#pragma mark - 
#pragma mark MKAnnotation Methods

- (NSString *)title
{
    return self.cofeeShopName;
}

- (NSString *)subtitle
{
    return self.storeAddress;
}

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coord;
    coord.latitude = self.lat;
    coord.longitude = self.lng;
    return coord;
}

@end
