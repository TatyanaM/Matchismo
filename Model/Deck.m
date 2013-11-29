//
//  Deck.m
//  Matchino
//
//  Created by Mudryak on 09.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "Deck.h"

@interface Deck ()


@end

@implementation Deck

//my own getter (когда мы пытаемся получить массив карт, если его не было раньше - создаем на лету, чтобы не было обращение к nil)
-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return  _cards;
}

-(void)addCard:(id)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
     } else {
        [self.cards addObject:card];
     }
    
}

-(id)drawRandomCard
{
    id randomCard = nil;
    
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}



@end
