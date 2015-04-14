//
//  BookOfBible.m
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import "BookOfBible.h"

@implementation BookOfBible

// static variables
static NSArray *theBookNames = nil;
static NSDictionary *theBookAbbrvs = nil;
static NSDictionary *theBookObjects = nil;

+(void)initStaticVariables {
    // dispatches only once
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theBookNames = @[@"Genesis",
                         @"Exodus",
                         @"Leviticus",
                         @"Numbers",
                         @"Deuteronomy",
                         @"Joshua",
                         @"Judges",
                         @"Ruth",
                         @"1 Samuel",
                         @"2 Samuel",
                         @"1 Kings",
                         @"2 Kings",
                         @"1 Chronicles",
                         @"2 Chronicles",
                         @"Ezra",
                         @"Nehemiah",
                         @"Esther",
                         @"Job",
                         @"Psalms",
                         @"Proverbs",
                         @"Ecclesiastes",
                         @"Song of Solomon",
                         @"Isaiah",
                         @"Jeremiah",
                         @"Lamentations",
                         @"Ezekiel",
                         @"Daniel",
                         @"Hosea",
                         @"Joel",
                         @"Amos",
                         @"Obadiah",
                         @"Jonah",
                         @"Micah",
                         @"Nahum",
                         @"Habakkuk",
                         @"Zephaniah",
                         @"Haggai",
                         @"Zechariah",
                         @"Malachi",
                         @"Matthew",
                         @"Mark",
                         @"Luke",
                         @"John",
                         @"Acts",
                         @"Romans",
                         @"1 Corinthians",
                         @"2 Corinthians",
                         @"Galatians",
                         @"Ephesians",
                         @"Philippians",
                         @"Colossians",
                         @"1 Thessalonians",
                         @"2 Thessalonians",
                         @"1 Timothy",
                         @"2 Timothy",
                         @"Titus",
                         @"Philemon",
                         @"Hebrews",
                         @"James",
                         @"1 Peter",
                         @"2 Peter",
                         @"1 John",
                         @"2 John",
                         @"3 John",
                         @"Jude",
                         @"Revelation"
                         ];
        theBookObjects = @{
                           [NSNumber numberWithInt:Genesis]:[[BookOfBible alloc] initWithBook:Genesis],
                           [NSNumber numberWithInt:Exodus]:[[BookOfBible alloc] initWithBook:Exodus],
                           [NSNumber numberWithInt:Leviticus]:[[BookOfBible alloc] initWithBook:Leviticus],
                           [NSNumber numberWithInt:Numbers]:[[BookOfBible alloc] initWithBook:Numbers],
                           [NSNumber numberWithInt:Deuteronomy]:[[BookOfBible alloc] initWithBook:Deuteronomy],
                           [NSNumber numberWithInt:Joshua]:[[BookOfBible alloc] initWithBook:Joshua],
                           [NSNumber numberWithInt:Judges]:[[BookOfBible alloc] initWithBook:Judges],
                           [NSNumber numberWithInt:Ruth]:[[BookOfBible alloc] initWithBook:Ruth],
                           [NSNumber numberWithInt:Samuel1]:[[BookOfBible alloc] initWithBook:Samuel1],
                           [NSNumber numberWithInt:Samuel2]:[[BookOfBible alloc] initWithBook:Samuel2],
                           [NSNumber numberWithInt:Kings1]:[[BookOfBible alloc] initWithBook:Kings1],
                           [NSNumber numberWithInt:Kings2]:[[BookOfBible alloc] initWithBook:Kings2],
                           [NSNumber numberWithInt:Chronicles1]:[[BookOfBible alloc] initWithBook:Chronicles1],
                           [NSNumber numberWithInt:Chronicles2]:[[BookOfBible alloc] initWithBook:Chronicles2],
                           [NSNumber numberWithInt:Ezra]:[[BookOfBible alloc] initWithBook:Ezra],
                           [NSNumber numberWithInt:Nehemiah]:[[BookOfBible alloc] initWithBook:Nehemiah],
                           [NSNumber numberWithInt:Esther]:[[BookOfBible alloc] initWithBook:Esther],
                           [NSNumber numberWithInt:Job]:[[BookOfBible alloc] initWithBook:Job],
                           [NSNumber numberWithInt:Psalms]:[[BookOfBible alloc] initWithBook:Psalms],
                           [NSNumber numberWithInt:Proverbs]:[[BookOfBible alloc] initWithBook:Proverbs],
                           [NSNumber numberWithInt:Ecclesiastes]:[[BookOfBible alloc] initWithBook:Ecclesiastes],
                           [NSNumber numberWithInt:SongOfSolomon]:[[BookOfBible alloc] initWithBook:SongOfSolomon],
                           [NSNumber numberWithInt:Isaiah]:[[BookOfBible alloc] initWithBook:Isaiah],
                           [NSNumber numberWithInt:Jeremiah]:[[BookOfBible alloc] initWithBook:Jeremiah],
                           [NSNumber numberWithInt:Lamentations]:[[BookOfBible alloc] initWithBook:Lamentations],
                           [NSNumber numberWithInt:Ezekiel]:[[BookOfBible alloc] initWithBook:Ezekiel],
                           [NSNumber numberWithInt:Daniel]:[[BookOfBible alloc] initWithBook:Daniel],
                           [NSNumber numberWithInt:Hosea]:[[BookOfBible alloc] initWithBook:Hosea],
                           [NSNumber numberWithInt:Joel]:[[BookOfBible alloc] initWithBook:Joel],
                           [NSNumber numberWithInt:Amos]:[[BookOfBible alloc] initWithBook:Amos],
                           [NSNumber numberWithInt:Obadiah]:[[BookOfBible alloc] initWithBook:Obadiah],
                           [NSNumber numberWithInt:Jonah]:[[BookOfBible alloc] initWithBook:Jonah],
                           [NSNumber numberWithInt:Micah]:[[BookOfBible alloc] initWithBook:Micah],
                           [NSNumber numberWithInt:Nahum]:[[BookOfBible alloc] initWithBook:Nahum],
                           [NSNumber numberWithInt:Habakkuk]:[[BookOfBible alloc] initWithBook:Habakkuk],
                           [NSNumber numberWithInt:Zephaniah]:[[BookOfBible alloc] initWithBook:Zephaniah],
                           [NSNumber numberWithInt:Haggai]:[[BookOfBible alloc] initWithBook:Haggai],
                           [NSNumber numberWithInt:Zechariah]:[[BookOfBible alloc] initWithBook:Zechariah],
                           [NSNumber numberWithInt:Malachi]:[[BookOfBible alloc] initWithBook:Malachi],
                           [NSNumber numberWithInt:Matthew]:[[BookOfBible alloc] initWithBook:Matthew],
                           [NSNumber numberWithInt:Mark]:[[BookOfBible alloc] initWithBook:Mark],
                           [NSNumber numberWithInt:Luke]:[[BookOfBible alloc] initWithBook:Luke],
                           [NSNumber numberWithInt:John]:[[BookOfBible alloc] initWithBook:John],
                           [NSNumber numberWithInt:Acts]:[[BookOfBible alloc] initWithBook:Acts],
                           [NSNumber numberWithInt:Romans]:[[BookOfBible alloc] initWithBook:Romans],
                           [NSNumber numberWithInt:Corinthians1]:[[BookOfBible alloc] initWithBook:Corinthians1],
                           [NSNumber numberWithInt:Corinthians2]:[[BookOfBible alloc] initWithBook:Corinthians2],
                           [NSNumber numberWithInt:Galatians]:[[BookOfBible alloc] initWithBook:Galatians],
                           [NSNumber numberWithInt:Ephesians]:[[BookOfBible alloc] initWithBook:Ephesians],
                           [NSNumber numberWithInt:Philippians]:[[BookOfBible alloc] initWithBook:Philippians],
                           [NSNumber numberWithInt:Colossians]:[[BookOfBible alloc] initWithBook:Colossians],
                           [NSNumber numberWithInt:Thessalonians1]:[[BookOfBible alloc] initWithBook:Thessalonians1],
                           [NSNumber numberWithInt:Thessalonians2]:[[BookOfBible alloc] initWithBook:Thessalonians2],
                           [NSNumber numberWithInt:Timothy1]:[[BookOfBible alloc] initWithBook:Timothy1],
                           [NSNumber numberWithInt:Timothy2]:[[BookOfBible alloc] initWithBook:Timothy2],
                           [NSNumber numberWithInt:Titus]:[[BookOfBible alloc] initWithBook:Titus],
                           [NSNumber numberWithInt:Philemon]:[[BookOfBible alloc] initWithBook:Philemon],
                           [NSNumber numberWithInt:Hebrews]:[[BookOfBible alloc] initWithBook:Hebrews],
                           [NSNumber numberWithInt:James]:[[BookOfBible alloc] initWithBook:James],
                           [NSNumber numberWithInt:Peter1]:[[BookOfBible alloc] initWithBook:Peter1],
                           [NSNumber numberWithInt:Peter2]:[[BookOfBible alloc] initWithBook:Peter2],
                           [NSNumber numberWithInt:John1]:[[BookOfBible alloc] initWithBook:John1],
                           [NSNumber numberWithInt:John2]:[[BookOfBible alloc] initWithBook:John2],
                           [NSNumber numberWithInt:John3]:[[BookOfBible alloc] initWithBook:John3],
                           [NSNumber numberWithInt:Jude]:[[BookOfBible alloc] initWithBook:Jude],
                           [NSNumber numberWithInt:Revelation]:[[BookOfBible alloc] initWithBook:Revelation],
                           [NSNumber numberWithInt:Dummy]:[[BookOfBible alloc] initWithBook:Dummy]
                           };
        theBookAbbrvs = @{
                          @"ge":[theBookObjects objectForKey:[NSNumber numberWithInt:Genesis]],
                          @"gen":[theBookObjects objectForKey:[NSNumber numberWithInt:Genesis]],
                          @"gn":[theBookObjects objectForKey:[NSNumber numberWithInt:Genesis]],
                          @"genesis":[theBookObjects objectForKey:[NSNumber numberWithInt:Genesis]],
                          @"exo":[theBookObjects objectForKey:[NSNumber numberWithInt:Exodus]],
                          @"exodus":[theBookObjects objectForKey:[NSNumber numberWithInt:Exodus]],
                          @"ex":[theBookObjects objectForKey:[NSNumber numberWithInt:Exodus]],
                          @"lev":[theBookObjects objectForKey:[NSNumber numberWithInt:Leviticus]],
                          @"lv":[theBookObjects objectForKey:[NSNumber numberWithInt:Leviticus]],
                          @"leviticus":[theBookObjects objectForKey:[NSNumber numberWithInt:Leviticus]],
                          @"num":[theBookObjects objectForKey:[NSNumber numberWithInt:Numbers]],
                          @"numb":[theBookObjects objectForKey:[NSNumber numberWithInt:Numbers]],
                          @"nm":[theBookObjects objectForKey:[NSNumber numberWithInt:Numbers]],
                          @"numbers":[theBookObjects objectForKey:[NSNumber numberWithInt:Numbers]],
                          @"dt":[theBookObjects objectForKey:[NSNumber numberWithInt:Deuteronomy]],
                          @"deu":[theBookObjects objectForKey:[NSNumber numberWithInt:Deuteronomy]],
                          @"deut":[theBookObjects objectForKey:[NSNumber numberWithInt:Deuteronomy]],
                          @"deuteronomy":[theBookObjects objectForKey:[NSNumber numberWithInt:Deuteronomy]],
                          @"josh":[theBookObjects objectForKey:[NSNumber numberWithInt:Joshua]],
                          @"jos":[theBookObjects objectForKey:[NSNumber numberWithInt:Joshua]],
                          @"joshua":[theBookObjects objectForKey:[NSNumber numberWithInt:Joshua]],
                          @"jdgs":[theBookObjects objectForKey:[NSNumber numberWithInt:Judges]],
                          @"jgs":[theBookObjects objectForKey:[NSNumber numberWithInt:Judges]],
                          @"judges":[theBookObjects objectForKey:[NSNumber numberWithInt:Judges]],
                          @"ru":[theBookObjects objectForKey:[NSNumber numberWithInt:Ruth]],
                          @"ruth":[theBookObjects objectForKey:[NSNumber numberWithInt:Ruth]],
                          @"1sm":[theBookObjects objectForKey:[NSNumber numberWithInt:Samuel1]],
                          @"1samuel":[theBookObjects objectForKey:[NSNumber numberWithInt:Samuel1]],
                          @"2sm":[theBookObjects objectForKey:[NSNumber numberWithInt:Samuel2]],
                          @"2samuel":[theBookObjects objectForKey:[NSNumber numberWithInt:Samuel2]],
                          @"1ki":[theBookObjects objectForKey:[NSNumber numberWithInt:Kings1]],
                          @"1kings":[theBookObjects objectForKey:[NSNumber numberWithInt:Kings1]],
                          @"1kgs":[theBookObjects objectForKey:[NSNumber numberWithInt:Kings1]],
                          @"2ki":[theBookObjects objectForKey:[NSNumber numberWithInt:Kings2]],
                          @"2kgs":[theBookObjects objectForKey:[NSNumber numberWithInt:Kings2]],
                          @"2kings":[theBookObjects objectForKey:[NSNumber numberWithInt:Kings2]],
                          @"1chr":[theBookObjects objectForKey:[NSNumber numberWithInt:Chronicles1]],
                          @"1chronicles":[theBookObjects objectForKey:[NSNumber numberWithInt:Chronicles1]],
                          @"2chr":[theBookObjects objectForKey:[NSNumber numberWithInt:Chronicles2]],
                          @"2chronicles":[theBookObjects objectForKey:[NSNumber numberWithInt:Chronicles2]],
                          @"ezra":[theBookObjects objectForKey:[NSNumber numberWithInt:Ezra]],
                          @"ezr":[theBookObjects objectForKey:[NSNumber numberWithInt:Ezra]],
                          @"nehemiah":[theBookObjects objectForKey:[NSNumber numberWithInt:Nehemiah]],
                          @"neh":[theBookObjects objectForKey:[NSNumber numberWithInt:Nehemiah]],
                          @"est":[theBookObjects objectForKey:[NSNumber numberWithInt:Esther]],
                          @"esther":[theBookObjects objectForKey:[NSNumber numberWithInt:Esther]],
                          @"job":[theBookObjects objectForKey:[NSNumber numberWithInt:Job]],
                          @"jb":[theBookObjects objectForKey:[NSNumber numberWithInt:Job]],
                          @"psa":[theBookObjects objectForKey:[NSNumber numberWithInt:Psalms]],
                          @"ps":[theBookObjects objectForKey:[NSNumber numberWithInt:Psalms]],
                          @"psalms":[theBookObjects objectForKey:[NSNumber numberWithInt:Psalms]],
                          @"psalm":[theBookObjects objectForKey:[NSNumber numberWithInt:Psalms]],
                          @"prv":[theBookObjects objectForKey:[NSNumber numberWithInt:Proverbs]],
                          @"proverbs":[theBookObjects objectForKey:[NSNumber numberWithInt:Proverbs]],
                          @"eccl":[theBookObjects objectForKey:[NSNumber numberWithInt:Ecclesiastes]],
                          @"ecclesiastes":[theBookObjects objectForKey:[NSNumber numberWithInt:Ecclesiastes]],
                          @"ssol":[theBookObjects objectForKey:[NSNumber numberWithInt:SongOfSolomon]],
                          @"sg":[theBookObjects objectForKey:[NSNumber numberWithInt:SongOfSolomon]],
                          @"sos":[theBookObjects objectForKey:[NSNumber numberWithInt:SongOfSolomon]],
                          @"songofsolomon":[theBookObjects objectForKey:[NSNumber numberWithInt:SongOfSolomon]],
                          @"songofsongs":[theBookObjects objectForKey:[NSNumber numberWithInt:SongOfSolomon]],
                          @"isa":[theBookObjects objectForKey:[NSNumber numberWithInt:Isaiah]],
                          @"is":[theBookObjects objectForKey:[NSNumber numberWithInt:Isaiah]],
                          @"isaiah":[theBookObjects objectForKey:[NSNumber numberWithInt:Isaiah]],
                          @"jer":[theBookObjects objectForKey:[NSNumber numberWithInt:Jeremiah]],
                          @"jeremiah":[theBookObjects objectForKey:[NSNumber numberWithInt:Jeremiah]],
                          @"lam":[theBookObjects objectForKey:[NSNumber numberWithInt:Lamentations]],
                          @"lamentations":[theBookObjects objectForKey:[NSNumber numberWithInt:Lamentations]],
                          @"eze":[theBookObjects objectForKey:[NSNumber numberWithInt:Ezekiel]],
                          @"ez":[theBookObjects objectForKey:[NSNumber numberWithInt:Ezekiel]],
                          @"ezekiel":[theBookObjects objectForKey:[NSNumber numberWithInt:Ezekiel]],
                          @"dan":[theBookObjects objectForKey:[NSNumber numberWithInt:Daniel]],
                          @"dn":[theBookObjects objectForKey:[NSNumber numberWithInt:Daniel]],
                          @"daniel":[theBookObjects objectForKey:[NSNumber numberWithInt:Daniel]],
                          @"hos":[theBookObjects objectForKey:[NSNumber numberWithInt:Hosea]],
                          @"hosea":[theBookObjects objectForKey:[NSNumber numberWithInt:Hosea]],
                          @"joel":[theBookObjects objectForKey:[NSNumber numberWithInt:Joel]],
                          @"jl":[theBookObjects objectForKey:[NSNumber numberWithInt:Joel]],
                          @"amos":[theBookObjects objectForKey:[NSNumber numberWithInt:Amos]],
                          @"am":[theBookObjects objectForKey:[NSNumber numberWithInt:Amos]],
                          @"obad":[theBookObjects objectForKey:[NSNumber numberWithInt:Obadiah]],
                          @"obadiah":[theBookObjects objectForKey:[NSNumber numberWithInt:Obadiah]],
                          @"ob":[theBookObjects objectForKey:[NSNumber numberWithInt:Obadiah]],
                          @"jonah":[theBookObjects objectForKey:[NSNumber numberWithInt:Jonah]],
                          @"jon":[theBookObjects objectForKey:[NSNumber numberWithInt:Jonah]],
                          @"mic":[theBookObjects objectForKey:[NSNumber numberWithInt:Micah]],
                          @"mi":[theBookObjects objectForKey:[NSNumber numberWithInt:Micah]],
                          @"micah":[theBookObjects objectForKey:[NSNumber numberWithInt:Micah]],
                          @"nahum":[theBookObjects objectForKey:[NSNumber numberWithInt:Nahum]],
                          @"na":[theBookObjects objectForKey:[NSNumber numberWithInt:Nahum]],
                          @"hab":[theBookObjects objectForKey:[NSNumber numberWithInt:Habakkuk]],
                          @"hb":[theBookObjects objectForKey:[NSNumber numberWithInt:Habakkuk]],
                          @"habakkuk":[theBookObjects objectForKey:[NSNumber numberWithInt:Habakkuk]],
                          @"zep":[theBookObjects objectForKey:[NSNumber numberWithInt:Zephaniah]],
                          @"zephaniah":[theBookObjects objectForKey:[NSNumber numberWithInt:Zephaniah]],
                          @"hag":[theBookObjects objectForKey:[NSNumber numberWithInt:Haggai]],
                          @"haggai":[theBookObjects objectForKey:[NSNumber numberWithInt:Haggai]],
                          @"zec":[theBookObjects objectForKey:[NSNumber numberWithInt:Zechariah]],
                          @"zechariah":[theBookObjects objectForKey:[NSNumber numberWithInt:Zechariah]],
                          @"hag":[theBookObjects objectForKey:[NSNumber numberWithInt:Haggai]],
                          @"hg":[theBookObjects objectForKey:[NSNumber numberWithInt:Haggai]],
                          @"zec":[theBookObjects objectForKey:[NSNumber numberWithInt:Zechariah]],
                          @"mal":[theBookObjects objectForKey:[NSNumber numberWithInt:Malachi]],
                          @"malachi":[theBookObjects objectForKey:[NSNumber numberWithInt:Malachi]],
                          @"mat":[theBookObjects objectForKey:[NSNumber numberWithInt:Matthew]],
                          @"mt":[theBookObjects objectForKey:[NSNumber numberWithInt:Matthew]],
                          @"matthew":[theBookObjects objectForKey:[NSNumber numberWithInt:Matthew]],
                          @"mark":[theBookObjects objectForKey:[NSNumber numberWithInt:Mark]],
                          @"mk":[theBookObjects objectForKey:[NSNumber numberWithInt:Mark]],
                          @"luke":[theBookObjects objectForKey:[NSNumber numberWithInt:Luke]],
                          @"lk":[theBookObjects objectForKey:[NSNumber numberWithInt:Luke]],
                          @"john":[theBookObjects objectForKey:[NSNumber numberWithInt:John]],
                          @"jn":[theBookObjects objectForKey:[NSNumber numberWithInt:John]],
                          @"acts":[theBookObjects objectForKey:[NSNumber numberWithInt:Acts]],
                          @"rom":[theBookObjects objectForKey:[NSNumber numberWithInt:Romans]],
                          @"romans":[theBookObjects objectForKey:[NSNumber numberWithInt:Romans]],
                          @"1cor":[theBookObjects objectForKey:[NSNumber numberWithInt:Corinthians1]],
                          @"1corinthians":[theBookObjects objectForKey:[NSNumber numberWithInt:Corinthians1]],
                          @"2cor":[theBookObjects objectForKey:[NSNumber numberWithInt:Corinthians2]],
                          @"2corinthians":[theBookObjects objectForKey:[NSNumber numberWithInt:Corinthians2]],
                          @"gal":[theBookObjects objectForKey:[NSNumber numberWithInt:Galatians]],
                          @"galatians":[theBookObjects objectForKey:[NSNumber numberWithInt:Galatians]],
                          @"eph":[theBookObjects objectForKey:[NSNumber numberWithInt:Ephesians]],
                          @"ephesians":[theBookObjects objectForKey:[NSNumber numberWithInt:Ephesians]],
                          @"phi":[theBookObjects objectForKey:[NSNumber numberWithInt:Philippians]],
                          @"philippians":[theBookObjects objectForKey:[NSNumber numberWithInt:Philippians]],
                          @"phil":[theBookObjects objectForKey:[NSNumber numberWithInt:Philippians]],
                          @"col":[theBookObjects objectForKey:[NSNumber numberWithInt:Colossians]],
                          @"colossians":[theBookObjects objectForKey:[NSNumber numberWithInt:Colossians]],
                          @"1th":[theBookObjects objectForKey:[NSNumber numberWithInt:Thessalonians1]],
                          @"1thessalonians":[theBookObjects objectForKey:[NSNumber numberWithInt:Thessalonians1]],
                          @"1thes":[theBookObjects objectForKey:[NSNumber numberWithInt:Thessalonians1]],
                          @"2th":[theBookObjects objectForKey:[NSNumber numberWithInt:Thessalonians2]],
                          @"2thes":[theBookObjects objectForKey:[NSNumber numberWithInt:Thessalonians2]],
                          @"2thessalonians":[theBookObjects objectForKey:[NSNumber numberWithInt:Thessalonians2]],
                          @"1timothy":[theBookObjects objectForKey:[NSNumber numberWithInt:Timothy1]],
                          @"1tm":[theBookObjects objectForKey:[NSNumber numberWithInt:Timothy1]],
                          @"1tim":[theBookObjects objectForKey:[NSNumber numberWithInt:Timothy1]],
                          @"2tim":[theBookObjects objectForKey:[NSNumber numberWithInt:Timothy2]],
                          @"2tm":[theBookObjects objectForKey:[NSNumber numberWithInt:Timothy2]],
                          @"2timothy":[theBookObjects objectForKey:[NSNumber numberWithInt:Timothy2]],
                          @"titus":[theBookObjects objectForKey:[NSNumber numberWithInt:Titus]],
                          @"ti":[theBookObjects objectForKey:[NSNumber numberWithInt:Titus]],
                          @"phmn":[theBookObjects objectForKey:[NSNumber numberWithInt:Philemon]],
                          @"phlm":[theBookObjects objectForKey:[NSNumber numberWithInt:Philemon]],
                          @"philemon":[theBookObjects objectForKey:[NSNumber numberWithInt:Philemon]],
                          @"heb":[theBookObjects objectForKey:[NSNumber numberWithInt:Hebrews]],
                          @"hebrews":[theBookObjects objectForKey:[NSNumber numberWithInt:Hebrews]],
                          @"jas":[theBookObjects objectForKey:[NSNumber numberWithInt:James]],
                          @"james":[theBookObjects objectForKey:[NSNumber numberWithInt:James]],
                          @"1pet":[theBookObjects objectForKey:[NSNumber numberWithInt:Peter1]],
                          @"1pt":[theBookObjects objectForKey:[NSNumber numberWithInt:Peter1]],
                          @"1peter":[theBookObjects objectForKey:[NSNumber numberWithInt:Peter1]],
                          @"2pet":[theBookObjects objectForKey:[NSNumber numberWithInt:Peter2]],
                          @"2pt":[theBookObjects objectForKey:[NSNumber numberWithInt:Peter2]],
                          @"2peter":[theBookObjects objectForKey:[NSNumber numberWithInt:Peter2]],
                          @"1jn":[theBookObjects objectForKey:[NSNumber numberWithInt:John1]],
                          @"1john":[theBookObjects objectForKey:[NSNumber numberWithInt:John1]],
                          @"2jn":[theBookObjects objectForKey:[NSNumber numberWithInt:John2]],
                          @"2john":[theBookObjects objectForKey:[NSNumber numberWithInt:John2]],
                          @"3jn":[theBookObjects objectForKey:[NSNumber numberWithInt:John3]],
                          @"3john":[theBookObjects objectForKey:[NSNumber numberWithInt:John3]],
                          @"jude":[theBookObjects objectForKey:[NSNumber numberWithInt:Jude]],
                          @"rev":[theBookObjects objectForKey:[NSNumber numberWithInt:Revelation]],
                          @"rv":[theBookObjects objectForKey:[NSNumber numberWithInt:Revelation]],
                          @"revelation":[theBookObjects objectForKey:[NSNumber numberWithInt:Revelation]]
                          };
    });
}

