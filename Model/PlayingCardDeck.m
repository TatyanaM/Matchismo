//
//  PlayingCardDeck.m
//  Matchino
//
//  Created by Mudryak on 09.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

//массив игральных карт, который содержит все 52 игровые комбинации (то есть колода карт в игре)
@implementation PlayingCardDeck

//переписываем метод init. он вызывается всегда, когда создается экземпляр PlayingCardDeck
-(id)init
{
    self = [super init];
    if (self)
    {
      //берем каждую рубашку и ранг, создаем карту и добавляем в колоду (Deck)
             for (NSString *suit in [PlayingCard validSuits])
             {
                 for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++)
                 {
                     PlayingCard *card = [[PlayingCard alloc] init];
                     card.rank = rank;
                     card.suit = suit;
                     [self addCard:card atTop:YES];
                 }
             }
    }
    return  self;
}

@end
