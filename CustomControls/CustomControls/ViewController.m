//
//  ViewController.m
//  CustomControls
//
//  Created by NGUYEN CHI CONG on 7/19/15.
//  Copyright (c) 2015 NGUYEN CHI CONG. All rights reserved.
//

#import "ViewController.h"

#import "FIBorderTextField.h"
#import "FISegmentSlider.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet FIBorderTextField *txtCustom;
@property (weak, nonatomic) IBOutlet FIBorderTextField *txtCustom1;
@property (weak, nonatomic) IBOutlet FIBorderTextField *txtCustom2;

@property (weak, nonatomic) IBOutlet FISegmentSlider *slider1;
@property (weak, nonatomic) IBOutlet FISegmentSlider *slider2;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    /**
     *
     *  Custom Action for field
     *
     **/
	self.txtCustom.action = self.txtCustom1.action = self.txtCustom2.action = ^(FIBorderTextField* field){
		switch (field.type) {
		case FIBorderFieldTypeInfo:
		{
			NSLog(@"View Info");
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"View Information" message:@"Information detail" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
			[alert show];
		}
		break;
		case FIBorderFieldTypeOption: {
			NSLog(@"Select a option");

			UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select a option" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Option 1",@"Option 2", nil];
			[actionSheet showInView:self.view];

		} break;

		default: {
			NSLog(@"Default");
		}
		break;
		}
	};

    /**
     *
     *  Custom action for segment slider
     *
     **/
	self.slider1.valueChangedHandler = self.slider2.valueChangedHandler =^(FISegmentSlider *slider){
		NSLog(@"Value Changed: %ld", (long)slider.currentSelectedIndex);
	};
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
