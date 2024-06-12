## Gen Project
gen:
	xcodegen
	pod install

## Install Pods
pod:
	pod install

## Open Project
start:
	open TemplateApp.xcworkspace

## Clean DerivedData
clean:
	rm -rf ~/Library/Developer/Xcode/DerivedData/*
