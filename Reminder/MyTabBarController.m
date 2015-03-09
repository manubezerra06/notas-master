//
//  MyTabBarController.m
//  MySecondApp
//
//  Created by macmanu on 3/6/15.
//  Copyright (c) 2015 macmanu. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *controllersToAdd = [@[] mutableCopy];
    for (NSInteger i=0;i<3;i++) {
        
        //        self.storyboard instantiateViewControllerWithIdentifier:@"MY ID GOES HERE";
        
        // Cria uma view a partir do storyboard ID
        // Adiciona essa view na propriedade "viewControllers".
        
        //        controllersToAdd addObject:VIEW QUE EU CRIEI]
        
    }
    
    self.viewControllers = [controllersToAdd copy];
    
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
