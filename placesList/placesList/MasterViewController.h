//
//  MasterViewController.h
//  placesList
//
//  Created by Fenkins on 04/08/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenuesListTableViewCell.h"
#import "mapKit/MapKit.h"
#import "CoreLocation/CoreLocation.h"


@interface MasterViewController : UITableViewController <CLLocationManagerDelegate>
- (IBAction)refreshButton:(UIBarButtonItem *)sender;
@property (nonatomic , strong) CLLocationManager *locationManager;
@property (nonatomic, retain) CLLocation *location;

@end

