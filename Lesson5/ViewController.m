//
//  ViewController.m
//  Lesson5
//
//  Created by Azat Almeev on 18.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"name_preference"]);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDefaultsDidChangeNotification:) name:NSUserDefaultsDidChangeNotification object:nil];
}

- (void)userDefaultsDidChangeNotification:(NSNotification *)note {
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"name_preference"]);
}

- (IBAction)returnHere:(UIStoryboardSegue *)sender {
    
}

@end
