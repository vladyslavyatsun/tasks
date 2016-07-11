//
//  CHAperson.m
//  task2
//
//  Created by Владислав Яцун on 7/6/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHAPerson.h"

@interface CHAPerson()
{
    NSString *_personFirstName;
    NSString *_personLastName;
    NSInteger _personYear;
    
}
    @property NSMutableArray *mPersonBooks;
    @property(readwrite, retain, nonatomic) NSString *fullName;

@end

@implementation CHAPerson

//Реализовать инициализатор c возможностью задать вышеописанные свойства;
-(instancetype)initPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear{
    self = [self initPersonWithFirstName:personFirstName PersonLastName:personLastName PersonYear:personYear personBooks:nil];
    return self;
}

-(instancetype)initPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear personBooks :(NSArray *)personBooks{
    self = [super init];
    if(self != nil){
        self.mPersonBooks = [NSMutableArray new];
        _personFirstName = [personFirstName copy];
        _personLastName = [personLastName copy];
        _personYear = personYear;
        
        [self.mPersonBooks addObjectsFromArray:personBooks];
    }

    return self;
}
//Создаем фабричный метод класса, который будет принимать имя, фамилию, год рождения;
+(instancetype)createPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear{
    return [[[CHAPerson alloc]initPersonWithFirstName:personFirstName PersonLastName:personLastName PersonYear:personYear] autorelease];
}



-(BOOL)takeBook: (CHABook *)aBook{
    BOOL result = NO;
    if(aBook != nil
       && aBook.owner == nil
       && ![self.personBooks containsObject:aBook]){
        [self.mPersonBooks addObject: aBook];
        [aBook setOwner:self];
        result = YES;
    }
    return result;
}


-(BOOL)returnCurrentBook:(CHABook *)aBook{
    BOOL result = NO;
    if(aBook != nil && [self.personBooks containsObject:aBook]){
        [self.mPersonBooks removeObject:aBook];
        aBook.owner = nil;
        result = YES;
    }
    return result;
}



- (BOOL)containBook:(CHABook *)personBook{
    BOOL result = NO;
    for (CHABook *book in self.personBooks) {
        if([book.idBook isEqual: personBook.idBook]){
            result = YES;
        }
    }
    return result;
}

-(BOOL)isEqualArraysBooks:(NSArray *)personBooks{
    if([self.personBooks count] != [personBooks count]) return NO;
    for (CHABook *personBook in personBooks) {
        if(![self containBook:personBook]){
            return NO;
        }
    }
    return YES;
}


-(void)setPersonFirstName:(NSString *)personFirstName{
    [_personFirstName release];
    _personFirstName = [personFirstName copy];
}

-(NSString *)personFirstName{
    return _personFirstName;
}

-(void)setPersonLastName:(NSString *)personLastName{
    [_personLastName release];
    _personLastName = [personLastName copy];
}

-(NSString *)personLastName{
    return _personLastName;
}

-(void)setPersonYear:(NSInteger)personYear{
    _personYear = personYear;
}

-(NSInteger)personYear{
    return _personYear;
}

-(NSArray *)personBooks{
    return (NSArray *)self.mPersonBooks;
}

-(NSUInteger)hash{
    return ABS(([self.personFirstName length] * 3
                + [self.personLastName length] * 5
                + self.personYear * 7) - 9);
}


//Порівнюємо книги по id
- (BOOL)isEqual:(CHAPerson *)person{
    BOOL result = NO;
    if([person isKindOfClass:[CHAPerson class]]
       && self.hash == person.hash
       && [self.personFirstName isEqual : person.personFirstName]
       && [self.personLastName isEqual : person.personLastName]
       && self.personYear == person.personYear
       && [self isEqualArraysBooks:person.personBooks]) result = YES;
    return result;
}


-(NSString *)fullName{
    if(_fullName == nil){
        return [NSString stringWithFormat: @"%@ %@", self.personFirstName, self.personLastName];
    } else {
        if([[NSString stringWithFormat: @"%@ %@", self.personFirstName, self.personLastName] isEqualToString: self.fullName]){
            [self.fullName release];
            self.fullName = [NSString stringWithFormat: @"%@ %@", self.personFirstName, self.personLastName];
        }
        return [self fullName];
    }
}

//Расширяем описание класса (description), добавив fullName.
-(NSString *)description{
    return [NSString stringWithFormat: @"\nFull Name : %@", self.fullName];
}


//Реализовываем корректный dealloc;
-(void)dealloc{
    [self.personLastName release];
    [self.personFirstName release];
    [self.mPersonBooks release];
    [super dealloc];
}

@end
