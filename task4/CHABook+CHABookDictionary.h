//
//  CHABook+CHABookDictionary.h
//  task4
//
//  Created by Владислав Яцун on 7/10/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import "CHABook.h"

@interface CHABook (CHABookDictionary)
- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary;
- (NSDictionary *)dictionaryRepresentation;
@end
