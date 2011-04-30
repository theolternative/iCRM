@import <Foundation/CPObject.j>

@implementation THRTextField : CPTextField
{
    int     validationMask @accessors;
}

+ (THRTextField) textfieldWithPlaceholder:(CPString)aPlaceholder frame:(CGRectFrame)aFrame validationMask:(int)aMask
{
    var textfield = [[THRTextField alloc] initWithFrame:aFrame];
    if( textfield )
    {
        [textfield setPlaceholderString:aPlaceholder];
        [textfield setEditable:YES];
        textfield.validationMask=aMask;
    }
    return textfield;
}

+ (THRTextField) textfieldWithPlaceholder:(CPString)aPlaceholder frame:(CGRectFrame)aFrame validationMask:(int)aMask bindTo:(id) aController withKeyPath:(CPString)aKeyPath
{
    var textfield = [THRTextField textfieldWithPlaceholder:aPlaceholder frame:aFrame validationMask:aMask];
    if( textfield )
    {
        [textfield bind:@"objectValue" toObject:aController withKeyPath:aKeyPath options:nil];
    }
    return textfield;
}


- (CPString) validateValueSelf
{
}

- (void) insertNewline:(id) sender
{
	[self validateValue];
}

- (void) insertTab:(id) sender
{
	[self validateValue];
}

- (void) validateValue
{
	var statusMessage = [self validateValueSelf];
	if( [statusMessage length] )
	{
		CPLog(statusMessage);
	}
}
@end


@implementation THRTextField_Email : THRTextField
{
}


- (CPString) validateValueSelf
{
	var statusText = "";
	var value = [self stringValue];
	var matchPattern=new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)\b");
	if( value.match(matchPattern) )
	{
		CPLog(@"OK");
	}
	if( !matchPattern.test(value) )
	{
		statusText="Devi inserire un indirizzo email valido"+value;
	}
	else
		statusText="OK";
	return statusText;
}
@end