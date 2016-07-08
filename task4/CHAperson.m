//
//  CHAperson.m
//  task2
//
//  Created by Владислав Яцун on 7/6/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHAperson.h"

@interface CHAperson()
    @property(readwrite, retain) CHAbook *currentBook;
    @property(readwrite, retain, nonatomic) NSString *fullName;
@end

@implementation CHAperson
{
    @private
    NSString *_personFirstName;
    NSString *_personLastName;
    NSInteger _personYear;
}


-(void) setPersonFirstName:(NSString *)personFirstName{
    [_personFirstName release];
    _personFirstName = [personFirstName copy];
}

-(NSString *) personFirstName{
    return _personFirstName;
}

-(void) setPersonLastName:(NSString *)personLastName{
    [_personLastName release];
    _personLastName = [personLastName copy];
}
-(NSString *) personLastName{
    return _personLastName;
}
-(void) setPersonYear:(NSInteger)personYear{
    _personYear = personYear;
}
-(NSInteger) personYear{
    return _personYear;
}

-(instancetype)init{
    self = [super init];
    if(self){
        _personBooks = [NSMutableArray new];
    }
    return self;
}

//Реализовать инициализатор c возможностью задать вышеописанные свойства;
-(instancetype)initPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear{
    self = [self init];
    if(self != nil){
        _personFirstName = personFirstName;
        _personLastName = personLastName;
        _personYear = personYear;
    }
    return self;
}

//Создаем фабричный метод класса, который будет принимать имя, фамилию, год рождения;
+(instancetype)createPersonWithFirstName :(NSString *)personFirstName PersonLastName :(NSString *)personLastName PersonYear :(NSInteger)personYear{
    return [[[CHAperson alloc]initPersonWithFirstName:personFirstName PersonLastName:personLastName PersonYear:personYear] autorelease];
}

//Реализовываем корректный dealloc;
-(void)dealloc{
    [_personLastName release];
    [_personFirstName release];
    [_currentBook release];
    [super dealloc];
}

-(NSString *)fullName{
    if(_fullName == nil){
        return [NSString stringWithFormat: @"%@ %@", self.personFirstName, self.personLastName];
    } else {
        if([NSString stringWithFormat: @"%@ %@", self.personFirstName, self.personLastName] != self.fullName){ // не знаю можно ли так сравнивать строки objective c
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


-(BOOL)takeBook: (CHAbook *)aBook{
    if(self.currentBook == nil && aBook.owner == nil){
        self.currentBook = [aBook retain];
        aBook.owner = self;
        return YES;
    }
    return NO;
}

-(BOOL)returnCurrentBook{
    if(self.currentBook == nil){
        return NO;
    } else{
        self.currentBook.owner = nil;
        self.currentBook = nil;
        return YES;
    }
}



@end
