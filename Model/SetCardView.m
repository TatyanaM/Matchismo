//
//  SetCardView.m
//  Matchino
//
//  Created by Mudryak on 09.10.13.
//  Copyright (c) 2013 Mudryak. All rights reserved.
//

#import "SetCardView.h"

@interface SetCardView ()
@property (nonatomic) CGFloat faceCardScaleFactor;

@end

@implementation SetCardView

-(UIColor *)convertColor
{
    UIColor *color = [[UIColor alloc] init];
    if (self.color == 1) color = [UIColor greenColor];
    if (self.color == 2) color = [UIColor redColor];
    if (self.color == 3) color = [UIColor blueColor];
    return color;
}

-(CGFloat)convertShadding
{
    CGFloat shaddingValue = 0.0;
    if (self.shadding == 1) shaddingValue = 0.0;
    if (self.shadding == 2) shaddingValue = 0.3;
    if (self.shadding == 3) shaddingValue = 1;
    return shaddingValue;
}
                                  
#pragma mark Drawing

#define diamand 1
#define oval 2
#define waves 3

#define CORNER_RADIUS 12
#define SCALE_FACTOR 0.9
#define OVAL_SCALE_FACTOR 0.2

-(void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    [roundedRect addClip];
    [[UIColor purpleColor] setStroke];
    [roundedRect stroke];
    if (self.faceUp)
    {
        roundedRect.lineWidth = 5.0;
        [[UIColor purpleColor] setStroke];
        [roundedRect stroke];

    }
    if (self.symbol == diamand) [self drawDiamand];
    if (self.symbol == oval) [self drawOval];
    if (self.symbol == waves) [self drawWave];
}

#define SCALE_X 0.5
#define SCALE_Y 0.17
#define SPACING_SCALE 0.1

-(void)drawOval
{
    //рисуем овал в пропорции 30%
  CGFloat width = self.bounds.size.width * SCALE_X;
  CGFloat height = self.bounds.size.height * SCALE_Y;
  CGFloat spacing = self.bounds.size.height * SPACING_SCALE;

  [[[self convertColor] colorWithAlphaComponent:[self convertShadding]] setFill];
  [[self convertColor] setStroke];
    
  if (self.symbolsCount == 1)
    {
      CGFloat x = (self.bounds.size.width/2) - ((self.bounds.size.width * SCALE_X) / 2);
      CGFloat y = (self.bounds.size.height/2) - ((self.bounds.size.height * SCALE_Y) / 2);
      CGRect ovalRect = CGRectMake(x, y, width , height);
      UIBezierPath *ovalShape = [UIBezierPath bezierPathWithRoundedRect:ovalRect cornerRadius:15];
      //заливаем цветом и штриховкой
      [ovalShape fill];
      [ovalShape stroke];
    }
  if (self.symbolsCount == 2)
    {
       //начало первого овала
      CGFloat point1_x = (self.bounds.size.width/2) - ((self.bounds.size.width * SCALE_X) / 2);
      CGFloat point1_y = (self.bounds.size.height/4) - ((self.bounds.size.height * SCALE_Y) / 2) + spacing;

      //начало второго овала
      CGFloat point2_x = (self.bounds.size.width/2) - ((self.bounds.size.width * SCALE_X) / 2);
      CGFloat point2_y = (self.bounds.size.height/4) + ((self.bounds.size.height * SCALE_Y) / 2) + spacing * 2;
   
      CGRect ovalRect_1 = CGRectMake(point1_x, point1_y, width, height);
      UIBezierPath *ovalShape_1 = [UIBezierPath bezierPathWithRoundedRect:ovalRect_1 cornerRadius:15];

      [ovalShape_1 fill]; [ovalShape_1 stroke];
        
      CGRect ovalRect_2 = CGRectMake(point2_x, point2_y, width , height);
      UIBezierPath *ovalShape_2 = [UIBezierPath bezierPathWithRoundedRect:ovalRect_2 cornerRadius:15];

      [ovalShape_2 fill]; [ovalShape_2 stroke];
        
    }
    if (self.symbolsCount == 3)
    {
        //начало первого овала
        CGFloat point1_x = (self.bounds.size.width/2) - ((self.bounds.size.width * SCALE_X) / 2);
        CGFloat point1_y = (self.bounds.size.height/4) - ((self.bounds.size.height * SCALE_Y) / 2);
        
        //начало второго овала
        CGFloat point2_x = (self.bounds.size.width/2) - ((self.bounds.size.width * SCALE_X) / 2);
        CGFloat point2_y = (self.bounds.size.height/2) - ((self.bounds.size.height * SCALE_Y) / 2);

        //начало третьего овала
        CGFloat point3_x = (self.bounds.size.width/2) - ((self.bounds.size.width * SCALE_X) / 2);
        CGFloat point3_y = (self.bounds.size.height/6) + ((self.bounds.size.height * SCALE_Y) / 2) + spacing * 4;

        CGRect ovalRect_1 = CGRectMake(point1_x, point1_y, width , height);
        UIBezierPath *ovalShape_1 = [UIBezierPath bezierPathWithRoundedRect:ovalRect_1 cornerRadius:15];

        [ovalShape_1 fill]; [ovalShape_1 stroke];
        
        CGRect ovalRect_2 = CGRectMake(point2_x, point2_y, width , height);
        UIBezierPath *ovalShape_2 = [UIBezierPath bezierPathWithRoundedRect:ovalRect_2 cornerRadius:15];

        [ovalShape_2 fill]; [ovalShape_2 stroke];
        
        CGRect ovalRect_3 = CGRectMake(point3_x, point3_y, width, height);
        UIBezierPath *ovalShape_3 = [UIBezierPath bezierPathWithRoundedRect:ovalRect_3 cornerRadius:15];
        
        [ovalShape_3 fill]; [ovalShape_3 stroke];
    }

}

