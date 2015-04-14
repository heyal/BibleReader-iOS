//
//  ReferenceList.h
//  BibleReaderApp
//
//  Created by Matt B on 4/14/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReferenceList : NSObject {
    NSMutableArray *mutableArray;
}
-(instancetype)initWithArray:(NSArray*)array;
-(void)addObject:(id)object;
-(int)count;
-(NSArray*)allObjects;
@end
