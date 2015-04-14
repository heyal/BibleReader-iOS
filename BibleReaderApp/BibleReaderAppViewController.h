//
//  BibleReaderAppViewController.h
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BibleReaderAppViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchField;

@end
