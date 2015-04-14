//
//  BibleReaderModel.m
//  BibleReaderApp
//
//  Created by Matt B on 4/14/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import "BibleReaderModel.h"
#import "VerseList.h"
#import "ReferenceList.h"
#import "Reference.h"
#import "Verse.h"

@implementation BibleReaderModel

-(instancetype)init {
    self = [super init];
    if (self) {
        bibles = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(NSArray*)getVersions {
    return [bibles allKeys];
}

-(int)getNumberOfVersions {
    return (int)[bibles count];
}

-(void)addBible:(id<Bible>)bible {
    [bibles setObject:bible forKey:[bible getVersion]];
}

-(id<Bible>)getBible:(NSString *)version {
    return [bibles objectForKey:version];
}

-(VerseList*)getVerses:(NSString*)version ref:(ReferenceList*)references {
    return [[bibles objectForKey:version] getVerses:references];
}

-(NSString*)getText:(NSString*)version ref:(Reference*)reference {
    id<Bible> bible = [bibles objectForKey:version];
    if (bible == NULL) return @"";
    NSString *text = [bible getVerseText:reference];
    return text;
}

-(ReferenceList*)getReferencesContaining:(NSString*)words {
    NSMutableArray *references = [[NSMutableArray alloc] init];
    for (NSString *version in [bibles allKeys]) {
        [references addObjectsFromArray:[[[bibles objectForKey:version] getReferencesContaining:words] allObjects]];
    }
    return [[ReferenceList alloc] initWithArray:references];
}

// PATTERNS

-(ReferenceList*)getVerseReferences:(BookOfBible*)book chapter:(int)chapter verse:(int)verse {
    Reference *r = [[Reference alloc] initWithBook:book chapter:chapter verse:verse];
    
    NSMutableArray *references = [[NSMutableArray alloc] init];
    for (NSString *version in [bibles allKeys]) {
        Verse *v = [[bibles objectForKey:version] getVerse:r];
        if (v != NULL) {
            [references addObject:[v reference]];
        }
    }
    return [[ReferenceList alloc] initWithArray:references];
}

-(ReferenceList*)getPassageReferences:(Reference*)startVerse end:(Reference*)endVerse {
    NSMutableArray *references = [[NSMutableArray alloc] init];
    for (NSString *version in [bibles allKeys]) {
        [references addObjectsFromArray:[[[bibles objectForKey:version] getReferencesInclusive:startVerse last:endVerse] allObjects]];
    }
    return [[ReferenceList alloc] initWithArray:references];
}

-(ReferenceList*)getBookReferences:(BookOfBible*)book {
    NSMutableArray *references = [[NSMutableArray alloc] init];
    for (NSString *version in [bibles allKeys]) {
        [references addObjectsFromArray:[[[bibles objectForKey:version] getReferencesForBook:book] allObjects]];
    }
    return [[ReferenceList alloc] initWithArray:references];
}

-(ReferenceList*)getChapterReferences:(BookOfBible*)book chapter:(int)chapter {
    NSMutableArray *references = [[NSMutableArray alloc] init];
    for (NSString *version in [bibles allKeys]) {
        [references addObjectsFromArray:[[[bibles objectForKey:version] getReferencesForChapter:book chapter:chapter] allObjects]];
    }
    return [[ReferenceList alloc] initWithArray:references];
}

@end
