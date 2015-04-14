//
//  Verse.m
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import "Verse.h"
#import "Reference.h"
#import "BookOfBible.h"

@implementation Verse

-(instancetype)initWithReference:(Reference*)ref text:(NSString*)text {
    self = [super init];
    if (self) {
        _reference = ref;
        _text = text;
    }
    return self;
}
-(instancetype)initWithBook:(BookOfBible*)bookOfBible chapter:(int)chapter verse:(int)verse text:(NSString*)text {
    Reference *ref = [[Reference alloc] initWithBook:bookOfBible chapter:chapter verse:verse];
    return [self initWithReference:ref text:text];
}

-(BOOL)sameReference:(Verse*)other {
    return [_reference isEqual:[other reference]];
}

-(NSUInteger)hash {
    return [[self description] hash];
}
-(NSString *)description {
    return [NSString stringWithFormat:@"%@ %@",_reference,_text];
}

-(NSComparisonResult)compare:(Verse *)object {
    int diffReference = [_reference compare:[object reference]];
    if (diffReference != 0) {
        return [self resultFromInt:diffReference];
    } else {
        if (_text != NULL && [object text] != NULL) {
            return [_text compare:[object text]];
        } else if (_text != NULL) {
            return [self resultFromInt:1];
        } else {
            return [self resultFromInt:-1];
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
