//
//  ViewController.m
//  WallpaperSwapper
//
//  Created by Michal Moskala on 06.02.2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

#import "ViewController.h"
#import "Swapper.h"

@interface ViewController ()
@property (nonatomic, strong, nonnull) Swapper *swapper;
@end

@implementation ViewController

- (Swapper *)swapper {
    if (_swapper == nil) {
        _swapper = [Swapper new];
    }
    
    return _swapper;
}

- (IBAction)openPhotoPickerTapped:(UIButton *)sender {
    UIImagePickerController *controller = [UIImagePickerController new];
    controller.delegate = self;
    controller.allowsEditing = NO;
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    [self.swapper setWallpaperImage:chosenImage];
}


@end
