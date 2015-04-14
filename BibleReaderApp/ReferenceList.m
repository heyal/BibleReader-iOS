//
//  ReferenceList.m
//  BibleReaderApp
//
//  Created by Matt B on 4/14/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import "ReferenceList.h"

@implementation ReferenceList
-(instancetype)initWithArray:(NSArray*)array {
    self = [super init];
    if (self) {
        mutableArray = [[NSMutableArray alloc] initWithArray:array];
    }
    return self;
}
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
