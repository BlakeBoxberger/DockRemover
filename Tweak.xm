@interface SBDockView : UIView
@end

@interface SBFloatingDockView : UIView
@end

@interface SBIconListPageControl : UIView
@end

%hook SBRootFolderView

- (NSUInteger)dockEdge {
	return 5;
}

- (CGFloat)dockHeight {
	return 0.0;
}

- (CGFloat)maxDockHeight {
	return 0.0;
}

- (CGRect)effectiveDockFrame {
	return CGRectZero;
}

%end

// Hide the dock on iPhone
%hook SBDockView

- (void)layoutSubviews {
	self.hidden = YES;
}

- (void)setHidden:(BOOL)arg1 {
	%orig(YES);
}

- (BOOL)hidden {
	return YES;
}

%end

// Hide the dock on iPad
%hook SBFloatingDockView

- (void)layoutSubviews {
	self.hidden = YES;
}

- (void)setHidden:(BOOL)arg1 {
	%orig(YES);
}

- (BOOL)hidden {
	return YES;
}

%end

// Hide page control
%hook SBIconListPageControl

- (void)layoutSubviews {
	self.hidden = YES;
}

%end