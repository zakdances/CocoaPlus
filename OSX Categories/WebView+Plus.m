//
//  WebView+Plus.m
//  Pods
//
//  Created by Zak.
//
//

#import "WebView+Plus.h"

@implementation WebView (Plus)

- (DOMHTMLElement *)newTag:(NSString *)tagName attributes:(NSDictionary *)attributes innerHTML:(NSString *)innerHTML
{
	// Create a new element, with a tag name.
    DOMHTMLElement *newNode = (DOMHTMLElement *)[self.mainFrameDocument createElement:tagName];
	
	for (id key in attributes) {
		[newNode setAttribute:key value:attributes[key]];
	}
	
    // Add the new element to the bodyNode as the last child.
	[newNode setInnerHTML:innerHTML];
	
	return newNode;
}

- (DOMHTMLElement *)newTag:(NSString *)tagName tagID:(NSString *)tagID classes:(NSArray *)classes innerHTML:(NSString *)innerHTML
{
    // Add the new element to the bodyNode as the last child.
    return [self newTag:tagName tagID:tagID classes:classes otherAttributes:nil innerHTML:innerHTML];
}

- (DOMHTMLElement *)newTag:(NSString *)tagName tagID:(NSString *)tagID classes:(NSArray *)classes otherAttributes:(NSDictionary *)otherAttributes innerHTML:(NSString *)innerHTML
{
	NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
	
	if (tagID)
		attributes[@"id"] = tagID;
	
	if (classes)
		attributes[@"class"] = [classes componentsJoinedByString:@" "];
	
	[attributes addEntriesFromDictionary:otherAttributes];
	
    // Add the new element to the bodyNode as the last child.
    return [self newTag:@"div" attributes:attributes innerHTML:innerHTML];;
}

- (DOMHTMLElement *)newTitleTag:(NSString *)innerHTML
{
    // Create a new element, with a tag name.
    return [self newTag:@"title" attributes:nil innerHTML:innerHTML];
}

- (DOMHTMLElement *)newLinkStylesheetTag:(NSString *)href
{
    // Create a new element, with a tag name.
    return [self newTag:@"link" attributes:@{ @"rel": @"stylesheet", @"href": href } innerHTML:nil];
}

- (DOMHTMLElement *)newScriptTag:(NSString *)src
{
    // Add the new element to the bodyNode as the last child.
    return [self newTag:@"script" attributes:@{ @"src": src } innerHTML:nil];;
}




- (DOMHTMLElement *)headTag
{
	return (DOMHTMLElement *)[[self.mainFrameDocument getElementsByTagName:@"head"] item:0];
}

- (void)setHeadTag:(DOMHTMLElement *)headTag
{
	// TODO: check to ensure "head" tagName
}

- (DOMHTMLElement *)bodyTag
{
	return (DOMHTMLElement *)[[self.mainFrameDocument getElementsByTagName:@"body"] item:0];
}

- (void)setBodyTag:(DOMHTMLElement *)bodyTag
{
	// TODO: check to ensure "body" tagName
}

- (NSString *)outerHTML
{
	return [(DOMHTMLElement *)[[self.mainFrame DOMDocument] documentElement] outerHTML];
}

- (void)setOuterHTML:(NSString *)outerHTML
{
	// TODO: check to ensure "html" tagName
}

// TODO: Move this to category
+ (WebView *)dummyWebViewWithBlankPage
{
	WebView *dummy = [[WebView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) frameName:@"dummyWV" groupName:@"dummyWVs"];
	
	dummy.mainFrameURL = @"about:blank";
	
	DOMHTMLHtmlElement *htmlTag = (DOMHTMLHtmlElement *)dummy.mainFrameDocument.documentElement;
	[htmlTag setAttribute:@"lang" value:@"en"];
	
	[dummy setNeedsDisplay:YES];
	// TODO: set doctype somehow
	return dummy;
}

+ (WebView *)dummyWebViewWithTitle:(NSString *)title stylesheets:(NSArray *)stylesheets scripts:(NSArray *)scripts
{
	WebView *dummy = [WebView dummyWebViewWithBlankPage];
	
	for (NSString *stylesheet in stylesheets) {
		
		[dummy.headTag appendChild:[dummy newLinkStylesheetTag:stylesheet]];
	}
	
	for (NSString *script in scripts) {
		
		[dummy.headTag appendChild:[dummy newScriptTag:script]];
	}
	
	[dummy setNeedsDisplay:YES];
	
	return dummy;
}

@end
