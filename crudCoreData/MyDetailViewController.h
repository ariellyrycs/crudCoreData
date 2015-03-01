//
//  MyDetailViewController.h
//  crudCoreData
//
//  Created by Ariel Robles on 3/1/15.
//  Copyright (c) 2015 Ariel Robles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fullname;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (strong) NSManagedObjectModel *contactdb;
- (IBAction)save:(id)sender;
- (IBAction)back:(id)sender;

@end
