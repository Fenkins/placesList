//
//  DetailViewController.h
//  placesList
//
//  Created by Fenkins on 04/08/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;

@property (retain, nonatomic) NSString *venueName;
@property (retain, nonatomic) NSString *venueCategory;
@property (retain, nonatomic) NSString *venueCity;
@property (retain, nonatomic) NSString *venueStreet;
@end
