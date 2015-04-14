//
//  BibleReaderModel.h
//  BibleReaderApp
//
//  Created by Matt B on 4/14/15.
//  Copyright (c) 2015 Matt Blessed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bible.h"

@interface BibleReaderModel : NSObject {
    NSMutableDictionary *bibles;
}
-(void)addBible:(id<Bible>)bible;
-(id<Bible>)getBible:(NSString*)version;
@end
