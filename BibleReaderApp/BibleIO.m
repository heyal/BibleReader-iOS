//
//  BibleIO.m
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import "BibleIO.h"
#import "DDFileReader.h"
#import "Verse.h"
#import "VerseList.h"
#import "Reference.h"
#import "BookOfBible.h"

@implementation BibleIO

-(VerseList*)readBible:(NSString *)filename {
    // get extension
    NSString *extension = [[filename componentsSeparatedByString:@"."] lastObject];
    if ([extension isEqualToString:@"xmv"]) {
        return [self readATV:filename];
    }
    else if ([extension isEqualToString:@"atv"]) {
        return [self readATV:filename];
    }
    else {
        NSLog(@"Unrecognized bible format.");
    }
    
    return NULL;
}

#pragma mark - Read ATV

-(VerseList*)readATV:(NSString*)filename {
    
    __block BOOL firstLine = true;
    __block VerseList *vList;
    
    DDFileReader * reader = [[DDFileReader alloc] initWithFilePath:[self filepathForFilename:filename]];
    NSString * line = nil;
    while ((line = [reader readLine])) {
        // Parse first line seperately
        if (firstLine) {
            firstLine = false;
            NSArray *flSplit = [line componentsSeparatedByString:@": "]; // first line split
            if (flSplit.count == 2) {
                vList = [[VerseList alloc] initWithVersion:flSplit[0] description:flSplit[1]];
            }
            else {
                vList = [[VerseList alloc] initWithVersion:line description:@""];
            }
        }
        else {
            // if not first line
            
            // Data is in format BOOK@CH:V@VERSE_TEXT
            NSArray *split = [line componentsSeparatedByString:@"@"];
            if (split.count != 3) {
                reader = nil;
                return NULL;
            }
            NSArray *ref = [split[1] componentsSeparatedByString:@":"];
            if (ref.count != 2) {
                reader = nil;
                return NULL;
            }
            BookOfBible *bookOfBible = [BookOfBible getBookOfBible:split[0]];
            if (bookOfBible == NULL) {
                reader = nil;
                return NULL;
            }
            /*
            Reference r = new Reference(book,
                                        Integer.parseInt(ref[0]),
                                        Integer.parseInt(ref[1]));
            Verse v = new Verse(r, split[2]);
            list.add(v);
            */
            
            Reference *r = [[Reference alloc] initWithBook:bookOfBible chapter:[ref[0] intValue] verse:[ref[1] intValue]];
            Verse *v = [[Verse alloc] initWithReference:r text:split[2]];
            [vList addObject:v];
        }
    }
    reader = nil;
    return vList;
}

#pragma mark - Read XMV

-(VerseList*)readXMV:(NSString*)filename {
    
    __block BOOL firstLine = true;
    __block VerseList *vList;
    
    __block BookOfBible *currentBook;
    __block int currentChapter = 0;
    
    DDFileReader * reader = [[DDFileReader alloc] initWithFilePath:[self filepathForFilename:filename]];
    NSString * line = nil;
    while ((line = [reader readLine])) {
        if (firstLine) {
            firstLine = false;
            NSArray *flSplit = [line componentsSeparatedByString:@": "];
            if (flSplit.count != 2) {
                reader = nil;
                return NULL;
            }
            
            NSString *version = [flSplit[0] stringByReplacingOccurrencesOfString:@"<Version " withString:@""];
            NSString *description = [flSplit[1] stringByReplacingOccurrencesOfString:@">" withString:@""];
            vList = [[VerseList alloc] initWithVersion:version description:description];
            
        }
        else {
            NSArray *split = [line componentsSeparatedByString:@">"];
            if (split.count < 1 || split.count > 2) {
                reader = nil;
                return NULL;
            }
            
            if ([split[0] hasPrefix:@"<Verse"]) {
                // Is verse
                Reference *r = [[Reference alloc] initWithBook:currentBook
                                                       chapter:currentChapter
                                                         verse:[[split[0] stringByReplacingOccurrencesOfString:@"<Verse " withString:@""] intValue]];
                Verse *v = [[Verse alloc] initWithReference:r
                                                       text:[split[1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
                [vList addObject:v];
            }
            else if ([split[0] hasPrefix:@"<Chapter"]) {
                // Starts new chapter
                //NSString *tmp = [split[0] stringByReplacingOccurrencesOfString:@"<" withString:@""];
                currentChapter = [[split[0] stringByReplacingOccurrencesOfString:@"<Chapter " withString:@""] intValue];
            }
            else if ([split[0] hasPrefix:@"<Book"]) {
                // Starts new book
                NSString *bookAbbrv = [[[split[0] componentsSeparatedByString:@","] firstObject] stringByReplacingOccurrencesOfString:@"" withString:@"<Book "];
                currentBook = [BookOfBible getBookOfBible:bookAbbrv];
            }
        }
    }
    reader = nil;
    return vList;
}

-(NSString*)filepathForFilename:(NSString*)filename {
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *fullPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:filename];
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:[[filename componentsSeparatedByString:@"."] firstObject] ofType:[[filename componentsSeparatedByString:@"."] lastObject]];
    return fullPath;
}

@end
