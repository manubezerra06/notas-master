//
//  AddPersonViewController.m
//  MySecondApp
//
//  Created by macmanu on 3/1/15.
//  Copyright (c) 2015 macmanu. All rights reserved.
//

#import "AddNoteViewController.h"
#import "NotesArraySingleton.h"
#import "Note.h"

@interface AddNoteViewController ()

@end

@implementation AddNoteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}



- (IBAction)addNoteDone:(id)sender
{
    
    NSMutableArray *notes = [NotesArraySingleton array];
    Note *note = [[Note alloc]init];
    
    if ([self.txtName.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]
                             initWithTitle:@"Título" message:@"Você deve inserir um título" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        [self.txtName becomeFirstResponder];

    } else if ([self.descTextView.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Descrição" message:@"Você deve inserir uma descrição" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        [self.descTextView becomeFirstResponder];
        
    }else {
    
        note.title = self.txtName.text;
        note.desc = self.descTextView.text;
        
        if(self.categorySegmentedControl.selectedSegmentIndex == 0)
        {
            note.category = @"compras";
        
        }
        else if (self.categorySegmentedControl.selectedSegmentIndex == 1)
        {
            note.category = @"finanças";
        }
        else
        {
            note.category = @"pessoal";
        }
        
        if(self.statusButton.isSelected == TRUE)
        {
            note.status = TRUE;
            self.statusButton.backgroundColor = [UIColor redColor];
        
        }
        else
        {
            note.status = FALSE;
        }
        
        [notes addObject: note];
        self.txtName.text = @"";
        self.descTextView.text = @"";
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    
    }
    
    
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end
