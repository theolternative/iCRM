
@import <Foundation/CPObject.j>

@implementation THRLabel : CPTextField
{
}

+ (THRLabel) labelWithTitle:(CPString) aTitle frame:(CGRect) aFrame
{
    var textField = [[THRLabel alloc] initWithFrame:aFrame];
    if (textField)
    {
        [textField setStringValue:aTitle];
        [textField setValue:CPRightTextAlignment forThemeAttribute:@"alignment"]; 
        [textField setValue:[CPColor colorWithHexString:@"004EDE"] forThemeAttribute:@"text-color"];
        [textField setValue:[CPFont systemFontOfSize:14.0] forThemeAttribute:@"font"];
    }
    return textField;
}

@end
