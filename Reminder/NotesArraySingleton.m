//
//  PeopleArraySingleton.m
//  MySecondApp
//
//  Created by macmanu on 3/1/15.
//  Copyright (c) 2015 macmanu. All rights reserved.
//

#import "NotesArraySingleton.h"
#import "Note.h"

@implementation NotesArraySingleton

static NSMutableArray *array;

+ (NSMutableArray *)array{
    
    if(!array){
        array = [[NSMutableArray alloc]init];
        
        Note *n = [[Note alloc]init];
        n.title = @"lavar roupa";
        n.category = @"pessoal";
        n.desc = @"lavar roupas escuras sem amaciante";
        n.status = YES;
        
        
        [array addObject: n];
    }
    return array;

}


@end
