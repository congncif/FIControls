# FIControls
A collection some popular controls with easy usage.
Support Storyboard.

#Installation
Drag files class control in Controls Group in Sample project into your project.

#Usage
Set custom action by callback block:
Example: 
self.slider2.valueChangedHandler =^(FISegmentSlider *slider){
	NSLog(@"Value Changed: %ld", (long)slider.currentSelectedIndex);
};
