//
//  Verse.h
//  BibleReaderApp
//
//  Created by Matt B on 4/13/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Reference,BookOfBible;

@interface Verse : NSObject
@property (nonatomic,readonly) Reference *reference;
@property (nonatomic,readonly) NSString *text;
-(instancetype)initWithReference:(Reference*)ref text:(NSString*)text;
-(instancetype)initWithBook:(BookOfBible*)bookOfBible chapter:(int)chapter verse:(int)verse text:(NSString*)text;

-(BOOL)sameReference:(Verse*)other;
@end
