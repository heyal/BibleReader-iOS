//
//  BookOfBible.h
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Book) {
    Genesis,Exodus,Leviticus,Numbers,Deuteronomy,Joshua,Judges,Ruth,Samuel1,Samuel2,Kings1,Kings2,Chronicles1,Chronicles2,Ezra,Nehemiah,
    Esther,Job,Psalms,Proverbs,Ecclesiastes,SongOfSolomon,Isaiah,Jeremiah,Lamentations,Ezekiel,Daniel,Hosea,Joel,Amos,Obadiah,Jonah,Micah,
    Nahum,Habakkuk,Zephaniah,Haggai,Zechariah,Malachi,Matthew,Mark,Luke,John,Acts,Romans,Corinthians1,Corinthians2,Galatians,Ephesians,
    Philippians,Colossians,Thessalonians1,Thessalonians2,Timothy1,Timothy2,Titus,Philemon,Hebrews,James,Peter1,Peter2,John1,John2,John3,
    Jude,Revelation,Dummy
};

@interface BookOfBible : NSObject {
    Book book;
    NSString *title;
}
// Must be called before anything else.
+(void)initStaticVariables;

// initializing
-(instancetype)initWithBook:(Book)myBook;
-(instancetype)initWithBookAbbrv:(NSString*)myBook;

// instance methods
-(NSString*)getTitle;
-(Book)getBook;
-(BookOfBible*)getNextBook;

// static methods
+(NSArray*)getBookNames;
+(NSString*)toString:(Book)book;
+(BookOfBible*)getBookOfBible:(NSString*)abbrv;
@end
