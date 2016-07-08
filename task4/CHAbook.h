//
//  CHAbook.h
//  task2
//
//  Created by Владислав Яцун on 7/5/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CHAperson;

@interface CHAbook : NSObject

typedef enum
{
    paperback,
    hardcover,
    undefined
} bookType;

@property(readwrite, assign) CHAperson *owner;

-(instancetype) initWithName:(NSString *)bookName  Year:(int)bookYear Type:(bookType)typeBook;

-(NSString *) getName;
-(void) setName:(NSString *) newName;
-(bookType) getType;
-(void) setType:(bookType) newType;
-(int)getYear;
-(void) setYear:(int) newYear;

+(CHAbook *)createAutoreleseBookName:(NSString *)name Year:(int)year Type:(bookType)type;

@end
