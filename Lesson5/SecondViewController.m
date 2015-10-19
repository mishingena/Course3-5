//
//  SecondViewController.m
//  Lesson5
//
//  Created by Azat Almeev on 19.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSUserDefaults standardUserDefaults] setObject:@"345" forKey:@"name_preference"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    });
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
