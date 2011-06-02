@import <AppKit/CPView.j>
@import "THRRowTemplate.j"

@implementation THRList : CPView
{
    CPArray         contentArray;
    THRRowTemplate  rowTemplate;
    CPString        contentString @accessors;
}

- (id)initWithFrame:(CGRect)aRect rowTemplate:(THRRowTemplate)aRowTemplate bindTo:(id) aController withKeyPath:(CPString) aKeyPath
{
    if (self = [super initWithFrame:aRect])
    {
        rowTemplate = aRowTemplate;
        contentArray = [CPArray array];

        [self addObserver:self forKeyPath:@"contentArray" options:(CPKeyValueObservingOptionNew) context:nil];
        [self bind:@"contentArray" toObject:aController withKeyPath:aKeyPath options:nil];

    }
    return self;
}

- (void) observeValueForKeyPath:(CPString *)keyPath ofObject:(id) object change:(CPDictionary *)change  context:(void *)context
{
    if( [keyPath isEqual:@"contentArray"] )
    {
        if( contentArray )
        {/*
            var tmpArray = contentString.split("##");
            var c=[tmpArray count];
            [contentArray removeAllObjects];
            for( var i=0;i<c;i++ )
            {  
                var objectArray = [tmpArray objectAtIndex:i].split(";");
                [contentArray addObject:objectArray];
            }*/
            [self updateLayout];
        }
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

- (void) updateLayout
{
    var rowsCount = [contentArray count];
    var rowHeight = rowTemplate.height;
    var rowWidth = [self bounds].size.width-100;
    var frameHeight =  rowHeight * rowsCount;
    var frameWidth = rowWidth + 100.0;
    var oldFrame = [self frame];

    var subViewsCount = [[self subviews] count];
    for( var i=subViewsCount-1;i>=0;i--)
        [[[self subviews] objectAtIndex:i] removeFromSuperview];
    
    var odd=YES;
    for( var i=0;i<rowsCount; i++ )
    {
        var newRow = [[CPView alloc] initWithFrame:CGRectMake(0,0+rowHeight*i,frameWidth, rowHeight)];
        if( (i>0) || (i==0 && rowsCount>1) )
        {
            var removeButton = [[CPButton alloc] initWithFrame:CGRectMake(rowWidth+5.0,(rowHeight-24)/2.0,40,24)];
            [removeButton setTitle:@"-"];
            [removeButton setBezelStyle:CPRoundedBezelStyle];
            [removeButton setTarget:self];
            [removeButton setAction:@selector(removeRow:)];
            [removeButton setTag:(100+i)];
            [newRow addSubview:removeButton];
        }
        if( i==(rowsCount-1) )
        {
            var addButton = [[CPButton alloc] initWithFrame:CGRectMake(rowWidth+50.0,(rowHeight-24)/2.0,40,24)];
            [addButton setTitle:@"+"];
            [addButton setBezelStyle:CPRoundedBezelStyle];            
            [addButton setTarget:self];
            [addButton setAction:@selector(addRow:)]; 
            [newRow addSubview:addButton];
        }
        odd=!odd;

        if( odd )
        {
            [newRow setBackgroundColor:[CPColor colorWithHexString:@"E0ECFA"]];
        }
        var newRowTemplate =[rowTemplate newRowAtIndex:i withContent:[contentArray objectAtIndex:i]];
        [newRow addSubview:newRowTemplate];
        [self addSubview:newRow];
    }
    [self setFrame:CGRectMake(oldFrame.origin.x, oldFrame.origin.y, frameWidth, frameHeight)];
    //[self setNeedsDisplay:YES];
}

- (void) removeRow:(id) sender
{
    var rowIndex = [sender tag]-100;
    [contentArray removeObjectAtIndex:rowIndex];
    [self updateLayout];
}

- (void) addRow:(id) sender
{
    [contentArray addObject:[rowTemplate defaultRowString]];
    [self updateLayout];
}
/*
- (void)drawRect:(CGRect)aRect
{
    // Add drawing code here
}
*/

/*
- (void)layoutSubviews
{
    // Add layout code here
}
*/

@end
