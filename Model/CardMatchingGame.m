//
//  CardMatchingGame.m
//  Matchino
//
//  Created by Mudryak on 11.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"
#import "SetCard.h"

@interface CardMatchingGame()
//здесь то же свойство приватное, не только для чтения
@property (readwrite, nonatomic) int score;
@property (readwrite, nonatomic) int scoreChange;

@end

@implementation CardMatchingGame

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1


-(void)flipCardAtIndex:(NSUInteger)index
{
 Card *card = [self cardAtIndex:index];

 //карты совпали
 if ((self.flippedCards.count == self.numCardsToMatch) && (self.scoreChange > 0))
     [self.flippedCards removeAllObjects];
    
 //карты не совпали
 if ((self.flippedCards.count == self.numCardsToMatch) && (self.scoreChange < 0))
 {
     NSRange range = NSMakeRange(0, self.flippedCards.count-1);
     [self.flippedCards removeObjectsInRange:range];
 }
    
    if (card.isFaceUp) [self.flippedCards removeObject:card];
    
 if (!card.isUnplayable)
    {
     if (!card.isFaceUp)
      {
       self.flippMessage = [NSString stringWithFormat:@" flipped."];
       if (self.flippedCards.count == self.numCardsToMatch-1)
         {
          int matchScore = [card match:self.flippedCards];
          if (matchScore)
           {
            for (Card *flippedCard in self.flippedCards)
              {
               flippedCard.unplayable = YES;
               if ([flippedCard isKindOfClass:[SetCard class]]) [self.cards removeObjectsInArray:self.flippedCards];
              }
             card.unplayable = YES;
             if ([card isKindOfClass:[SetCard class]]) [self.cards removeObject:card];
             self.numCardsToPlay -= self.numCardsToMatch;
             self.score += matchScore * MATCH_BONUS;
             self.scoreChange = matchScore * MATCH_BONUS;
             self.flippMessage = [NSString stringWithFormat:@"matched for %d score!", matchScore];
            } else
            {
             for (Card *flippedCard in self.flippedCards) flippedCard.faceUp = NO;
             self.score -= MISMATCH_PENALTY;
             self.scoreChange = -MISMATCH_PENALTY;
             self.flippMessage = [NSString stringWithFormat:@"Cards are mismatched!"];
            }
          }
      }
      if (!card.isFaceUp) [self.flippedCards addObject:card];
      card.faceUp = !card.faceUp;
    }
}


-(id)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
    
}

-(BOOL)addThreeCards
{
    for (int i = 0; i < 3; i++)
    {
      Card *card = [self.currentDeck drawRandomCard];
      if (card)
          [self.cards addObject:card];
      else return NO;
    }
    self.numCardsToPlay += 3;
    return YES;
}


//инициализатор должен вернуть count карт в колоду deck (массив card)
-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck cardToMatch:(NSUInteger)num
{
    self = [super init];
    
    if (self)
    {
       for (int i = 0; i < count; i++)
        {
           id card = [deck drawRandomCard];
            //если count окажется больше, чем карт в колоде (в cards), то мы не сможем сгенерировать очередную карту
            //в таком случае нужно вернуть nil
                if (card) {
                self.cards[i] = card;
                } else {
                self = nil;
                }
            
        }
        self.currentDeck = deck;
        self.numCardsToMatch = num;
        self.numCardsToPlay = count;
    }
    return  self;
}



-(NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(NSMutableArray *)flippedCards
{
    if (!_flippedCards) _flippedCards = [[NSMutableArray alloc] init];
    return _flippedCards;
}


@end
