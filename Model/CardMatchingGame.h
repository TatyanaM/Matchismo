//
//  CardMatchingGame.h
//  Matchino
//
//  Created by Mudryak on 11.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"
#import "SetCard.h"

@interface CardMatchingGame : NSObject

//свойство для подсчета очков - паблик только для чтения
@property (readonly, nonatomic) int score;
@property (nonatomic) int numCardsToMatch;
@property (nonatomic) int numCardsToPlay;
@property (strong, nonatomic) NSString *flippMessage;
@property (nonatomic) Deck *currentDeck;
@property (strong, nonatomic) NSMutableArray *cards; //of Card
@property (strong, nonatomic) NSMutableArray *flippedCards;


//designated initializer    
-(id)initWithCardCount:(NSUInteger)count
             usingDeck:(Deck *)deck cardToMatch:(NSUInteger)num;
-(void)flipCardAtIndex:(NSUInteger)index;
-(id)cardAtIndex:(NSUInteger)index;
-(BOOL)addThreeCards;

@end
