/*
 * AppController.j
 * CRM
 *
 * Created by You on April 7, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPOutlineView.j>
@import "Folder.j"
@import "PeopleViewController.j"


@implementation AppController : CPObject
{
    @outlet CPWindow        theWindow; //this "outlet" is connected automatically by the Cib
    @outlet CPScrollView    theScrollView;
    @outlet CPOutlineView   theOutlineView;
    @outlet CPView          detailView;
          
    CPDictionary            folders;
    CPURLConnection         folderConnection;
	PeopleViewController	peopleViewController;
	id						currentView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
    //var outlineView = [[CPOutlineView alloc] initWithFrame:];
    CPLogRegister(CPLogPopup);
		
    var textColumn = [[CPTableColumn alloc] initWithIdentifier:@"TextColumn"];
    [textColumn setWidth:140.0];
    
    [theOutlineView setHeaderView:nil];
    [theOutlineView setCornerView:nil];
    [theOutlineView addTableColumn:textColumn];
    [theOutlineView setOutlineTableColumn:textColumn];
    [theOutlineView setBackgroundColor:[CPColor colorWithHexString:@"e0ecfa"]];

    [theScrollView setDocumentView:theOutlineView];
    [theScrollView setAutohidesScrollers:YES];
    
    [theOutlineView setDataSource:self];
    [theOutlineView setDelegate:self];
    [self refreshFolders];
	
	peopleViewController = [[PeopleViewController alloc] init];
	
	//[detailView addSubview:[peopleViewController view]];
	[CPMenu setMenuBarVisible:NO];
	currentView=nil;
}

- (void) refreshFolders
{
    var request = [CPURLRequest requestWithURL:@"https://iscrizioni.iltemporitrovato.org/gestione/PHP/folders.php?task=LISTING"];
    folderConnection = [CPURLConnection connectionWithRequest:request delegate:self];
}
- (void)connection:(CPURLConnection) connection didReceiveData:(CPString)data
{
    if( connection == folderConnection )
    {
        var result = JSON.parse(data);
        var foldersCount = result.length;
        var contactsFolders, projectsFolders, invoicesFolders, warnings, allFolders, allFoldersNames;
        contactsFolders = [CPArray array];
        projectsFolders = [CPArray array];
        invoicesFolders = [CPArray array];
        warningsFolders = [CPArray array];
        allFolders = [CPArray arrayWithObjects:contactsFolders, projectsFolders, invoicesFolders, warningsFolders,nil];
        allFoldersNames = [CPArray arrayWithObjects:@"Progetti",@"Fatture",@"Contatti",@"Avvisi",nil];
        for( var i=0;i<foldersCount;i++ )
        {
            var folderObj = result[i];
            var folder = [[Folder alloc] initWithName:folderObj.name type:[folderObj.type intValue]];
			folder.uindex = folderObj["id"];
            [[allFolders objectAtIndex:[folderObj.type intValue]] addObject:folder];
        }

        folders = [CPDictionary dictionaryWithObjects:allFolders forKeys:allFoldersNames];
        [theOutlineView reloadData];
        folderConnection=nil;
    }
    
}
- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things. 


}

// Outline methods
- (id)outlineView:(CPOutlineView)outlineView child:(int)index ofItem:(id)item
{
    if (item === nil)
    {
        var keys = [folders allKeys];
        return [keys objectAtIndex:index];
    }
    else
    {
        var values = [folders objectForKey:item];
        return [values objectAtIndex:index];
    }
}

- (BOOL)outlineView:(CPOutlineView)outlineView isItemExpandable:(id)item
{    
    var values = [folders objectForKey:item];
    return ([values count] > 0);
}

- (int)outlineView:(CPOutlineView)outlineView numberOfChildrenOfItem:(id)item
{
    if (item === nil)
    {
        return [folders count];
    }
    else
    {
        var values = [folders objectForKey:item];
        return [values count];
    }
}

- (id)outlineView:(CPOutlineView)outlineView objectValueForTableColumn:(CPTableColumn)tableColumn byItem:(id)item
{    
    if( [item isKindOfClass:Folder] )
        return item.name;
    return item;  
}
- (BOOL) outlineView:(CPOutlineView)outlineView shouldSelectItem:(id) item
{
    if( [item isKindOfClass:Folder] )
        return YES;
	return NO;
}
- (void)outlineViewSelectionDidChange:(CPNotification)notification
{
	if( [notification object] === theOutlineView )
	{
		var folderObj =[theOutlineView itemAtRow:[theOutlineView selectedRow]];
		var index=folderObj.type;
		var newView=nil;
		var viewController=nil;
		
		switch( index )
		{
			case 2:
				viewController=peopleViewController;
				break;
			default:
				break;
		}
		if( viewController )
			newView = [peopleViewController view];
			
		if( currentView && currentView != newView )
		{
			[currentView retain];
			[currentView removeFromSuperview];
		}

		if( newView )
		{
			viewController.folderId = folderObj.uindex;
			currentView = newView;
			[currentView setFrame:[detailView bounds]];
			[detailView addSubview:currentView];
			[viewController refreshObjects];
		}
	}
}
@end
