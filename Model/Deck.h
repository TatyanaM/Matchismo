//
//  Deck.h
//  Matchino
//
//  Created by Mudryak on 09.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

//колода карт
@interface Deck : NSObject

@property (strong, nonatomic) NSMutableArray *cards;
-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(Card *)drawRandomCard;
@end
