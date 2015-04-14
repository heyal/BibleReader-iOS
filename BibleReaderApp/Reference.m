//
//  Reference.m
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import "Reference.h"
#import "BookOfBible.h"

@implementation Reference
-(instancetype)initWithBook:(BookOfBible*)bookOfBible chapter:(int)chapter verse:(int)verse {
    self = [super init];
    if (self) {
        _book = bookOfBible;
        _chapter = chapter;
        _verse = verse;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %i:%i",self.book,self.chapter,self.verse];
}

-(BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[Reference class]]) {
        Reference *ref = (Reference*)object;
        return (self.book == [ref book] && self.chapter == [ref chapter] && self.verse == [ref verse]);
    }
    return false;
}
-(NSUInteger)hash {
    return [[self description] hash];
}
-(NSComparisonResult)compare:(Reference *)object {
    int diffBook = [self.book getBook]-[[object book] getBook];
    
    if (diffBook != 0) {
        return [self resultFromInt:diffBook];
    } else {
        int diffChapter = self.chapter-[object chapter];
        if (diffChapter != 0) {
            return [self resultFromInt:diffChapter];
        } else {
            return [self resultFromInt:self.verse-[object verse]];
        }
    }
}

-(NSComparisonResult)resultFromInt:(int)result {
    if (result < 0) {
        return NSOrderedAscending;
    }
    else if (result > 0) {
        return NSOrderedDescending;
    }
    else {
        return NSOrderedSame;
    }
}
@end
