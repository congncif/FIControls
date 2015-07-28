//
//  FISegmentSlider.m
//  CustomControls
//
//  Created by NGUYEN CHI CONG on 7/21/15.
//  Copyright (c) 2015 NGUYEN CHI CONG. All rights reserved.
//

#import "FISegmentSlider.h"

@implementation FISegmentSlider {
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self initComponents];

	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self initComponents];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self initComponents];
	}
	return self;
}

- (void)initComponents {
    
    _emptyColor = [UIColor colorWithRed:239.0f/255 green:239.0f/255 blue:239.0f/255 alpha:1];
    _itemSpace = 1.0f;
    
    _lowColor = [UIColor colorWithRed:200.0f/255 green:50.0f/255 blue:50.0f/255 alpha:1];
    _mediumColor = [UIColor colorWithRed:247.0f/255 green:141.0f/255 blue:0.0f/255 alpha:1];
    _highColor = [UIColor colorWithRed:60.0f/255 green:186.0f/255 blue:0.0f/255 alpha:1];
    
    _font = [UIFont systemFontOfSize:14];
    
    _titleColor = [UIColor colorWithRed:150.0f/255 green:150/255.0f blue:150/255.0f alpha:1];
    _highlightTitleColor = [UIColor whiteColor];

    _autoSeparator = YES;
    _currentSelectedIndex = 0;
    _lowIndex = _highIndex = 0;
    
    self.titles = @[@"DK", @"0", @"1", @"2", @"3", @"4", @"5"];
    self.bordeRoundRadius = 2;
    
}

- (void)awakeFromNib {
	[self refreshDisplay];
}

- (void)dealloc{
    self.valueChangedHandler = nil;
}

/**-----------------------------------------------------------------**/
#pragma mark - Functions

- (void)refreshDisplay {

	NSAssert(_titles != nil, @"titles not set");
	NSAssert(_titles.count > 2, @"titles must have 3 items at least");

	//
	[self layout];
}

- (FISelectionButton *)itemAtIndex: (NSInteger)index {
	FISelectionButton *button;
	if (index < self.subviews.count) {
		button = [self.subviews objectAtIndex:index];
	}else{
		button = [FISelectionButton buttonWithType:UIButtonTypeCustom];
		[button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:button];
	}

	button.titleLabel.font = self.font;
	button.tag = index;
	button.normalColor = self.emptyColor;

	NSString *title = [self.titles objectAtIndex:index];
	[button setTitle:title forState:UIControlStateNormal];

	return button;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	[self layout];
}

- (void)layout {
	if (self.titles.count < self.subviews.count) {
		for(NSInteger idx = self.titles.count; idx < self.subviews.count; idx++) {
			FISelectionButton *button = [self.subviews objectAtIndex:idx];
			[button removeFromSuperview];
		}
	}

	CGFloat totalSpace = (self.titles.count - 1) * self.itemSpace;
	CGFloat widthItem = (self.frame.size.width - totalSpace) / (CGFloat)self.titles.count;

	[self.titles enumerateObjectsUsingBlock:^(NSString * title, NSUInteger idx, BOOL *stop) {
	         FISelectionButton *aButton = [self itemAtIndex:idx];
	         CGRect frameButton = CGRectZero;
	         frameButton.size.width = widthItem;
	         frameButton.size.height = self.frame.size.height;
	         frameButton.origin.y = 0;
	         frameButton.origin.x = idx * (widthItem + self.itemSpace);
	         [aButton setFrame:frameButton];

	         aButton.selectedColor = [self colorWithCurrentIndex:_currentSelectedIndex];
	         if (aButton.tag <= _currentSelectedIndex) {
	                 [aButton setSelected:YES];
	                 [aButton setTitleColor:self.highlightTitleColor forState:UIControlStateNormal];
		 }else{
	                 [aButton setSelected:NO];
	                 [aButton setTitleColor:self.titleColor forState:UIControlStateNormal];
		 }
	 }];
}

- (UIColor*)colorWithCurrentIndex: (NSInteger)index {

	UIColor *_currentColor;

	if (index < _lowIndex) {
		_currentColor = self.lowColor;
	}else if (index < _highIndex) {
		_currentColor = self.mediumColor;
	}else{
		_currentColor = self.highColor;
	}

	return _currentColor;
}

/**-----------------------------------------------------------------**/
#pragma mark - Override

- (void)setTitles:(NSArray *)titles {
	_titles = titles;
	if (_autoSeparator) {
		_lowIndex = titles.count/3;
		_highIndex = titles.count/3 * 2;
	}else{
		if (_lowIndex <= 0) {
			_lowIndex = titles.count/3;
		}
		if (_highIndex <= 0) {
			_highIndex = titles.count/3 * 2;
		}
	}
	[self refreshDisplay];
}

- (void)setBordeRoundRadius:(CGFloat)bordeRoundRadius {
	_bordeRoundRadius = bordeRoundRadius;
	self.layer.cornerRadius = bordeRoundRadius;
	self.layer.masksToBounds = YES;
}

- (void)setEmptyColor:(UIColor *)emptyColor {
	_emptyColor = emptyColor;
	[self refreshDisplay];
}

- (void)setLowColor:(UIColor *)lowColor {
	_lowColor = lowColor;
	[self refreshDisplay];
}

- (void)setMediumColor:(UIColor *)mediumColor {
	_mediumColor = mediumColor;
	[self refreshDisplay];
}

- (void)setHighColor:(UIColor *)highColor {
	_highColor = highColor;
	[self refreshDisplay];
}

- (void)setItemSpace:(CGFloat)itemSpace {
	_itemSpace = itemSpace;
	[self refreshDisplay];
}

- (void)setCurrentSelectedIndex:(NSInteger)currentSelectedIndex {
	_currentSelectedIndex = currentSelectedIndex;
	[self refreshDisplay];
}

- (void)setFont:(UIFont *)font {
	_font = font;
	[self refreshDisplay];
}

- (void)setTitleColor:(UIColor *)titleColor {
	_titleColor = titleColor;
	[self refreshDisplay];
}

- (void)setLowIndex:(NSInteger)lowIndex{
    _lowIndex = lowIndex;
    [self refreshDisplay];
}

- (void)setHighIndex:(NSInteger)highIndex{
    _highIndex = highIndex;
    [self refreshDisplay];
}

/**-----------------------------------------------------------------**/
#pragma mark - Actions
- (void)buttonTapped:(FISelectionButton *)sender {
	NSInteger index = sender.tag;
	self.currentSelectedIndex = index;
    
    if (self.valueChangedHandler) {
        self.valueChangedHandler(self);
    }
}

@end
