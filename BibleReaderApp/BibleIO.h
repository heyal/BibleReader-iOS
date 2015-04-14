//
//  BibleIO.h
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import <Foundation/Foundation.h>
@class VerseList;
@interface BibleIO : NSObject
-(VerseList*)readBible:(NSString*)filename;
@end
