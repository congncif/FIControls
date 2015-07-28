//
//  FISegmentSlider.h
//  CustomControls
//
//  Created by NGUYEN CHI CONG on 7/21/15.
//  Copyright (c) 2015 NGUYEN CHI CONG. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FISelectionButton.h"

@class FISegmentSlider;
typedef void (^ValueChangedHandler)(FISegmentSlider *segment);

IB_DESIGNABLE

@interface FISegmentSlider : UIControl

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic) IBInspectable CGFloat bordeRoundRadius;
@property (nonatomic) IBInspectable CGFloat itemSpace;

@property (nonatomic) IBInspectable NSInteger currentSelectedIndex;

@property (nonatomic) IBInspectable NSInteger lowIndex;
@property (nonatomic) IBInspectable NSInteger highIndex;
@property (nonatomic) IBInspectable BOOL autoSeparator;

@property (nonatomic, strong) IBInspectable UIColor *emptyColor;

@property (nonatomic, strong) IBInspectable UIColor *lowColor;
@property (nonatomic, strong) IBInspectable UIColor *mediumColor;
@property (nonatomic, strong) IBInspectable UIColor *highColor;

@property (nonatomic, strong) IBInspectable UIFont *font;
@property (nonatomic, strong) IBInspectable UIColor *titleColor;
@property (nonatomic, strong) IBInspectable UIColor *highlightTitleColor;

@property (nonatomic, copy) ValueChangedHandler valueChangedHandler;

@end
