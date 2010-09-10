//
//  Manager.m
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import "Manager.h"

static Manager *sharedInstance = nil;

@implementation Manager

//@synthesize selected_card, cardHint_no;
@synthesize King_isSelected;

+ (Manager *)sharedInstance {
	
	@synchronized(self) {
		if (sharedInstance == nil) {
			sharedInstance = [[Manager alloc] init];
		}
	}
	return sharedInstance;
}

- (id) init {
	if( (self=[super init] )) {
		
		[self resetGameValue];
		
	}
	return self;
}
-(void)resetGameValue {
	
	selected_card = 0;
	cardHint_no = 0;
	King_isSelected = FALSE;
}

// get set method
-(int)selected_card {
	return selected_card;
}
-(void)setSelected_card:(int)number {
	selected_card += number;
}
-(int)cardHint_no {
	return cardHint_no;
}
-(void)setCardHint_no:(int)number {
	cardHint_no = number;
	NSLog(@"card hint number = %i", cardHint_no);
}

// util method

- (NSString *)cardHint_filename {
	if (cardHint_no == 1) { return @"set1.png"; }
	else if (cardHint_no == 2) { return @"set2.png"; }
	else if (cardHint_no == 3) { return @"set3.png"; }
	else if (cardHint_no == 4) { return @"set4.png"; }
	else {
		return @"set1.png";
	}
	
}

- (NSString *)selected_card_filename {

	return [NSString stringWithFormat:@"%i.png",selected_card];
}

- (void) print_selected_card {
	
	NSLog(@"selected_card = %i", [self selected_card]);
	
}
- (void)dealloc {
	
	[super dealloc];
	
}
@end
