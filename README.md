# FIControls
A collection some popular controls with easy usage.<br />
Support Storyboard.

#Installation
Drag files class control in Controls Group in Sample project into your project.

#Usage
Set custom action by callback block:<br />
Example: <br />
self.slider2.valueChangedHandler =^(FISegmentSlider *slider){
	NSLog(@"Value Changed: %ld", (long)slider.currentSelectedIndex);
};

#
![Alt text](https://s3.amazonaws.com/cocoacontrols_production/uploads/control_image/image/7137/iOS_Simulator_Screen_Shot_Jul_28__2015__5.21.29_PM.png "FIControls")
