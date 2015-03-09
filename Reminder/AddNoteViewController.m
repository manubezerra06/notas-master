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
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
//Informações para editar a nota
    
    if (self.noteToEdit != nil)
    {
        
        self.txtName.text = self.noteToEdit.title;
        self.descTextView.text = self.noteToEdit.desc;
        self.statusButton.selected = self.noteToEdit.status;
        if([self.noteToEdit.category isEqual: @"compras"])
        {
            self.categorySegmentedControl.selectedSegmentIndex = 0;
        }
        else if ([self.noteToEdit.category isEqual: @"finanças"])
        {
            self.categorySegmentedControl.selectedSegmentIndex = 1;
        }
        
        else
        {
            self.categorySegmentedControl.selectedSegmentIndex = 2;
        
        }
    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    //Esconde o backButton indesejado
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
}

//Adiciona uma Nota

- (IBAction)addNoteDone:(id)sender
{
    NSMutableArray *notes = [NotesArraySingleton array];
    
    Note *note = nil;
    
    if (self.noteToEdit != nil){
        note =  self.noteToEdit;
    }
    else
    
    {
        note = [[Note alloc]init];
    }
    
    if ([self.txtName.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Título" message:@"Você deve inserir um título" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        [self.txtName becomeFirstResponder];
        
    }
    else if ([self.descTextView.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Descrição" message:@"Você deve inserir uma descrição" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        [self.descTextView becomeFirstResponder];
        
    }
    else
    {
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
        
        note.status = self.pressed;
        
        if(self.noteToEdit == nil)
        {
            [notes addObject: note];
        }
        
        self.txtName.text = @"";
        self.descTextView.text = @"";
        
        [self dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:TRUE];
    }
    
    
}

//verifica se o botâo de status está pressionado e muda a imagem do mesmo

- (IBAction)pinPressed:(UIButton *)sender {
    
    
    self.pressed = !self.pressed;
    
    if(self.pressed)
    {
        [_statusButton setImage: [UIImage imageNamed:(@"pinOn")] forState: UIControlStateNormal];
        
    }
    else
    {
        [_statusButton setImage: [UIImage imageNamed:(@"pinOff")] forState: UIControlStateNormal];
    }
    
}
@end