#define DIAMAND_SCALE_FACTOR 0.2

-(void)drawDiamand
{
    CGPoint center = CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2);
    CGFloat side = self.bounds.size.width * DIAMAND_SCALE_FACTOR;
    CGFloat spacing = self.bounds.size.height * SPACING_SCALE;
 
    [[[self convertColor] colorWithAlphaComponent:[self convertShadding]] setFill];
    [[self convertColor] setStroke];
    if (self.symbolsCount == 1)
    {
     [self drawDiamandAtPoint:center withSide:side];
    } else if (self.symbolsCount == 2)
    {
     CGPoint point1 = CGPointMake(center.x, center.y - side/2 - spacing);
     [self drawDiamandAtPoint:point1 withSide:side];
     CGPoint point2 = CGPointMake(center.x, center.y + side/2 + spacing);
     [self drawDiamandAtPoint:point2 withSide:side];
    } else if (self.symbolsCount == 3)
    {
      CGPoint point1 = CGPointMake(center.x, center.y - side - spacing);
      [self drawDiamandAtPoint:point1 withSide:side];
      [self drawDiamandAtPoint:center withSide:side];
      CGPoint point3 = CGPointMake(center.x, center.y + side  + spacing);
      [self drawDiamandAtPoint:point3 withSide:side];
    }
    
}

-(void)drawDiamandAtPoint:(CGPoint)point withSide:(CGFloat)side
{
    UIBezierPath *diamandShape = [[UIBezierPath alloc] init];
    [diamandShape moveToPoint:CGPointMake(point.x, point.y - side/2)];
    [diamandShape addLineToPoint:CGPointMake(point.x + side, point.y)];
    [diamandShape addLineToPoint:CGPointMake(point.x, point.y + side/2)];
    [diamandShape addLineToPoint:CGPointMake(point.x - side, point.y)];
    [diamandShape closePath];
    //заливаем цветом и штриховкой
    [diamandShape fill];
    [diamandShape stroke];
}

#define WAVE_SCALE_FACTOR 0.45

-(void)drawWave
{
    CGPoint center = CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2) ;
    CGFloat length = (self.bounds.size.width * WAVE_SCALE_FACTOR)/2;
    CGFloat widht = (self.bounds.size.width * WAVE_SCALE_FACTOR)/2.5;
    CGFloat spacing = self.bounds.size.height * SPACING_SCALE;
    [[[self convertColor] colorWithAlphaComponent:[self convertShadding]] setFill];
    [[self convertColor] setStroke];
    
    if (self.symbolsCount == 1)
    {
      CGPoint point1 = CGPointMake(center.x, center.y + spacing);
      [self drawWaveAtPoint:point1  withLength:length andWidht:widht];
    } else if (self.symbolsCount == 2)
    {
      CGPoint point1 = CGPointMake(center.x, center.y - widht/2);
      [self drawWaveAtPoint:point1 withLength:length andWidht:widht];
      CGPoint point2 = CGPointMake(center.x, center.y + widht/2 + spacing);
      [self drawWaveAtPoint:point2 withLength:length andWidht:widht];
    } else if (self.symbolsCount == 3)
    {
      CGPoint point1 = CGPointMake(center.x, center.y - widht);
      [self drawWaveAtPoint:point1 withLength:length andWidht:widht];
      CGPoint point2 = CGPointMake(center.x, center.y + spacing);
      [self drawWaveAtPoint:point2 withLength:length andWidht:widht];
      CGPoint point3 = CGPointMake(center.x, center.y + widht + spacing*2);
      [self drawWaveAtPoint:point3 withLength:length andWidht:widht];
 
    }
}

-(void)drawWaveAtPoint:(CGPoint)point withLength:(CGFloat)length andWidht:(CGFloat)widht
{
    UIBezierPath *waveShape = [[UIBezierPath alloc] init];
    
    [waveShape moveToPoint:CGPointMake(point.x - length, point.y)];
    [waveShape addCurveToPoint:CGPointMake(point.x + length, point.y - widht)
                 controlPoint1:CGPointMake(point.x - widht, point.y - widht*2)
                 controlPoint2:CGPointMake(point.x + widht/2, point.y)];
    
    [waveShape addQuadCurveToPoint:CGPointMake(point.x + widht/2, point.y)
                      controlPoint:CGPointMake(point.x + length, point.y)];
   
    [waveShape addCurveToPoint:CGPointMake(point.x - length, point.y)
                 controlPoint1:CGPointMake(point.x - widht/2, point.y)
                 controlPoint2:CGPointMake(point.x - widht/2, point.y - widht/2)];
    
    [waveShape fill];
    [waveShape stroke];
}

#pragma mark Setters and Getters

@synthesize faceCardScaleFactor = _faceCardScaleFactor;

#define DEFAULT_FACE_CARD_SCALE_FACTOR 0.90

-(CGFloat)faceCardScaleFactor
{
    if (!_faceCardScaleFactor) _faceCardScaleFactor = DEFAULT_FACE_CARD_SCALE_FACTOR;
    return _faceCardScaleFactor;
}

-(void)setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor
{
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}


-(void)setSymbol:(NSUInteger)symbol
{
    _symbol = symbol;
    [self setNeedsDisplay];
}

-(void)setSymbolsCount:(NSUInteger)symbolsCount
{
    _symbolsCount = symbolsCount;
    [self setNeedsDisplay];
}

-(void)setColor:(NSUInteger)color
{
    _color = color;
    [self setNeedsDisplay];
}

-(void)setShadding:(NSUInteger)shadding
{
    _shadding = shadding;
    [self setNeedsDisplay];
}

-(void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}



@end
