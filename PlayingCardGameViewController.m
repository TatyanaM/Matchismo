//
//  PlayingCardGameViewControllersViewController.m
//  Matchino
//
//  Created by Mudryak on 08.10.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "PlayingCardCollectionViewCell.h"


@interface PlayingCardGameViewController()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (weak, nonatomic) IBOutlet UIView *flipResultView;


@end
@implementation PlayingCardGameViewController

-(void)updateUI
{
  for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells])
    {
      NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
      Card *card = [self.game cardAtIndex:indexPath.item];
      [self updateCell:cell usingCard:card];
    }
   self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
   [self updateFlipResult];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return self.startingCardCount;
}

#define STARTING_CARDS_COUNT 22
#define CARD_TO_MATCH_COUNT 2

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

-(NSUInteger) startingCardCount
{
    return STARTING_CARDS_COUNT;
}

-(NSUInteger)cardToMatch
{
    return CARD_TO_MATCH_COUNT;
}

-(void)setFlipResultView:(UIView *)flipResultView
{
    _flipResultView = flipResultView;
    [self updateFlipResult];
}

-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
        PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).playingCardView;
        if ([card isKindOfClass:[PlayingCard class]]){
            PlayingCard *playingCard = (PlayingCard *)card;
            playingCardView.rank = playingCard.rank;
            playingCardView.suit = playingCard.suit;
            
            playingCardView.faceUp = playingCard.isFaceUp;
            playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;
        }
    }
        
}

#define FLIP_VIEW_SCALE 0.8
-(void)updateFlipResult
{
 for (UIView *view in self.flipResultView.subviews) [view removeFromSuperview];
 if (self.game.flippedCards.count)
 {
    NSString *cardContens = [[NSString alloc] init];
    UILabel *message = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.flipResultView.bounds.size.width * FLIP_VIEW_SCALE, self.flipResultView.bounds.size.height * FLIP_VIEW_SCALE)];
    for (int i = 0; i < self.game.flippedCards.count; i++)
    {
       cardContens = [cardContens stringByAppendingString:[self.game.flippedCards[i] contens]];
    }
    message.text = [NSString stringWithFormat:@"%@  %@ ", cardContens, self.game.flippMessage];
    [message setAdjustsFontSizeToFitWidth:YES];
    [self.flipResultView addSubview:message];
 }
}




@end















