//
//  FISelectionButton.m
//  CustomControls
//
//  Created by NGUYEN CHI CONG on 7/21/15.
//  Copyright (c) 2015 NGUYEN CHI CONG. All rights reserved.
//

#import "FISelectionButton.h"

@implementation FISelectionButton

- (void)refreshDisplay {
	if (self.selected) {
		self.backgroundColor = self.selectedColor;
	}else{
		self.backgroundColor = self.normalColor;
	}
}

- (void)setSelected:(BOOL)selected {
	[super setSelected:selected];
	[self refreshDisplay];
}

- (void)setNormalColor:(UIColor *)normalColor {
	_normalColor = normalColor;
	[self refreshDisplay];
}

- (void)setSelectedColor:(UIColor *)selectedColor {
	_selectedColor = selectedColor;
	[self refreshDisplay];
}

@end
