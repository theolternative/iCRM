@import <Foundation/CPObject.j>

@implementation THRRowTemplate : CPObject
{
    CPArray subviewsArray;
    float   height @accessors(readonly);
    float   width @accessors(readonly);
}

- (id)initWithSubviewsArray:(CPArray) aSubviewsArray
{
    if (self = [super init])
    {
        width=5.0;
        height=3.0;

        subviewsArray = aSubviewsArray;
        var c=[subviewsArray count];
        for( var i=0;i<c;i++ )
        {
            var currentView = [subviewsArray objectAtIndex:i];
            var oldViewFrame = [currentView frame];
            height = (height>6.0+oldViewFrame.size.height ? height : 6.0+oldViewFrame.size.height);
        }
        
        for( var i=0;i<c;i++ )
        {
            var currentView = [subviewsArray objectAtIndex:i];
            var oldViewFrame = [currentView frame];
            var newViewFrame = CGRectMake(width, (height-oldViewFrame.size.height)/2.0,oldViewFrame.size.width, oldViewFrame.size.height);
            width += (oldViewFrame.size.width+8);
            [currentView setFrame:newViewFrame];    
        }
        width -= (i ? 3 : 0);
    }
    return self;
}

- (id) newRowAtIndex:(int) aIndex withContent:(CPArray) content
{
    var c=[subviewsArray count];
    var d=[content count];

    var newRow = [[CPView alloc] initWithFrame:CGRectMake(0,0,width, height)];
    for( var i=0;i<c;i++ )
    {
        var currentView = [[subviewsArray objectAtIndex:i] copy];
        if( i<d )
        {
            //alert( CPStringFromClass([currentView class]) );
            if( [currentView isKindOfClass:CPClassFromString(@"CPTextField")] )
            {
                [currentView setStringValue:[content objectAtIndex:i]];
            }
        }
        [currentView setTag:(aIndex*1000+i)];
        [newRow addSubview:currentView];
    }
    return newRow;
}

- (id) defaultRowString
{
    var c=[subviewsArray count];
    var newContent = [CPArray array];
    for( var i=0;i<c;i++ )
    {
        var currentView = [subviewsArray objectAtIndex:i];
        [newContent addObject:@""];
    }
    return newContent;
}
@end
