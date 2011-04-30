@import <Foundation/CPObject.j>

@implementation THRPicker : CPButton
{
    CPWindow        overlayWindow;
    CPArray         objects;
    CPString        searchText;
    CPURLConnection listConnection;
    CPTableView     tableView; 
    CPSearchField   searchField;
    id              selectedObject @accessors(readonly);
}

- (id) initWithFrame:(CGRect) frame selectedObject:(id) aObject
{
    frame.size = CGSizeMake(250,25);
    self = [super initWithFrame:frame];
    if( !self )
        return nil;

    overlayWindow = [[CPWindow alloc] initWithContentRect:CGRectMake(0, 0, 250, 175) styleMask:CPBorderlessWindowMask];
    [overlayWindow setHasShadow:YES]; 
    var contentView = [overlayWindow contentView]; 

    [self setTarget:self];
    [self setAction:@selector(togglePicker:)];
    if( aObject )
    {
        selectedObject = aObject;
        [self setStringValue:[self descriptionForObject:aObject]];
    }
    else
    {
        selectedObject = nil;
        [self setTitle:@"Clicca per scegliere"];
    }

    searchField = [[CPSearchField alloc] initWithFrame:CGRectMake(1,0,248,30)];
    [self addObserver:self forKeyPath:@"searchText" options:(CPKeyValueObservingOptionNew) context:nil];
    [self bind:@"searchText" toObject:searchField withKeyPath:@"objectValue" options:nil];

    var scrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(1,30,248,145)];
    [scrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    searchText=nil;
    selectedObject = nil;
    tableView = [[CPTableView alloc] initWithFrame:[scrollView bounds]];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setRowHeight: 20.0];
    [tableView setUsesAlternatingRowBackgroundColors:YES];	
    [tableView setTarget:self];
    [tableView setAction:@selector(selectRow:)];
    [tableView setHeaderView:nil];
    [tableView setCornerView:nil];

    var fullnameColumn = [[CPTableColumn alloc] initWithIdentifier:@"Nome"];
    [fullnameColumn setWidth:248.0];
    [tableView addTableColumn:fullnameColumn];
    [scrollView setDocumentView:tableView];

    [contentView addSubview:searchField];
    [contentView addSubview:scrollView];
    
    return self;
}

- (void) observeValueForKeyPath:(CPString *)keyPath ofObject:(id)object change:(CPDictionary *)change  context:(void *)context
{
    if( [keyPath isEqual:@"searchText"] )
    {
        [self refreshObjects];
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
    if( connection == listConnection )
    {
        [objects release];
        objects = [CPArray array];
        if( ![data length] )
        {
            [tableView reloadData];
            return;
        }
        var result = JSON.parse(data);
        var objectsCount = result.length;
        for( var i=0;i<objectsCount;i++ )
        {
            var object = [self objectFromJSON:result[i]];
            [objects addObject:object];
        }
        listConnection=nil;
        [tableView reloadData];
    }
}

- (void) refreshObjects
{
    var url = [self urlWithSearchString:searchText];
    if( url )
    {
        var request = [CPURLRequest requestWithURL:url];
        listConnection = [CPURLConnection connectionWithRequest:request delegate:self];
    }
    else
    {
        [objects removeAllObjects];
        [tableView reloadData];
    }
}
// button selector
- (void) togglePicker:(id) sender
{
    if( ![overlayWindow isVisible] )
    {
        var newPoint = [self convertPointToBase:CGPointMake(0,25)];
        self.searchText = @"";
        [searchField setStringValue:@""];
        [objects removeAllObjects];
        [tableView reloadData];

        [overlayWindow setFrameOrigin:newPoint];
        [overlayWindow orderFront:self];
    }
    else
    {
        [overlayWindow orderOut:self];
    }
}
// tableview methods
- (int) numberOfRowsInTableView:(CPTableView)aTableView 
{
    return [objects count];
}

- (id) tableView:(CPTableView) aTableView objectValueForTableColumn:(CPTableColumn) aTableColumn row:(int) aRow 
{
    var obj = [objects objectAtIndex:aRow];
    return [self descriptionForObject:obj];
}

- (void) selectRow:(id) sender
{
    var aRow = [tableView selectedRow];
    if( aRow != -1 )
    {
        selectedObject =  [objects objectAtIndex:aRow];
        [self setTitle:[self descriptionForObject:selectedObject]];
        [overlayWindow orderOut:self];
    }
}

@end

