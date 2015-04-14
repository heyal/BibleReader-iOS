//
//  VerseList.h
//  BibleReaderApp
//
//  Created by Matt B on 4/14/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerseList : NSObject {
    NSMutableArray *mutableArray;
}

@property (nonatomic) NSString *listDescription;
@property (nonatomic) NSString *version;

-(instancetype)initWithVersion:(NSString*)version description:(NSString*)description;
-(instancetype)initWithVersion:(NSString*)version description:(NSString*)description collection:(NSArray*)collection;

-(void)addObject:(id)object;
-(int)count;
-(NSArray*)allObjects;
@end
