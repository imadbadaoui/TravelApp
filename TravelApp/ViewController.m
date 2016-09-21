//
//  ViewController.m
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "HMSegmentedControl.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray * _buses;
@property (nonatomic, strong) NSArray * _trains;
@property (nonatomic, strong) NSArray * _flights;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Flights", @"Buses", @"Trains"]];
    segmentedControl.frame = CGRectMake(0, self.segmentedControllerTab.frame.origin.y, self.segmentedControllerTab.frame.size.width, self.segmentedControllerTab.frame.size.height);
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    self.TableOfData.delegate = self;
    self.TableOfData.dataSource = self;
    
    [self reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)segmentedControlChangedValue:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex)
    {
        case 0:
            self.type = Flights;
            break;
        case 1:
            self.type = Buses;
            break;
        case 2:
            self.type = Trains;
            break;
        default:
            break;
    }
    [UIView transitionWithView: self.TableOfData
                      duration: 0.35f
                       options: UIViewAnimationOptionTransitionFlipFromLeft
                    animations: ^(void)
     {
         [self.TableOfData reloadData];
     }
                    completion: nil];
   // [self.TableOfData reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadData
{
    self._buses = [[TRAVELRBuses allObjects] toArray];
    self._trains = [[TRAVELRTrains allObjects] toArray];
    self._flights = [[TRAVELRFlights allObjects] toArray];
    
    if (self._buses == nil || self._buses.count == 0)
    {
       [self alertMessage:@"No Data for Buses !"];
    }
    else
    {
        self._buses = [self._buses sortedArrayUsingComparator:^NSComparisonResult(TRAVELRBuses *n1, TRAVELRBuses *n2){
            
            return [n1.departure_time compare:n2.departure_time];
            
        }];
    }
    if (self._trains == nil || self._trains.count == 0)
    {
        [self alertMessage:@"No Data for Trains !"];
    }
    else
    {
        self._trains = [self._trains sortedArrayUsingComparator:^NSComparisonResult(TRAVELRTrains *n1, TRAVELRTrains *n2){
            
            return [n1.departure_time compare:n2.departure_time];
            
       }];

    }
    if (self._flights == nil || self._flights.count == 0)
    {
        [self alertMessage:@"No Data for Flights !"];
    }
    else
    {
        self._flights = [self._flights sortedArrayUsingComparator:^NSComparisonResult(TRAVELRFlights *n1, TRAVELRFlights *n2){
            
            return [n1.departure_time compare:n2.departure_time];
            
        }];
    }
    [self.TableOfData reloadData];
}

#pragma mark - UITableView delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/**
 *  Showing all Data
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    switch (self.type)
    {
        case Flights:
            count = self._flights.count;
            break;
        case Buses:
            count = self._buses.count;
            break;
        case Trains:
            count = self._trains.count;
            break;
        default:
            break;
    }

    return count;
}

- (IBAction)sortTable:(id)sender {
    switch (self.type)
    {
        case Flights:
            self._flights = [self._flights sortedArrayUsingComparator:^NSComparisonResult(TRAVELRFlights *n1, TRAVELRFlights *n2){
                
                return [n1.arrival_time compare:n2.arrival_time];
                
            }];
            break;
        case Buses:
            self._buses = [self._buses sortedArrayUsingComparator:^NSComparisonResult(TRAVELRBuses *n1, TRAVELRBuses *n2){
                
                return [n1.arrival_time compare:n2.arrival_time];
                
            }];
            break;
        case Trains:
            self._trains = [self._trains sortedArrayUsingComparator:^NSComparisonResult(TRAVELRTrains *n1, TRAVELRTrains *n2){
                
                return [n1.arrival_time compare:n2.arrival_time];
                
            }];
            break;
        default:
            break;
    }
    
    [UIView transitionWithView: self.TableOfData
                      duration: 0.35f
                       options: UIViewAnimationOptionTransitionCrossDissolve
                    animations: ^(void)
     {
         [self.TableOfData reloadData];
     }
                    completion: nil];
   // [self.TableOfData reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil]
        forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    }
    switch (self.type)
    {
        case Flights:
        {
            TRAVELRFlights * flight = (TRAVELRFlights *)[self._flights objectAtIndex:indexPath.row];
            cell.datas = flight;
            break;
        }
        case Buses:
        {
            TRAVELRBuses * buses = (TRAVELRBuses *)[self._buses objectAtIndex:indexPath.row];
            
            cell.datas = buses;
            break;
        }
        case Trains:
        {
            TRAVELRTrains * trains = (TRAVELRTrains *)[self._trains objectAtIndex:indexPath.row];
            
            cell.datas = trains;
            break;
        }
        default:
            break;
    }
    
    return cell;
    
    
}
- (void) alertMessage:(NSString *)message
{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@""
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Handel no, thanks button
                                   
                               }];
    
    [alert addAction:noButton];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self alertMessage:@"Offer details are not yet implemented!"];
}
- (IBAction)changeActionTab:(UISegmentedControl*)sender {
    switch (sender.selectedSegmentIndex)
    {
        case 0:
            self.type = Flights;
            break;
        case 1:
            self.type = Buses;
            break;
        case 2:
            self.type = Trains;
            break;
        default:
            break;
    }
    
    [self.TableOfData reloadData];
}
@end
