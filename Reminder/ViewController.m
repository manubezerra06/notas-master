//
//  ViewController.m
//  MySecondApp
//
//  Created by macmanu on 3/1/15.
//  Copyright (c) 2015 macmanu. All rights reserved.
//

#import "ViewController.h"
#import "NotesArraySingleton.h"
#import "Note.h"
#import "AddNoteViewController.h"

@interface ViewController ()

@end

@implementation ViewController

{
    NSMutableArray *notes;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //instancia meu singleton
    notes = [NotesArraySingleton array];
    //faz uma copia filtrada dos dados
    self.filteredTableData = [notes copy];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    //Por padrão deixa setado "todos" na tabela
    self.filterSegmentedControl.selectedSegmentIndex= 0;
    //Caso eu mude a categoria a ser exibida, eu refiltro o array dou reload na tabela
    [self filterTable];
    [self.tableNotes reloadData];
}

//Este metodo filtra as notas para exibir na tabela

- (void) filterTable
{
    NSString *category;
    
    switch (self.filterSegmentedControl.selectedSegmentIndex)
    {
        case 0:
            category = @"all";
            break;
        case 1:
            category = @"compras";
            break;
            
        case 2:
            category = @"finanças";
            break;
            
        case 3:
            category = @"pessoal";
            break;
            
        default:
            category = @"all";
            break;
    }
    
    //Exibe todas as notas por padrão
    if([category isEqual:@"all"])
    {
        self.filteredTableData = [notes copy];
    }
    else
    {
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"category like %@", category]; //faz quase o mesmo que lambda do C#
        self.filteredTableData = [[notes filteredArrayUsingPredicate:pred]	copy];
    }
    
    [self.tableNotes reloadData];
    
}



//este metodo verifica se o indice do segmented control mudou
- (IBAction)filterChanged:(UISegmentedControl *)sender
{
    [self filterTable];
}



//Este metodo conta quantas linhas tem na tua section.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return[self.filteredTableData count];
    
}


//Este metodo personaliza e coloca as celulas na tabela

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableCell"];
    Note *note = [self.filteredTableData objectAtIndex:indexPath.row];
    
    cell.textLabel.text = note.title;
    cell.detailTextLabel.text = note.category;
    
    //seta cor da celula de acordo com o status
    if(note.status == YES)
    {
        cell.backgroundColor= [UIColor brownColor];
    }
    else
    {
        cell.backgroundColor= [UIColor whiteColor];
    }
    
    
    //seta imagem da celula de acordo com a categoria
    if([note.category  isEqual: @"compras"])
    {
        cell.imageView.image = [UIImage imageNamed:@"compras"];
    }
    else if ([note.category  isEqual: @"finanças"])
    {
        cell.imageView.image = [UIImage imageNamed:@"financas"];
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"pessoal"];
    }
    
    return cell;
}

//Pega a nota selecionada da tabela e passa ela para edição através do mainStoryBoard que instancia a viewController de adicianar nota

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    AddNoteViewController *addNoteViewController = [self.storyboard instantiateViewControllerWithIdentifier: @"AddNoteViewController"];
    addNoteViewController.noteToEdit = [self.filteredTableData objectAtIndex: indexPath.row];
    [self.navigationController pushViewController:addNoteViewController animated:YES];
    
    
    
}


//Coloca o botão de delete
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
    
}

//Deleta a nota selecionada

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath
{
    [self.filteredTableData removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
    
}

@end
