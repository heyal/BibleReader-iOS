//
//  VerseList.m
//  BibleReaderApp
//
//  Created by Matt B on 4/14/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import "VerseList.h"

@implementation VerseList : NSObject
@synthesize version = _version;
@synthesize listDescription = _description;

-(id)initWithVersion:(NSString*)version description:(NSString*)description {
    self = [self init];
    if (self) {
        mutableArray = [[NSMutableArray alloc] init];
        
        _version = version;
        _description = description;
    }
    return self;
}

-(id)initWithVersion:(NSString*)version description:(NSString*)description collection:(NSArray*)collection {
    self = [self init];
    if (self) {
        mutableArray = [[NSMutableArray alloc] initWithArray:collection];
        
        self.version = version;
        self.listDescription = description;
    }
    return self;
}

#pragma mark - MutableArray Methods

-(void)addObject:(id)object {
    [mutableArray addObject:object];
}

-(int)count {
    return (int)[mutableArray count];
}

-(NSArray*)allObjects {
    return [mutableArray copy];
}

@end
