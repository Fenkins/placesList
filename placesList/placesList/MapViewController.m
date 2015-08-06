//
//  MapViewController.m
//  placesList
//
//  Created by Fenkins on 06/08/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MKPlacemark *venuePlacemark = [[MKPlacemark alloc]initWithCoordinate:_passedCoordinates.coordinate addressDictionary:nil];
    

    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = venuePlacemark.coordinate;
    point.title = _passedName;
    point.subtitle = _passedDistance;
    
    
    // Set your region using placemark (not point)
    MKCoordinateRegion region = self.mapView.region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    region.span = span;
    region.center = venuePlacemark.coordinate;
    
    // Add point (not placemark) to the mapView
    [self.mapView setRegion:region animated:YES];
    [self.mapView addAnnotation:point];
    
    // Select the PointAnnotation programatically
    [self.mapView selectAnnotation:point animated:NO];
    
    
    
    
//        [self.mapView addAnnotation:venuePlacemark];
//        [self.mapView setRegion:region animated:YES];
//        [self.mapView regionThatFits:region];
    
//    NSLog(@"COORD LOOK %@",_passedCoordinates);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
