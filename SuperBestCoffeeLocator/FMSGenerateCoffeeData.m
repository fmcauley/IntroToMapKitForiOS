//
//  FMSGenerateCoffeeData.m
//  SuperBestCoffeeLocator
//
//  Created by Frank McAuley on 10/10/13.
//  Copyright (c) 2013 Frank McAuley. All rights reserved.
//

#import "FMSGenerateCoffeeData.h"
#import "FMSCoffeeShop.h"

@implementation FMSGenerateCoffeeData

#pragma -
#pragma mark Public Interface methods
- (NSArray *)coffeeShops
{
    return [self generateTheCoffeeShopData];
}

- (CLLocationCoordinate2D)centerCoffeeShop
{
    FMSCoffeeShop *coffeeShop = [[self generateTheCoffeeShopData] lastObject];
    return coffeeShop.coordinate;
}

#pragma -
#pragma mark Helper
- (NSArray*)generateTheCoffeeShopData
{
    FMSCoffeeShop *coffee0 = [[FMSCoffeeShop alloc]initWithName:@"Cup o Joe" rating:@"627 S 3rd St  Columbus, OH 43206" Lat:39.948838 andLng:-82.995103];
    
    FMSCoffeeShop *coffee1 = [[FMSCoffeeShop alloc]initWithName:@"Travonna Coffee House" rating:@"1195 N. High Street - Columbus, OH 43201" Lat:39.986726 andLng: -83.005583];
    
    FMSCoffeeShop *coffee2 = [[FMSCoffeeShop alloc]initWithName:@"Zanzibar Brews" rating:@"740 E Long St  Columbus, OH 43203" Lat:39.967235 andLng: -82.981463];
    
    FMSCoffeeShop *coffee3 = [[FMSCoffeeShop alloc]initWithName:@"Cafe Brioso" rating:@"14 East Gay St Columbus, OH 43215" Lat: 39.963792 andLng: -83.000365];
    
    FMSCoffeeShop *coffee4 = [[FMSCoffeeShop alloc]initWithName:@"Luck Bros'" rating:@"1101 W. 1st Ave Grandview Heights, OH 43212" Lat: 39.979684 andLng: -83.033973];
    
    FMSCoffeeShop *coffee5 = [[FMSCoffeeShop alloc]initWithName:@"German Village Coffee Shop" rating:@"193 Thurman Ave Columbus, OH 43206" Lat: 39.939527 andLng: -82.990931];
    
    FMSCoffeeShop *coffee6 = [[FMSCoffeeShop alloc]initWithName:@"Colin's Coffee" rating:@"714 Riverside Dr Columbus, OH 43221" Lat: 40.025920 andLng: -83.091242];
    
     FMSCoffeeShop *coffee7 = [[FMSCoffeeShop alloc]initWithName:@"Third Street Corporation" rating:@"705 Hadley Dr Columbus, OH 43228" Lat: 39.967869 andLng: -83.098671];
    
    FMSCoffeeShop *coffee8 = [[FMSCoffeeShop alloc]initWithName:@"Stauf's Coffee Roasters" rating:@"1277 Grandview Ave Columbus, OH 43212" Lat: 39.983756 andLng: -83.045000];
    
    FMSCoffeeShop *coffee9 = [[FMSCoffeeShop alloc]initWithName:@"Impero Coffee" rating:@"849 N High St Columbus, OH 43215" Lat: 39.979740 andLng:  -83.004198];
    
    FMSCoffeeShop *coffee10 = [[FMSCoffeeShop alloc]initWithName:@"Kafe Kerouac" rating:@"2250 N High St Columbus, OH 43201" Lat: 40.008171 andLng: -83.009537];
    
    FMSCoffeeShop *coffee11 = [[FMSCoffeeShop alloc]initWithName:@"Global Gallery Coffeee Shop" rating:@"3535 N Hight St Columbus, OH 43214" Lat: 40.034196 andLng: -83.016933];
    
    FMSCoffeeShop *coffee12 = [[FMSCoffeeShop alloc]initWithName:@"Mission Coffee Co." rating:@"11 Price Ave Columbus, OH 43201" Lat: 39.980697 andLng:-83.004708];
    
    FMSCoffeeShop *coffee13 = [[FMSCoffeeShop alloc]initWithName:@"Yeah, Me Too" rating:@"3005 Indianola Ave Columbus, OH 43202" Lat: 40.025025 andLng:-83.001876];
    
    FMSCoffeeShop *coffee14 = [[FMSCoffeeShop alloc]initWithName:@"A Touch of Earth" rating:@"59 Spruce St Columbus, OH 43215" Lat: 39.972146 andLng: -83.004301];
    
    FMSCoffeeShop *coffee15 = [[FMSCoffeeShop alloc]initWithName:@"Three Creeks Coffee Roasters" rating:@"101 Mill St #106  Gahanna, OH 43230" Lat: 40.019923 andLng: -82.879591];
    
    return @[coffee0,coffee1, coffee2, coffee3, coffee4, coffee5, coffee6, coffee7, coffee8, coffee9, coffee10, coffee11, coffee12, coffee13, coffee14, coffee15];
}

@end
