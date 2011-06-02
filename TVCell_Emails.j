@import <Foundation/CPObject.j>
@import <AppKit/CPView.j>

@implementation TVCell_Emails : CPView
{
    CPTextField     firstLabel;
    CPTextField     secondLabel; 
    CPTextField     firstTag;
    CPTextField     secondTag; 
}

- (id) initWithFrame:(CGRect) frame
{
    self=[super initWithFrame:frame];
    if( self )
    {
        firstLabel = [[CPTextField alloc] initWithFrame:CGRectMake(3.0,3.0,210.0,20.0)];
        secondLabel = [[CPTextField alloc] initWithFrame:CGRectMake(3.0,26.0,210.0,20.0)];

        [firstLabel setFont:[CPFont systemFontOfSize:14.0]];
        [secondLabel setFont:[CPFont systemFontOfSize:14.0]];
        [firstLabel setAlignment: CPRightTextAlignment];
        [secondLabel setAlignment: CPRightTextAlignment];

        [self addSubview:firstLabel];
        [self addSubview:secondLabel];
    }
    return self;
}

- (void) setObjectValue:(id) value
{
    if( value )
    {
        var addressesCount=[value.emails count];
        if( addressesCount )
        {
            [firstLabel setStringValue:[[value.emails objectAtIndex:0] objectAtIndex:1]];
            if( addressesCount>1 )
            {
                [secondLabel setStringValue:[[value.emails objectAtIndex:1] objectAtIndex:1]];
            }
        }
    }
    else
    {
        [firstLabel setStringValue:@""];
        [secondLabel setStringValue:@""];
    }
}

- (id)initWithCoder:(CPCoder)aCoder {
        self = [super initWithCoder:aCoder];
        firstLabel = [aCoder decodeObjectForKey:"firstLabel"];
        secondLabel = [aCoder decodeObjectForKey:"secondLabel"];
        return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder {
        [super encodeWithCoder:aCoder];
        [aCoder encodeObject:firstLabel forKey:"firstLabel"];
        [aCoder encodeObject:secondLabel forKey:"secondLabel"];
}
@end
