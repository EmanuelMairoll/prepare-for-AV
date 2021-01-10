//
//  GalleryTableViewController.m
//  prepare-for-av
//
//  Created by Emanuel Mairoll on 04.01.21.
//

#import "GalleryTableViewController.h"
#import "GalleryTableViewCell.h"
#import "ImageManager.h"
#import "UIImage+normalizeImage.h"
#import "UIAlertView+Block.h"

@interface GalleryTableViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation GalleryTableViewController{
    ImageManager *imageManager;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    imageManager = [ImageManager loadFromDisk];
    
    ((UITableView *)self.view).rowHeight = UITableViewAutomaticDimension;
    ((UITableView *)self.view).estimatedRowHeight = 30;
}

//MARK: - Table Source Stuff

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [imageManager imageCount];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GalleryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GalleryCell" forIndexPath:indexPath];
    cell.imageView.image = [imageManager imageForIndex:indexPath.row];
    cell.titleButton.title = [imageManager titleForIndex:indexPath.row];
    
    return cell;
}

//MARK: - Table Event Handler Stuff

- (IBAction)deleteButtonPressed:(UIBarButtonItem*)sender {
    
    [[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Do you want to delete this item?"
                      cancelButtonTitle:@"Cancel" otherButtonTitle:@"Delete"]
     showUsingBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
         if (buttonIndex == 1) {
            
             UIView *obj = (UIView *)[sender valueForKey:@"view"];
             
             while (![obj isKindOfClass:[GalleryTableViewCell class]]){
                 obj = obj.superview;
             }
             GalleryTableViewCell *cell = (GalleryTableViewCell *) obj;
             
             NSIndexPath *index = [((UITableView *)self.view) indexPathForCell:cell];
             [self->imageManager deleteAtIndex:index.row];
             
             [(UITableView *)self.view beginUpdates];
             [(UITableView *)self.view deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
             [(UITableView *)self.view endUpdates];
         }
     }];
}


//MARK: - Image Picker Stuff

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:true completion:nil];
}

- (IBAction)addFromPhotoLibrary:(id)sender {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    
    UIImage *image = [[info valueForKey:UIImagePickerControllerOriginalImage] normalized];
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: @"Title"
                                                                        message: @"Give your Image a title"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    
    [picker presentViewController:alertController animated:YES completion:nil];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Title";
        textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSArray *textfields = alertController.textFields;
        UITextField *titleField = textfields[0];
        NSString *title = titleField.text;
        
        [self->imageManager addImage:image withTitle:title];
        
        [(UITableView *)self.view reloadData];
        [picker dismissViewControllerAnimated:true completion:nil];

    }]];
        
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:true completion:nil];
}

@end
