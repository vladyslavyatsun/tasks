//
//  CHAperson.m
//  task2
//
//  Created by Владислав Яцун on 7/6/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHAperson.h"

@interface CHAperson()
    @property NSMutableArray *mPersonBooks;
    @property(readwrite, retain, nonatomic) NSString *fullName;
@end

@implementation CHAperson

//{
//    @private
//    NSString *_personFirstName;
//    NSString *_personLastName;
//    NSInteger _personYear;
//}


//-(void) setPersonFirstName:(NSString *)personFirstName{
//    [_personFirstName release];
//    _personFirstName = [personFirstName copy];
//}
//
//-(NSString *) personFirstName{
//    return _personFirstName;
//}
//
//-(void) setPersonLastName:(NSString *)personLastName{
//    [_personLastName release];
//    _personLastName = [personLastName copy];
//}
//-(NSString *) personLastName{
//    return _personLastName;
//}
//-(void) setPersonYear:(NSInteger)personYear{
//    _personYear = personYear;
//}
//-(NSInteger) personYear{
//    return _personYear;
//}

-(NSArray *)personBooks{
    return (NSArray *)self.mPersonBooks;
}

//-(instancetype)init{
//    self = [super init];
//    if(self){
//        _mPersonBooks = [NSMutableArray new];
//    }
//    return self;
//}

//Реализовать инициализатор c возможностью задать вышеописанные свойства;
-(instancetype)initPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear{
    self = [self init];
    if(self != nil){
        _personFirstName = personFirstName;
        _personLastName = personLastName;
        _personYear = personYear;
        _mPersonBooks = [NSMutableArray new];
    }
    return self;
}

//Создаем фабричный метод класса, который будет принимать имя, фамилию, год рождения;
+(instancetype)createPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear{
    return [[[CHAperson alloc]initPersonWithFirstName:personFirstName PersonLastName:personLastName PersonYear:personYear] autorelease];
}

//Реализовываем корректный dealloc;
-(void)dealloc{
    [self.personLastName release];
    [self.personFirstName release];
    [self.mPersonBooks release];
    [super dealloc];
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



-(NSUInteger)hash{
    return ABS(([self.personFirstName length] * 3
                    + [self.personLastName length] * 5
                    + self.personYear * 7) - 9);
}

- (BOOL)isEqual:(CHAperson *)person{
    BOOL result = NO;
    if([person isKindOfClass:[CHAperson class]]
        && self.hash == person.hash
        && [self.personFirstName isEqual : person.personFirstName]
        && [self.personLastName isEqual : person.personLastName]
        && self.personYear == person.personYear
        && [self.personBooks isEqual: person.personBooks]) result = YES;
    return result;
}


-(BOOL)containsArrayBook: (CHAbook *)aBook{
    for(CHAbook *book in self.personBooks){
        if([book isEqual: aBook]) return NO;
    }
    return YES;
}

-(BOOL)takeBook: (CHAbook *)aBook{
    BOOL result = NO;
    if(aBook != nil
       && aBook.owner == nil
       && [self containsArrayBook:aBook]){
        [self.mPersonBooks addObject: aBook];
        result = YES;
    }
    return result;
}

// TODO: create method
-(BOOL)returnCurrentBook:(CHAbook *)aBook{
    BOOL result = NO;
    if(aBook != nil && [self containsArrayBook:aBook]){
        [self.mPersonBooks removeObject:aBook];
        aBook.owner = nil;
        result = YES;
    }
    return result;
}



@end
