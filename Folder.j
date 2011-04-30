
@import <Foundation/CPObject.j>

@implementation Folder : CPObject
{
    CPString    name 	@accessors;
    int         type 	@accessors;
	int			uindex	@accessors;
}

- (id)initWithName:(CPString) aName type:(int) aType
{
    if (self = [super init])
    {
        name=aName;
        type=aType;
    }
    return self;
}

@end
