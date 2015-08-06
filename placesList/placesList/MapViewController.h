//
//  MapViewController.h
//  placesList
//
//  Created by Fenkins on 06/08/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"
#import "mapKit/MapKit.h"

@interface MapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) CLLocation *passedCoordinates;
@property (nonatomic, retain) NSString *passedName;
@property (nonatomic, retain) NSString *passedDistance;
@end
