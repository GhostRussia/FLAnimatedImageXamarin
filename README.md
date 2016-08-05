FLAnimatedImage is a performant animated GIF engine for iOS:

- Plays multiple GIFs simultaneously with a playback speed comparable to desktop browsers
- Honors variable frame delays
- Behaves gracefully under memory pressure
- Eliminates delays or blocking during the first playback loop
- Interprets the frame delays of fast GIFs the same way modern browsers do

More info: https://github.com/Flipboard/FLAnimatedImage

## Building

Checking out:
```
git clone https://github.com/GhostRussia/FLAnimatedImageXamarin.git
cd FLAnimatedImageXamarin
git submodule init
git submodule update
```

Build:
```
make all
```

## Installation & Usage

FLAnimatedImage is a well encapsulated drop-in component. Simply replace your `UIImageView` instances with instances of `FLAnimatedImageView` to get animated GIF support. There is no central cache or state to manage.
Import `FLAnimatedImageXamarin.dll`, create an image from an animated GIF, and setup the image view to display it:

```csharp
FLAnimatedImage image = FLAnimatedImage.AnimatedImageWithGIFData(NSData.FromUrl(NSUrl.FromString("https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif")));
FLAnimatedImageView imageView = new FLAnimatedImageView();
imageView.AnimatedImage = image;
imageView.Frame = new CGRect(0.0, 0.0, 100.0, 100.0);
View.Add(imageView);
```

It is capable of fine-grained logging. A block can be set on FLAnimatedImage that's invoked when logging occurs with various log levels via the +setLogBlock:logLevel: method. For example:

```csharp
// Set up FLAnimatedImage logging.
FLAnimatedImage.SetLogBlock((NSString logString, FLLogLevel logLevel) => {
    Debug.WriteLine(logString);
}, FLLogLevel.Verbose);
```
Since FLAnimatedImage and FLAnimatedImageXamarin is licensed under MIT, it's compatible with the terms of using it for any app on the App Store.
