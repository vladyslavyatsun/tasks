//
//  CHAbook.m
//  task2
//
//  Created by Владислав Яцун on 7/5/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHABook.h"

@interface CHABook()
{
    @private
    NSString *_idBook;
    CHAPerson *_owner;
    NSString *_name;
    bookType _type;
    NSInteger _year;
}
@end

@implementation CHABook


-(instancetype)init{
    self = [self initWithName:nil Year:-1 Type:3 IdBook:nil];
    return self;
}

-(instancetype) initWithName:(NSString *)bookName  Year:(NSInteger)bookYear Type:(bookType)typeBook IdBook :(NSString *) idBook Owner :(CHAPerson *)owner{
    self = [super init];
    if(self != nil){
        _name = [bookName copy];
        _year = bookYear;
        _type = typeBook;
        _idBook = [idBook copy];
        _owner = [owner retain];
    }
    return self; 
}

-(instancetype) initWithName:(NSString *)bookName  Year:(NSInteger)bookYear Type:(bookType)typeBook IdBook :(NSString *) idBook{
    self = [self initWithName: bookName Year:bookYear Type:typeBook IdBook:idBook Owner:nil];
    return self;
}


-(instancetype) initWithName:(NSString *)bookName  Year:(NSInteger)bookYear Type:(bookType)typeBook{
    NSString *idBook = [[NSUUID alloc]init].UUIDString;
    self = [self initWithName:bookName Year:bookYear Type: typeBook IdBook:idBook];
    return self;
}


+(CHABook *)createAutoreleseBookName:(NSString *)name Year:(NSInteger)year Type:(bookType)type IdBook:(NSString *)idBook{
    return [[[self alloc]initWithName:name Year:year Type:type IdBook:idBook]autorelease];
}


- (NSString *)getStringTypeDescription{
    NSString  * type = nil;
    switch (self.type) {
        case kCHABookPaperback:
            type = @"paperback";
            break;
        case kCHABookHardcover:
            type = @"hardcover";
            break;
        default:
            type = @"undefined";
    }
    return type;
}


-(NSString *)idBook{
    return _idBook;
}

-(NSString *)name{
    return _name;
}

-(void)setName:(NSString *)name{
    [_name release];
    _name = [name copy];
}

-(void)setOwner:(CHAPerson *)owner{
    _owner = owner;
}

-(CHAPerson *)owner{
    return _owner;
}

-(void)setType:(bookType)type{
    _type = type;
}

-(bookType)type{
    return _type;
}

-(void)setYear:(NSInteger)year{
    _year = year;
}

-(NSInteger)year{
    return _year;
}

-(NSUInteger)hash{
    return ABS(([self.name length]*3
            + self.type
            + self.year * 5
            + [self.idBook length] * 9) - 3);
}


-(BOOL)isEqual:(CHABook *)aBook{
    BOOL result = NO;
    if([aBook isKindOfClass:[CHABook class]]
       && self.hash == aBook.hash
       && [self.idBook isEqual: aBook.idBook]
       && [self.name isEqual:aBook.name]
       && self.type == aBook.type
       && self.year == aBook.year
       && [self.owner isEqual: aBook.owner]){
    result = YES;
    }
    return result;
}

-(NSString *) description{
    return [NSString stringWithFormat: @"\nName : %@\nYear : %ld\nType : %@\nOwner : %@\n", self.name, self.year, [self getStringTypeDescription], self.owner];
}

-(void)dealloc{
    [self.name release];
    [self.owner release];
    [self.idBook release];
    [super dealloc];
}

@end
