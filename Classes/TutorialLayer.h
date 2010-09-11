//
//  TutorialLayer.h
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCTouchDispatcher.h"

@interface TutorialLayer : CCLayer {
	int slidePosition;
    int backgroundXPosition;
    int backgroundYPosition;
    int descriptionXPosition;
    int descriptionYPosition;
    int descriptionHeight;
    int descriptionWidth;
    int fontSize;
    NSString * fontName;
    NSMutableArray * backgrounds;
    NSMutableArray * descriptions;
    CCSprite * background;
    CCNode * description;
	
	CGPoint startLocation;
	CGPoint endLocation;
}
/*
 
 *  This is the only method for adding slides to the slide show.
 */
-(void)addSlideWithBackground: (NSString *)imageString
               andDescription: (NSString *)descString;
/*
 *  Methods for advancing, retreating, and starting the slideshow.
 *  There currently isn't a UI mechanism for retreating to already
 *  seen slides, but you could rig something up if you tried hard 
 *  enough. ;)
 */
-(void)displayFirstSlide;
-(void)displayNextSlide;
-(void)displayPreviousSlide;
-(void)displaySlide: (int)slideNumber;
-(BOOL)hasPreviousSlide;
-(BOOL)hasNextSlide;

/*
 *  Mutators and Accessors
 */
-(NSMutableArray *)backgrounds;
-(NSMutableArray *)descriptions;
-(CCSprite *)background;
-(void)setBackground: (CCSprite *)aSprite;
-(CCNode *)description;
-(void)setDescription: (CCNode *)aCocosNode;
-(NSString *)fontName;
-(void)setFontName: (NSString *)aFontName;
-(int)fontSize;
-(void)setFontSize: (int)anInt;
-(int)slidePosition;
-(void)setSlidePosition: (int)anInt;
-(int)backgroundXPosition;
-(void)setBackgroundXPosition: (int)anInt;
-(int)backgroundYPosition;
-(void)setBackgroundYPosition: (int)anInt;
-(int)descriptionXPosition;
-(void)setDescriptionXPosition: (int)anInt;
-(int)descriptionYPosition;
-(void)setDescriptionYPosition: (int)anInt;
-(int)descriptionWidth;
-(void)setDescriptionWidth: (int)anInt;
-(int)descriptionHeight;
-(void)setDescriptionHeight: (int)anInt;
@end
