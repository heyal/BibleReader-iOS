//
//  BibleReaderAppViewController.m
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import "BibleReaderAppViewController.h"
#import "BibleIO.h"
#import "VerseList.h"
#import "BookOfBible.h"

@interface BibleReaderAppViewController ()

@end

@implementation BibleReaderAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // needs to be called before any parsing
    [BookOfBible initStaticVariables];
    
    
    // Should do async
    BibleIO *bibleIO = [[BibleIO alloc] init];
    VerseList *kjvList = [bibleIO readBible:@"kjv.atv"];
    NSLog(@"");
    
    
    self.searchField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate Methods

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    // clear results
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    // search
}

@end
