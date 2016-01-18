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
    return 0;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender
{
    self.thingsToDo = [NSMutableArray arrayWithObjects: nil];

    [self.toDoTextField.text] =
}

@end
