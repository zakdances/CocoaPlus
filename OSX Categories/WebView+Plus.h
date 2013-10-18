//
//  WebView+Plus.h
//  Pods
//
//  Created by Zak.
//
//

#import <WebKit/WebKit.h>

@interface WebView (Plus)

@property (weak) DOMHTMLElement		*headTag;
@property (weak) DOMHTMLElement		*bodyTag;
@property (weak,readonly) NSString	*outerHTML;

- (DOMHTMLElement *)newTag:(NSString *)tagName attributes:(NSDictionary *)attributes innerHTML:(NSString *)innerHTML;

- (DOMHTMLElement *)newTag:(NSString *)tagName tagID:(NSString *)tagID classes:(NSArray *)classes innerHTML:(NSString *)innerHTML;

- (DOMHTMLElement *)newTag:(NSString *)tagName tagID:(NSString *)tagID classes:(NSArray *)classes otherAttributes:(NSDictionary *)otherAttributes innerHTML:(NSString *)innerHTML;

- (DOMHTMLElement *)newTitleTag:(NSString *)innerHTML;

- (DOMHTMLElement *)newLinkStylesheetTag:(NSString *)href;

- (DOMHTMLElement *)newScriptTag:(NSString *)src;

+ (WebViewPlus *)dummyWebViewWithBlankPage;

+ (WebViewPlus *)dummyWebViewWithTitle:(NSString *)title stylesheets:(NSArray *)stylesheets scripts:(NSArray *)scripts;

@end
