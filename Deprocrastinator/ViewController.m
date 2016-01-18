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
@property NSMutableArray *thingsToDo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 self.thingsToDo = [NSMutableArray arrayWithObjects:@"", nil];

}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (self.thingsToDo.count - 1);
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.thingsToDo objectAtIndex:indexPath.row + 1]];
    return cell;
}

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender
{
    self.thingsToDo = [NSMutableArray arrayWithObjects:@"", nil];
    [self.thingsToDo addObject:self.toDoTextField.text];

}

@end
