//
//  MyDetailViewController.m
//  crudCoreData
//
//  Created by Ariel Robles on 3/1/15.
//  Copyright (c) 2015 Ariel Robles. All rights reserved.
//

#import "MyDetailViewController.h"
#import "AppDelegate.h"

@interface MyDetailViewController ()

@end

@implementation MyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(self.contactdb) {
        //self.fullname.text = self.contactdb.fullname;
        [self.fullname setText:[self.contactdb valueForKey:@"fullname"]];
        [self.email setText:[self.contactdb valueForKey: @"email"]];
        [self.phone setText:[self.contactdb valueForKey: @"phone"]];
    }
}

-(NSManagedObjectContext *) managerObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managerObjectContext];
    if(self.contactdb) {
        [self.contactdb setValue: self.fullname.text forKey:@"fullname"];
        [self.contactdb setValue: self.email.text forKey:@"email"];
        [self.contactdb setValue: self.phone.text forKey:@"phone"];
    }else {
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
        [newDevice setValue: self.fullname.text forKey:@"fullname"];
        [newDevice setValue:self.email.text forKey:@"email"];
        [newDevice setValue:self.email.text forKey:@"phone"];
    }
    NSError* error;
    if(![context save:&error]) {
        NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
