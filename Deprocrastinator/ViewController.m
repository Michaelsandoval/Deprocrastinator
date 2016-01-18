//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Michael Sandoval on 1/18/16.
//  Copyright © 2016 Michael Sandoval. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *toDoTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *thingsToDo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 self.thingsToDo = [NSMutableArray new];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    

}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.thingsToDo.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text =  [self.thingsToDo objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];
}
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.thingsToDo removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender
{
    [self.thingsToDo addObject:self.toDoTextField.text];
    [self.tableView reloadData];
    self.toDoTextField.text = @"";
    [self.toDoTextField resignFirstResponder];

}
- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {
    if (self.navigationItem.leftBarButtonItem) {
        <#statements#>
    }
    [self.tableView setEditing:YES animated:YES];
    
}


@end
