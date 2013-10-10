//
//  FMSCoffeeShop.h
//  SuperBestCoffeeLocator
//
//  Created by Frank McAuley on 10/9/13.
//  Copyright (c) 2013 Frank McAuley. All rights reserved.
//


@interface FMSCoffeeShop : NSObject <MKAnnotation>

@property(nonatomic, strong) NSString *cofeeShopName;
@property(nonatomic, strong) NSString *storeAddress;
@property(assign) double lat;
@property(assign) double lng;

- (instancetype)initWithName:(NSString*)storeName rating:(NSString*)address Lat:(double) lat andLng:(double)lng;

@end
