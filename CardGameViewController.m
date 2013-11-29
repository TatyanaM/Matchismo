//
//  CardGameViewController.m
//  Matchino
//
//  Created by Mudryak on 08.09.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "CardGameViewController.h"
#import "GameResult.h"

@interface CardGameViewController () <UICollectionViewDataSource>
@property (strong, nonatomic) GameResult *gameResult;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *setGameMode;


@end

@implementation CardGameViewController

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return 0; //abstract
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card];
    return cell;
}

-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card { } //abstract

-(Deck *)createDeck {return  nil;} //abstract

-(CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount
                                                          usingDeck:[self createDeck]
                                                        cardToMatch:self.cardToMatch];

    return _game;
}

-(GameResult *)gameResult
{
    if (!_gameResult) _gameResult = [[GameResult alloc] init];
    return _gameResult;
}

-(void)updateUI {} //abstract

#pragma mark Buttons Action

- (IBAction)gameMode:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) self.game.numCardsToMatch = 2;
    else self.game.numCardsToMatch = 3;
}

- (IBAction)dealGame {
    self.game = nil;
    self.gameResult = nil;
    self.setGameMode.enabled = YES;
    [self.cardCollectionView reloadData];
    [self updateUI];
}

- (IBAction)flipCard:(UITapGestureRecognizer *)gesture
{
    
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    
    //проверяем, что мы кликнули не по пустому месту
    if (indexPath)
    {
     self.setGameMode.enabled = NO;
     [self.game flipCardAtIndex:indexPath.item];
     [self updateUI];
    }
    
    
}


@end
