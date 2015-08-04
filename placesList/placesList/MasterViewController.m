//
//  MasterViewController.m
//  placesList
//
//  Created by Fenkins on 04/08/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController{
    NSArray *nameArray;
    NSArray *categoryArray;
    NSArray *distanceArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getVenuesList];

    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VenuesListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.venueNameLabel.text = [nameArray objectAtIndex:indexPath.row];
    cell.venueCategoryLabel.text = [categoryArray objectAtIndex:indexPath.row];
    cell.venueDistanceLabel.text = [distanceArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void)getVenuesList {
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYYMMdd"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSString *radiusMeters = @"2000";
    NSString *oAuthToken = @"KVSG0FHB52JN4GWYVLENEKXN1HKJJXPTLW1ZKMWQ21HUSZGO";
    CGFloat latitude = 18.5308225;
    CGFloat longitude = 73.8474647;
    NSString *latitudeStr = [NSString stringWithFormat:@"%f",latitude];
    NSString *longitudeStr = [NSString stringWithFormat:@"%f",longitude];
    NSMutableString *lat_longString = [[NSMutableString alloc]initWithString:latitudeStr];
    [lat_longString appendString:@","];
    [lat_longString appendString:longitudeStr];
    NSString *query = @"cafe";
    NSString *resultLimit = @"50";
    NSString *urlString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?ll=%@&query=%@&limit=%@&radius=%@&oauth_token=%@&v=%@", lat_longString, query, resultLimit, radiusMeters, oAuthToken, dateString];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    //Perform request and get JSON back as an NSData obj
    NSError *error = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (error != nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Mkay" otherButtonTitles:nil];
        [alert show];
    } else {
        //NSString *jsonString = [[NSString alloc]initWithData:responce encoding:NSUTF8StringEncoding];
        //NSLog(@"JSONSTRING %@",jsonString);
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
        NSDictionary *responseData = [[jsonResponse objectForKey:@"response"]objectForKey:@"venues"];
        // What is the name?
        nameArray = [responseData valueForKey:@"name"];
        
        // What is the category?
        NSArray *categoryArrayWithDict = [[responseData valueForKey:@"categories"]valueForKey:@"name"];
        NSMutableArray *categoryStackArray;
        for (NSArray *everyArray in categoryArrayWithDict) {
            NSString *newString = [everyArray objectAtIndex:0];
            if (categoryStackArray) {
                [categoryStackArray addObject:newString];
            } else {
                categoryStackArray = [[NSMutableArray alloc]init];
                [categoryStackArray addObject:newString];
            }
        }
        categoryArray = [categoryStackArray copy];
        
        // What is the distance?
        NSArray *distanceArrayWithDict = [[responseData valueForKey:@"location"]valueForKey:@"distance"];
        NSMutableArray *distanceStackArray;
        for (NSNumber *everyNumber in distanceArrayWithDict) {
            NSString *newString = [everyNumber stringValue];
            if (distanceStackArray) {
                [distanceStackArray addObject:newString];
            } else {
                distanceStackArray = [[NSMutableArray alloc]init];
                [distanceStackArray addObject:newString];
            }
        }
        distanceArray = [distanceStackArray copy];
    }
}

@end
