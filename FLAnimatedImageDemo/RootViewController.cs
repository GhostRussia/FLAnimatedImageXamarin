using System;
using UIKit;
using FLAnimatedImageXamarin;
using Foundation;

namespace FLAnimatedImageDemo {
    public class RootViewController : UIViewController {
        public override void ViewWillAppear(bool animated) {
            base.ViewWillAppear(animated);

            View.BackgroundColor = UIColor.FromWhiteAlpha(0.95f, 1.0f);
            var imageView = new FLAnimatedImageView();
            imageView.ContentMode = UIViewContentMode.ScaleAspectFit;
            imageView.ClipsToBounds = true;

            View.Add(imageView);
            imageView.Frame = new CoreGraphics.CGRect(0.0f, 0.0f, View.Bounds.Size.Width, View.Bounds.Size.Height);

            NSUrl url = NSBundle.MainBundle.GetUrlForResource("rock", "gif");
            NSData data = NSData.FromUrl(url);
            FLAnimatedImage animatedImage = FLAnimatedImage.AnimatedImageWithGIFData(data);
            imageView.AnimatedImage = animatedImage;
        }
    }
}

