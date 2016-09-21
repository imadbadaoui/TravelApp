//
//  TableViewCell.m
//  TravelApp
//
//  Created by Imad Badaoui on 21/09/2016.
//  Copyright © 2016 Imad Badaoui. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDatas:(id)datas
{
    _datas = datas;
    
    if ([datas isKindOfClass:[TRAVELRFlights class]])
    {
        TRAVELRFlights *item = (TRAVELRFlights*)datas;
        
        self.timeLabel.text = [NSString stringWithFormat:@"%@ - %@",item.departure_time,item.arrival_time];
        self.priceLabel.text = [NSString stringWithFormat:@"€ %@",item.price_in_euros];
        self.StopsLabel.text = [NSString stringWithFormat:@"%@ Stops",[NSNumber numberWithInteger:item.number_of_stops]];
        self.imageItem.image = [self getThumbImageFromNew:[item.provider_logo lastPathComponent]];
    }
    
    if ([datas isKindOfClass:[TRAVELRBuses class]])
    {
        TRAVELRBuses *item = (TRAVELRBuses*)datas;
        
        self.timeLabel.text = [NSString stringWithFormat:@"%@ - %@",item.departure_time,item.arrival_time];
        self.priceLabel.text = [NSString stringWithFormat:@"€ %@",item.price_in_euros];
        self.StopsLabel.text = [NSString stringWithFormat:@"%@ Stops",[NSNumber numberWithInteger:item.number_of_stops]];
         self.imageItem.image = [self getThumbImageFromNew:[item.provider_logo lastPathComponent]];
    }
    
    if ([datas isKindOfClass:[TRAVELRTrains class]])
    {
        TRAVELRTrains *item = (TRAVELRTrains*)datas;
        
        self.timeLabel.text = [NSString stringWithFormat:@"%@ - %@",item.departure_time,item.arrival_time];
        self.priceLabel.text = [NSString stringWithFormat:@"€ %@",item.price_in_euros];
        self.StopsLabel.text = [NSString stringWithFormat:@"%@ Stops",[NSNumber numberWithInteger:item.number_of_stops]];
         self.imageItem.image = [self getThumbImageFromNew:[item.provider_logo lastPathComponent]];
    }
}

- (UIImage*)getThumbImageFromNew:(NSString*)new
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:new];
    
    return [UIImage imageWithContentsOfFile:filePath];
}
@end
