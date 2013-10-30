//
//  WebView+Plus.h
//  Pods
//
//  Created by Zak.
//
//

#import <WebKit/WebKit.h>

@interface WebView (Plus)

@property (weak,readonly) DOMHTMLElement		*htmlTag;
@property (weak,readonly) DOMHTMLElement		*headTag;
@property (weak,readonly) DOMHTMLElement		*bodyTag;
@property (weak,readonly) NSString	*outerHTML;

- (DOMHTMLElement *)newTag:(NSString *)tagName attributes:(NSDictionary *)attributes innerHTML:(NSString *)innerHTML;

- (DOMHTMLElement *)newTag:(NSString *)tagName tagID:(NSString *)tagID classes:(NSArray *)classes innerHTML:(NSString *)innerHTML;

- (DOMHTMLElement *)newTag:(NSString *)tagName tagID:(NSString *)tagID classes:(NSArray *)classes otherAttributes:(NSDictionary *)otherAttributes innerHTML:(NSString *)innerHTML;

- (DOMHTMLElement *)newTitleTag:(NSString *)innerHTML;

- (DOMHTMLElement *)newLinkStylesheetTag:(NSString *)href;

- (DOMHTMLElement *)newScriptTag:(NSString *)src;

- (DOMHTMLElement *)newDivTagWithID:(NSString *)tagID classes:(NSArray *)classes innerHTML:(NSString *)innerHTML;

- (DOMHTMLElement *)newDivTagWithID:(NSString *)tagID classes:(NSArray *)classes otherAttributes:(NSDictionary *)otherAttributes innerHTML:(NSString *)innerHTML;

+ (WebView *)webViewWithBlankPage;

//+ (WebView *)dummyWebViewWithTitle:(NSString *)title stylesheets:(NSArray *)stylesheets scripts:(NSArray *)scripts;

@end
