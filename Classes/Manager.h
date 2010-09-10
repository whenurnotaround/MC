//
//  Manager.h
//  MC
//
//  Created by Yongpisanpop Papon on 9/10/10.
//  Copyright 2010 NAIST. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Manager : NSObject {
	
	int selected_card;
	int cardHint_no;
	BOOL King_isSelected;

}

//@property (assign, nonatomic) int selected_card, cardHint_no;
@property (assign, nonatomic) BOOL King_isSelected;

+ (Manager *)sharedInstance;

-(void)resetGameValue;
// get set method
-(int)selected_card;
-(void)setSelected_card:(int)number;
-(int)cardHint_no;
-(void)setCardHint_no:(int)number;

// util method
- (NSString *)cardHint_filename;
- (NSString *)selected_card_filename;
- (void)print_selected_card;
@end
