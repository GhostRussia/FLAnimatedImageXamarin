XBUILD=/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild
MONOBUILD=/Library/Frameworks/Mono.framework/Commands/xbuild
PROJECT_ROOT=./FLAnimatedImageXamarin
NATIVEPROJECT=$(PROJECT_ROOT)/FLAnimatedImageXamarin.xcodeproj
MONOPROJECT=$(PROJECT_ROOT)/FLAnimatedImageXamarin.csproj
TARGET=FLAnimatedImageXamarin
BUILDDIR=./build

all: _create_build_dir lib$(TARGET).dll
	
_create_build_dir:
	mkdir -p $(BUILDDIR)/native
	
lib$(TARGET)-i386.a:
	$(XBUILD) -project $(NATIVEPROJECT) -target $(TARGET) -sdk iphonesimulator -configuration Release clean build
	-mv $(PROJECT_ROOT)/build/Release-iphonesimulator/lib$(TARGET).a $(BUILDDIR)/native/$@

lib$(TARGET)-armv7.a:
	$(XBUILD) -project $(NATIVEPROJECT) -target $(TARGET) -sdk iphoneos -arch armv7 -configuration Release clean build
	-mv $(PROJECT_ROOT)/build/Release-iphoneos/lib$(TARGET).a $(BUILDDIR)/native/$@

lib$(TARGET)-arm64.a:
	$(XBUILD) -project $(NATIVEPROJECT) -target $(TARGET) -sdk iphoneos -arch arm64 -configuration Release clean build
	-mv $(PROJECT_ROOT)/build/Release-iphoneos/lib$(TARGET).a $(BUILDDIR)/native/$@

lib$(TARGET)SDK.a: lib$(TARGET)-i386.a lib$(TARGET)-armv7.a lib$(TARGET)-arm64.a
	xcrun -sdk iphoneos lipo -create -output $(BUILDDIR)/native/$@ $(BUILDDIR)/native/lib$(TARGET)-i386.a $(BUILDDIR)/native/lib$(TARGET)-armv7.a $(BUILDDIR)/native/lib$(TARGET)-arm64.a

lib$(TARGET).dll: lib$(TARGET)SDK.a
	$(MONOBUILD) $(MONOPROJECT)

clean:
	-rm -rf $(BUILDDIR)/*
	-rm -rf $(PROJECT_ROOT)/build $(PROJECT_ROOT)/obj