-(instancetype)initWithBook:(Book)myBook {
    self = [super init];
    if (self) {
        book = myBook;
        title = [BookOfBible toString:myBook];
    }
    return self;
}

-(instancetype)initWithBookAbbrv:(NSString*)myBook {
    self = [BookOfBible getBookOfBible:myBook];
    if (!self) NSAssert(self, @"Init with book abbrv init not working");
    return self;
}

-(Book)getBook {
    return book;
}

-(NSString *)getTitle {
    return title;
}

-(BookOfBible*)getNextBook {
    return [theBookObjects objectForKey:[NSNumber numberWithInt:book+1]];;
}

+(BookOfBible*)getBookOfBible:(NSString*)abbrv {
    return [theBookAbbrvs objectForKey:[abbrv lowercaseString]];
}

+(NSArray *)getBookNames {
    return [theBookNames copy];
}

+(NSString *)toString:(Book)book {
    switch (book) {
        case Genesis:
            return @"Genesis";
            break;
        case Exodus:
            return @"Exodus";
            break;
        case Leviticus:
            return @"Leviticus";
            break;
        case Numbers:
            return @"Numbers";
            break;
        case Deuteronomy:
            return @"Deuteronomy";
            break;
        case Joshua:
            return @"Joshua";
            break;
        case Judges:
            return @"Judges";
            break;
        case Ruth:
            return @"Ruth";
            break;
        case Samuel1:
            return @"1 Samuel";
            break;
        case Samuel2:
            return @"2 Samuel";
            break;
        case Kings1:
            return @"1 Kings";
            break;
        case Kings2:
            return @"2 Kings";
            break;
        case Chronicles1:
            return @"1 Chronicles";
            break;
        case Chronicles2:
            return @"2 Chronicles";
            break;
        case Ezra:
            return @"Ezra";
            break;
        case Nehemiah:
            return @"Nehemiah";
            break;
        case Esther:
            return @"Esther";
            break;
        case Job:
            return @"Job";
            break;
        case Psalms:
            return @"Psalms";
            break;
        case Proverbs:
            return @"Proverbs";
            break;
        case Ecclesiastes:
            return @"Ecclesiastes";
            break;
        case SongOfSolomon:
            return @"Song of Solomon";
            break;
        case Isaiah:
            return @"Isaiah";
            break;
        case Jeremiah:
            return @"Jeremiah";
            break;
        case Lamentations:
            return @"Lamentations";
            break;
        case Ezekiel:
            return @"Ezekiel";
            break;
        case Daniel:
            return @"Daniel";
            break;
        case Hosea:
            return @"Hosea";
            break;
        case Joel:
            return @"Joel";
            break;
        case Amos:
            return @"Amos";
            break;
        case Obadiah:
            return @"Obadiah";
            break;
        case Jonah:
            return @"Jonah";
            break;
        case Micah:
            return @"Micah";
            break;
        case Nahum:
            return @"Nahum";
            break;
        case Habakkuk:
            return @"Habakkuk";
            break;
        case Zephaniah:
            return @"Zephaniah";
            break;
        case Haggai:
            return @"Haggai";
            break;
        case Zechariah:
            return @"Zechariah";
            break;
        case Malachi:
            return @"Malachi";
            break;
        case Matthew:
            return @"Matthew";
            break;
        case Mark:
            return @"Mark";
            break;
        case Luke:
            return @"Luke";
            break;
        case John:
            return @"John";
            break;
        case Acts:
            return @"Acts";
            break;
        case Romans:
            return @"Romans";
            break;
        case Corinthians1:
            return @"1 Corinthians";
            break;
        case Corinthians2:
            return @"2 Corinthians";
            break;
        case Galatians:
            return @"Galatians";
            break;
        case Ephesians:
            return @"Ephesians";
            break;
        case Philippians:
            return @"Philippians";
            break;
        case Colossians:
            return @"Colossians";
            break;
        case Thessalonians1:
            return @"1 Thessalonians";
            break;
        case Thessalonians2:
            return @"2 Thessalonians";
            break;
        case Timothy1:
            return @"1 Timothy";
            break;
        case Timothy2:
            return @"2 Timothy";
            break;
        case Titus:
            return @"Titus";
            break;
        case Philemon:
            return @"Philemon";
            break;
        case Hebrews:
            return @"Hebrews";
            break;
        case James:
            return @"James";
            break;
        case Peter1:
            return @"1 Peter";
            break;
        case Peter2:
            return @"2 Peter";
            break;
        case John1:
            return @"1 John";
            break;
        case John2:
            return @"2 John";
            break;
        case John3:
            return @"3 John";
            break;
        case Jude:
            return @"Jude";
            break;
        case Revelation:
            return @"Revelation";
            break;
        case Dummy:
            return @"Dummy";
            break;
            
        default:
            break;
    }
    return @"";
}
@end
