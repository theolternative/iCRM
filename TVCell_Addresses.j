@import <Foundation/CPObject.j>
@import <AppKit/CPView.j>

@implementation TVCell_Addresses : CPView
{
	CPTextField		firstLabel;
	CPTextField		secondLabel; 
}

- (id) initWithFrame:(CGRect) frame
{
	self=[super initWithFrame:frame];
	if( self )
	{
		firstLabel = [[CPTextField alloc] initWithFrame:CGRectMake(3.0,3.0,180.0,22.0)];
		secondLabel = [[CPTextField alloc] initWithFrame:CGRectMake(3.0,26.0,180.0,21.0)];
			
		[firstLabel setFont:[CPFont systemFontOfSize:15.0]];
		[secondLabel setFont:[CPFont systemFontOfSize:12.0]];
		[secondLabel setTextColor:[CPColor grayColor]];
        [firstLabel setAlignment: CPRightTextAlignment];
        [secondLabel setAlignment: CPRightTextAlignment];
		
		[self addSubview:firstLabel];
		[self addSubview:secondLabel];
	}
	return self;
}

- (void) setObjectValue:(id) value
{
	var addressesCount=[value.addresses count];
    if( addressesCount )
    {
        [firstLabel setStringValue:[value.addresses objectAtIndex:0].value];
        [secondLabel setStringValue:[value.addresses objectAtIndex:0].key];
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
