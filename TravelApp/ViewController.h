//
//  ViewController.h
//  TravelApp
//
//  Created by Imad Badaoui on 20/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLSegmentedPagerTabStripViewController.h"

typedef enum {
    Flights,
    Trains,
    Buses
} TravelType;
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableOfData;
@property (nonatomic, assign) TravelType type;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControllerTab;

@end

