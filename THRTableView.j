@import <Foundation/CPObject.j>

@implementation THRTableView : CPTableView
{
    CPArray     contentArray;
    CPString    contentString @accessors;
}

- (id) initWithFrame:(CGRect) frame bindTo:(id) aController withKeyPath:(CPString) aKeyPath
{
    self = [super initWithFrame:frame];
    if( self )
    {
        var customColumns = [self customColumns];
        var c=[customColumns count];
        for( var i=0;i<c;i++ )
        {
            [self addTableColumn:[customColumns objectAtIndex:i]];
        }
        contentArray = [CPArray array];
        [self setDataSource:self];
        [self setDelegate:self];
        [self setUsesAlternatingRowBackgroundColors:YES];	
        [self setHeaderView:nil];
        [self setCornerView:nil];

        [self addObserver:self forKeyPath:@"contentString" options:(CPKeyValueObservingOptionNew) context:nil];
        [self bind:@"contentString" toObject:aController withKeyPath:aKeyPath options:nil];
    }
    return self;
}

- (void) observeValueForKeyPath:(CPString *)keyPath ofObject:(id) object change:(CPDictionary *)change  context:(void *)context
{
    if( [keyPath isEqual:@"contentString"] )
    {
        if( contentString )
        {
            var tmpArray = contentString.split("##");
            var c=[tmpArray count];
            [contentArray removeAllObjects];
            for( var i=0;i<c;i++ )
            {  
                var objectArray = [tmpArray objectAtIndex:i].split(";");
                [contentArray addObject:objectArray];
            }
            [self reloadData];
        }
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

- (int) numberOfRowsInTableView:(CPTableView)aTableView 
{
    return [contentArray count];
}

- (id) tableView:(CPTableView) aTableView objectValueForTableColumn:(CPTableColumn) aTableColumn row:(int) aRow 
{
    var obj = [[contentArray objectAtIndex:aRow] objectAtIndex:[[aTableColumn identifier] intValue]];
    return obj;
}

- (BOOL) tableView:(CPTableView) aTableView shouldEditTableColumn:(CPTableColumn) aTableColumn row:(int) aRow 
{
    return YES;
}

- (void)tableView:(CPTableView)aTableView setObjectValue:(id)anObject forTableColumn:(CPTableColumn)aTableColumn row:(int)aRow
{
    [[contentArray objectAtIndex:aRow] replaceObjectAtIndex:[[aTableColumn identifier] intValue] withObject:anObject];
    return;
}
@end
