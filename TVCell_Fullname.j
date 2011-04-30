@import <Foundation/CPObject.j>
@import <AppKit/CPView.j>

@implementation TVCell_Fullname : CPView
{
	CPTextField		mainLabel @accessors;
	CPTextField		secondaryLabel @accessors; 
}

- (id) initWithFrame:(CGRect) frame
{
	self=[super initWithFrame:frame];
	if( self )
	{
		mainLabel = [[CPTextField alloc] initWithFrame:CGRectMake(3.0,3.0,200.0,20.0)];
		secondaryLabel = [[CPTextField alloc] initWithFrame:CGRectMake(3.0,26.0,200.0,20.0)];

		[mainLabel setFont:[CPFont systemFontOfSize:14.0]];
		[secondaryLabel setFont:[CPFont systemFontOfSize:12.0]];
		[secondaryLabel setTextColor:[CPColor grayColor]];
		[self addSubview:mainLabel];
		[self addSubview:secondaryLabel];
	}
	return self;
}

- (void) setObjectValue:(id) value
{
	if( value )
	{
		[mainLabel setStringValue:[value fullName]];
		if( !value.isCompany )
			[secondaryLabel setStringValue:value.companyName];
	}
	else
	{
		[mainLabel setStringValue:@""];
		[secondaryLabel setStringValue:@""];
	}
}

- (id)initWithCoder:(CPCoder)aCoder {
        self = [super initWithCoder:aCoder];
        mainLabel = [aCoder decodeObjectForKey:"mainLabel"];
        secondaryLabel = [aCoder decodeObjectForKey:"secondaryLabel"];
        return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder {
        [super encodeWithCoder:aCoder];
        [aCoder encodeObject:mainLabel forKey:"mainLabel"];
        [aCoder encodeObject:secondaryLabel forKey:"secondaryLabel"];
}