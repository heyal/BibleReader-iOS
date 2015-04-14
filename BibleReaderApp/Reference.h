//
//  Reference.h
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BookOfBible;

@interface Reference : NSObject
@property (nonatomic,readonly) BookOfBible	*book;
@property (nonatomic,readonly) int chapter;
@property (nonatomic,readonly) int verse;

-(instancetype)initWithBook:(BookOfBible*)bookOfBible chapter:(int)chapter verse:(int)verse;
-(NSComparisonResult)compare:(Reference *)object;
@end
