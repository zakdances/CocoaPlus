CocoaPlus
=========

Jazzersized subclasses and categories for modern, ReactiveCocoa-powered iOS apps.

This project is very much a **work in progress**. It's reccomended to use this library with [MALazyKit](https://github.com/marlonandrade/malazykit) for easy instantiation.

This library is my attempt to create a few additions to classes such as more convient syntax or properties that speed up custom drawing and animation. Examples:


###### pathUI property of CAShapeLayerPlus
```
CAShapeLayerPlus *shapeLayer = [CAShapeLayerPlus layer];

//-------------------------------------------------------
// CAShapeLayerPlus has a special property to store UIBezierPath instances so you don't have to recreate that
// instance on every redraw of a custom layer. If you're doing animation which rapibly causes -setNeedsDisplay
// on a layer, then this should speed up drawing in theory. Feel free to speed test it.
//-------------------------------------------------------

shapeLayer.pathUI = myBezierPath;
shapeLayer.path = myBezierPath.CGPath;
```

*Contributions, pull requests, reccomendations, bug reports etc. welcome.