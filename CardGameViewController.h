//
//  CardGameViewController.h
//  Matchino
//
//  Created by Mudryak on 08.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController

-(Deck *)createDeck; //abstract
-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card; //abstract

@property (nonatomic) NSUInteger startingCardCount; //abstract
@property (nonatomic) NSUInteger cardToMatch;
@property (strong, nonatomic) CardMatchingGame *game;
@end
