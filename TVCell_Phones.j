@import <Foundation/CPObject.j>
@import <AppKit/CPView.j>

@implementation TVCell_Phones : CPView
{
    CPTextField firstLabel;
    CPTextField secondLabel; 
    CPTextField firstTag;
    CPTextField secondTag; 
}

- (id) initWithFrame:(CGRect) frame
{
    self=[super initWithFrame:frame];
    if( self )
    {
        firstLabel = [[CPTextField alloc] initWithFrame:CGRectMake(3.0,3.0,110.0,20.0)];
        secondLabel = [[CPTextField alloc] initWithFrame:CGRectMake(3.0,26.0,110.0,20.0)];
    
        firstTag = [[CPTextField alloc] initWithFrame:CGRectMake(115.0,3.0,55.0,20.0)];
        secondTag = [[CPTextField alloc] initWithFrame:CGRectMake(115.0,26.0,55.0,20.0)];
    
        [firstLabel setFont:[CPFont systemFontOfSize:14.0]];
        [secondLabel setFont:[CPFont systemFontOfSize:14.0]];
        [firstLabel setAlignment: CPRightTextAlignment];
        [secondLabel setAlignment: CPRightTextAlignment];

        [firstTag setFont:[CPFont systemFontOfSize:12.0]];
        [firstTag setTextColor:[CPColor grayColor]];
        [secondTag setFont:[CPFont systemFontOfSize:12.0]];
        [secondTag setTextColor:[CPColor grayColor]];	
        [self addSubview:firstLabel];
        [self addSubview:secondLabel];
        [self addSubview:firstTag];
        [self addSubview:secondTag];
    }
    return self;
}

- (void) setObjectValue:(id) value
{
    if( value )
    {
        var phonesCount;
        phonesCount=[value.phones count];
        if( phonesCount )
        {
            [firstLabel setStringValue:[[value.phones objectAtIndex:0] objectAtIndex:1]];
            [firstTag setStringValue:[[value.phones objectAtIndex:0] objectAtIndex:0]];
            if( phonesCount>1 )
            {
                [secondLabel setStringValue:[[value.phones objectAtIndex:1] objectAtIndex:1]];
                [secondTag setStringValue:[[value.phones objectAtIndex:1] objectAtIndex:0]];
            }
        }
    }
    else
    {
        [firstLabel setStringValue:@""];
        [secondLabel setStringValue:@""];
        [firstTag setStringValue:@""];
        [secondTag setStringValue:@""];
    }
}

- (id)initWithCoder:(CPCoder)aCoder {
        self = [super initWithCoder:aCoder];
        firstLabel = [aCoder decodeObjectForKey:"firstLabel"];
        secondLabel = [aCoder decodeObjectForKey:"secondLabel"];
        firstTag = [aCoder decodeObjectForKey:"firstTag"];
        secondTag = [aCoder decodeObjectForKey:"secondTag"];
        return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder {
        [super encodeWithCoder:aCoder];
        [aCoder encodeObject:firstLabel forKey:"firstLabel"];
        [aCoder encodeObject:secondLabel forKey:"secondLabel"];
        [aCoder encodeObject:firstTag forKey:"firstTag"];
        [aCoder encodeObject:secondTag forKey:"secondTag"];
}
@end