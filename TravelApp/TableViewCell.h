//
//  TableViewCell.h
//  TravelApp
//
//  Created by Imad Badaoui on 21/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageItem;
@property (weak, nonatomic) IBOutlet UILabel *StopsLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (nonatomic, strong) id datas;
@end
