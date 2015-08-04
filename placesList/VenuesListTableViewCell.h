//
//  VenuesListTableViewCell.h
//  placesList
//
//  Created by Fenkins on 04/08/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenuesListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *venueNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *venueCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *venueDistanceLabel;

@end
