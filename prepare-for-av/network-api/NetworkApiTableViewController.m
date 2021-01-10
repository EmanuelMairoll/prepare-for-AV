//
//  NetworkApiTableViewController.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 30.12.20.
//

#import "NetworkApiTableViewController.h"
#import "User.h"
#import "DetailsViewController.h"


@implementation NetworkApiTableViewController{
    NSMutableArray *apiData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    apiData = [NSMutableArray arrayWithCapacity:20];

    [self reloadData];
}

- (IBAction)reloadData {
    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/users"]];
    NSURLConnection *_ =[[NSURLConnection alloc] initWithRequest:request delegate:self];
        
    [((UITableView *)self.view).refreshControl endRefreshing];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSMutableData *responseData = [[NSMutableData alloc] init];
    [responseData appendData:data];
            
    NSError *error;
    NSArray<User *> *users = [User arrayOfModelsFromData:responseData error:&error];
    
    [apiData removeAllObjects];
    [apiData addObjectsFromArray:users];
    
    [(UITableView *)self.view reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [apiData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ApiCell"];
    
    User *user = apiData[indexPath.row];
    cell.textLabel.text = user.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsViewController *detailViewController = [[DetailsViewController alloc] initWithStyle:UITableViewStyleGrouped];
    detailViewController.details = apiData[indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end


