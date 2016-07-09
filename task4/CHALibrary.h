//
//  CHALibrary.h
//  task4
//
//  Created by Владислав Яцун on 7/9/16.
//  Copyright © 2016 challenger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHAbook.h"
#import "CHAperson.h"

@interface CHALibrary : NSObject
@property(readonly)NSArray *personArray;
@property(readonly)NSArray *bookArray;
@end
