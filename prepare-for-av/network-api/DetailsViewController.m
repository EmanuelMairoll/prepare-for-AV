//
//  DetailsViewController.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 02.01.21.
//

#import "DetailsViewController.h"
#import "CopyableTableViewCell.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = _details.name;
    [(UITableView *)self.view setAllowsSelection:false];
    
    
//    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//    lpgr.minimumPressDuration = 1.0;
//    lpgr.delegate = self;
    //[self.view addGestureRecognizer:lpgr];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailsCell"];
    if (!cell)
        cell = [[CopyableTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"DetailsCell"];
 
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = _details.name;
            cell.detailTextLabel.text = @"Name";
            break;
        case 1:
            cell.textLabel.text = _details.email;
            cell.detailTextLabel.text = @"Email";
            break;
        case 2:
            cell.textLabel.text = _details.phone;
            cell.detailTextLabel.text = @"Phone";
            break;
        case 3:
            cell.textLabel.text = _details.username;
            cell.detailTextLabel.text = @"Username";
            break;
        case 4:
            cell.textLabel.text = _details.website;
            cell.detailTextLabel.text = @"Website";
            break;

        default:
            break;
    }
 
    return cell;
}

@end
