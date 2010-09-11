//
//  TutorialLayer.m
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import "TutorialLayer.h"


@implementation TutorialLayer
-(id)init {
    self = [super init];
    if (self) {
        /*
         * setting isTouchEnabled is the magic step that
         * allows the layer to be registered for UI events.
         * forgetting this step will lead to great confusion :-/
         */
        isTouchEnabled = YES;
        slidePosition = -1;
        backgrounds = [[NSMutableArray alloc] init];
        descriptions = [[NSMutableArray alloc] init];
        [self setFontName:@"Helvetica"];
        [self setFontSize:24]; 
		
		
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self 
														 priority:0 swallowsTouches:YES];
    }
    return self;
}

- (void) dealloc {
    [backgrounds release];
    backgrounds = nil;
    [descriptions release];
    descriptions = nil;
    [background release];
    background = nil;
    [description release];
    description = nil;
    [fontName release];
    fontName = nil;
    [super dealloc];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	
	CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
    touchLocation = [self convertToNodeSpace:touchLocation];
	
    startLocation = touchLocation;
	
	return YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint touchLocation = [touch locationInView: [touch view]];
	    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
		touchLocation = [self convertToNodeSpace:touchLocation];
	
		endLocation = touchLocation;
	NSLog(@"star - end = %i", startLocation.x - endLocation.x);
		//Compare difference in distance
	    if ((startLocation.x - endLocation.x) > 100 ) {
			// Swipe
			
			if ([self hasNextSlide]) [self displayNextSlide];        
			else [[CCDirector sharedDirector] popScene];
			
	    } else if ((startLocation.x - endLocation.x) < 100 ){
			if ([self hasPreviousSlide]) [self displayPreviousSlide];        
			else [[CCDirector sharedDirector] popScene];
		}
	
		
}

//-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    /*
//     *  We are using pushScene/popScene instead of replaceScene
//     *  (which has superior memory usage characteristics), because
//     *  it makes integrating SlideShowLayer much simpler, and helps
//     *  avoid binding the code to one application without requiring
//     *  us to use the delegate pattern.
//     */
//	
//	//CGPoint touchLocation = [touch locationInView: [touch view]];
////    touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
////    touchLocation = [self convertToNodeSpace:touchLocation];
////	
////    endLocation = touchLocation;
//	
//    // Compare difference in distance
//    if ((startLocation.x - endLocation.x) > 100 ) {
//		// Swipe
//		NSLog(@"Is touched");
//		if ([self hasNextSlide]) [self displayNextSlide];        
//		else [[CCDirector sharedDirector] popScene];
//    }
//
//	
//}

-(void)addSlideWithBackground: (NSString *)imageString
               andDescription: (NSString *)descString {
    [[self backgrounds] addObject:imageString];
    [[self descriptions] addObject:descString];
}

-(void)displayFirstSlide {
    if ([[self backgrounds] count] > 0) {
        [self setSlidePosition:0];
        [self displaySlide:[self slidePosition]];
    }
}

-(void)displayNextSlide {
    if ([self hasNextSlide]) {
        [self setSlidePosition:[self slidePosition]+1];
        [self displaySlide:[self slidePosition]];
    }
}

-(void)displayPreviousSlide {
    if ([self hasPreviousSlide]) {
        [self setSlidePosition:[self slidePosition]-1];
        [self displaySlide:[self slidePosition]];
    }
}

-(void)displaySlide: (int)slideNumber {
    /*
     * Remove existing slide and description.
     */
    if ([self background]) {
        [self removeChild:[self background] cleanup:0];
    }
    if ([self description]) {
        [self removeChild:[self description] cleanup:0];
    }
    
    /*
     * Retrieve and generate necessary details for next slide.
     */
    NSString * bgString = [[self backgrounds] objectAtIndex:slideNumber];
    NSString * descString = [[self descriptions] objectAtIndex:slideNumber];
    CCSprite * bg = [CCSprite spriteWithFile:bgString];
    bg.position = ccp([self backgroundXPosition], [self backgroundYPosition]);
    CCNode * desc = [CCLabel labelWithString:descString
                                   dimensions:CGSizeMake([self descriptionWidth],
                                                         [self descriptionHeight])
                                    alignment:UITextAlignmentCenter
                                     fontName:[self fontName]
                                     fontSize:[self fontSize]];
    desc.position = ccp([self descriptionXPosition], [self descriptionYPosition]);
    
    // Add the background and desc to the layer.
    [self setBackground:bg];
    [self setDescription:desc];
    [self addChild:bg];
    [self addChild:desc];    
}

-(BOOL)hasNextSlide {
    return ([self slidePosition]+1 < [[self backgrounds] count]);
}

-(BOOL)hasPreviousSlide {
    return ([self slidePosition] > 0);
}

-(CCSprite *)background {
    return background;
}
-(void)setBackground: (CCSprite *)aSprite {
    if (background) [background release];
    background = [aSprite retain];
}

-(CCNode *)description {
    return description;
}
-(void)setDescription: (CCNode *)aCocosNode {
    if (description) [description release];
    description = [aCocosNode retain];
}

-(NSMutableArray *)backgrounds {
    return backgrounds;
}

-(NSMutableArray *)descriptions {
    return descriptions;
}

-(NSString *)fontName {
    return fontName;
}

-(int)fontSize {
    return fontSize;
}

-(void)setFontSize: (int)anInt {
    fontSize = anInt;
}

-(void)setFontName: (NSString *)aFontName {
    if (fontName) [fontName release];
    fontName = [aFontName retain];
}

-(int)slidePosition {
    return slidePosition;
}

-(void)setSlidePosition: (int)anInt {
    slidePosition = anInt;
}

-(int)backgroundXPosition {
    return backgroundXPosition;
}

-(void)setBackgroundXPosition: (int)anInt {
    backgroundXPosition = anInt;
}

-(int)backgroundYPosition {
    return backgroundYPosition;
}

-(void)setBackgroundYPosition: (int)anInt {
    backgroundYPosition = anInt;
}

-(int)descriptionXPosition {
    return descriptionXPosition;
}
-(void)setDescriptionXPosition: (int)anInt {
    descriptionXPosition = anInt;
}

-(int)descriptionYPosition {
    return descriptionYPosition;
}

-(void)setDescriptionYPosition: (int)anInt {
    descriptionYPosition = anInt;
}

-(int)descriptionWidth {
    return descriptionWidth;
}

-(void)setDescriptionWidth: (int)anInt {
    descriptionWidth = anInt;
}

-(int)descriptionHeight {
	return descriptionHeight;
}

-(void)setDescriptionHeight: (int)anInt {
    descriptionHeight = anInt;
}

@end
