//
//  SetCardGameViewController.m
//  Matchino
//
//  Created by Mudryak on 09.10.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCard.h"
#import "SetCardDeck.h"
#import "SetCardCollectionViewCell.h"
#import "CardMatchingGame.h"
#import "SetCardView.h"
#import "FlipResultView.h"

@interface SetCardGameViewController()
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *moreCardsLabel;
@property (nonatomic) IBOutlet FlipResultView *flipResult;

@end

@implementation SetCardGameViewController

#define STARTING_CARDS_COUNT 12
#define CARD_TO_MATCH_COUNT 3

- (IBAction)moreCards {
    if ([self.game addThreeCards])
    {
        NSMutableArray *paths = [[NSMutableArray alloc] init];
        NSUInteger section = [self.cardCollectionView numberOfSections]-1;
        for (int i = 0; i < 3; i++)
        {
            NSUInteger item = [self.cardCollectionView numberOfItemsInSection:section];
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            [paths addObject:indexPath];
        }
        [self.cardCollectionView insertItemsAtIndexPaths:paths];
        [self.cardCollectionView scrollToItemAtIndexPath:paths[0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    } else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooops!" message:@"No more cards!" delegate:nil cancelButtonTitle:@"ОК" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

-(void)updateUI
{
  [self.cardCollectionView reloadData];
  for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells])
     {
      NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
      Card *card = [self.game cardAtIndex:indexPath.item];
      [self updateCell:cell usingCard:card];
     }
   self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
   self.moreCardsLabel.text = [NSString stringWithFormat:@"Cards in deck: %d", self.game.currentDeck.cards.count + self.game.cards.count];
   [self updateFlipResult];
    
}

#define FLIP_VIEW_WIDTH 40
#define FLIP_VIEW_HEIGHT 50
#define FLIP_VIEW_X 5
#define FLIP_VIEW_SPACE 10

-(void)setFlipResult:(FlipResultView *)flipResult
{
    _flipResult = flipResult;
    [self updateFlipResult];
}

-(void)updateFlipResult
{
 for (UIView *view in self.flipResult.subviews)
  {
   [view removeFromSuperview];
  }
    
  if (self.game.flippedCards.count)
  {
    CGFloat x = FLIP_VIEW_X;
    for (int i = 0; i < self.game.flippedCards.count; i++)
    {
        if (i != 0) x = FLIP_VIEW_X + (FLIP_VIEW_WIDTH + FLIP_VIEW_SPACE) * i;
        SetCardView *cardView = [[SetCardView alloc]
                                 initWithFrame:CGRectMake(x, 0, FLIP_VIEW_WIDTH, FLIP_VIEW_HEIGHT)];
        SetCard *flippedCard = self.game.flippedCards[i];
        cardView.symbol = flippedCard.symbol;
        cardView.symbolsCount = flippedCard.symbolsCount;
        cardView.color = flippedCard.color;
        cardView.shadding = flippedCard.shadding;
        cardView.faceUp = YES;
        cardView.opaque = NO;
        [self.flipResult addSubview:cardView];
     }
     UILabel *message = [[UILabel alloc]
                         initWithFrame:CGRectMake((FLIP_VIEW_WIDTH + FLIP_VIEW_SPACE) * self.game.flippedCards.count, FLIP_VIEW_HEIGHT/2, 100, 25)];
      message.text = self.game.flippMessage;
      [message setAdjustsFontSizeToFitWidth:YES];
      [self.flipResult addSubview:message];
  }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return self.game.numCardsToPlay;
}

-(Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
    
}

-(NSUInteger)startingCardCount
{
    return STARTING_CARDS_COUNT;
}

-(NSUInteger)cardToMatch
{
    return CARD_TO_MATCH_COUNT;
}

-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    if ([cell isKindOfClass:[SetCardCollectionViewCell class]]) {
        SetCardView *setCardView = ((SetCardCollectionViewCell *)cell).setCardView;
        if ([card isKindOfClass:[SetCard class]])
        {
            SetCard *setCard = (SetCard *)card;
            
            setCardView.symbolsCount = setCard.symbolsCount;
            setCardView.symbol = setCard.symbol;
            setCardView.color = setCard.color;
            setCardView.shadding = setCard.shadding;
            
            setCardView.faceUp = setCard.isFaceUp;
            setCardView.alpha = setCard.isUnplayable ? 0.3 : 1.0;
        }
    }
 
}



@end
