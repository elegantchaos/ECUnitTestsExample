//
//  MasterViewController.h
//  iOS Example
//
//  Created by Sam Deane on 14/08/2012.
//
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
