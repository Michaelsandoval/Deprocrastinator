//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Michael Sandoval on 1/18/16.
//  Copyright © 2016 Michael Sandoval. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *toDoTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *thingsToDo;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBarButton;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.thingsToDo = [NSMutableArray new];
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
        [self.thingsToDo removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    [self.tableView exchangeSubviewAtIndex:fromIndexPath.row withSubviewAtIndex:toIndexPath.row];
}

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender
{
    [self.thingsToDo addObject:self.toDoTextField.text];
    [self.tableView reloadData];
    self.toDoTextField.text = @"";
    [self.toDoTextField resignFirstResponder];

}
- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
    if ([sender.title isEqualToString:@"Edit"])
    {
        sender.title = [NSString stringWithFormat:@"Done"];
        [self.tableView setEditing:YES animated:YES];
    }
    else
    {
        sender.title = [NSString stringWithFormat:@"Edit"];
        [self.tableView setEditing:NO animated:NO];
    }
}

- (IBAction)swipeRight:(UISwipeGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint swipeLocation = [sender locationInView:self.tableView];
        NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
        UITableViewCell* swipedCell = [self.tableView cellForRowAtIndexPath:swipedIndexPath];
        
        if ((swipedCell.textLabel.textColor == [UIColor redColor]))
        {
            swipedCell.textLabel.textColor = [UIColor yellowColor];
        }
        else if ((swipedCell.textLabel.textColor == [UIColor yellowColor]))
        {
            swipedCell.textLabel.textColor = [UIColor greenColor];
        }
        else if ((swipedCell.textLabel.textColor == [UIColor greenColor]))
        {
            swipedCell.textLabel.textColor = [UIColor blackColor];
        }
        else
        {
            swipedCell.textLabel.textColor = [UIColor redColor];
        }



    }
}


@end
