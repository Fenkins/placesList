//
//  DetailViewController.m
//  placesList
//
//  Created by Fenkins on 04/08/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showMap"]) {
        MapViewController *mapView = [segue destinationViewController];
        mapView.passedCoordinates = _venueCoordinates;
        mapView.passedName = _venueName;
        mapView.passedDistance = _venueDistance;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _nameLabel.text = self.venueName;
    _categoryLabel.text = self.venueCategory;
    _cityLabel.text = self.venueCity;
    _streetLabel.text = self.venueStreet;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
