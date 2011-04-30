@import <Foundation/CPObject.j>

@implementation THRCheckBox : CPCheckBox
{
}

+ (THRCheckBox) checkboxWithTitle:(CPString) aTitle frame:(CGRect) aFrame
{
    var checkbox = [[THRCheckBox alloc] initWithFrame:aFrame];
    if (checkbox)
    {
        [checkbox setTitle:aTitle];
    }
    return checkbox;
}

+ (THRCheckBox) checkboxWithTitle:(CPString) aTitle frame:(CGRect) aFrame bindTo:(id) aController withKeyPath:(CPString) aKeyPath
{
    var checkbox = [THRCheckBox checkboxWithTitle:aTitle frame:aFrame];
    if (checkbox)
    {
        [checkbox bind:@"objectValue" toObject:aController withKeyPath:aKeyPath options:nil];
    }
    return checkbox;
}
@end
