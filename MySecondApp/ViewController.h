//
//  ViewController.h
//  MySecondApp
//
//  Created by macmanu on 3/1/15.
//  Copyright (c) 2015 macmanu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString *lblText;

@property (weak, nonatomic) IBOutlet UILabel *lblName;


@property (weak, nonatomic) IBOutlet UITableView *tablePeople;


@end

