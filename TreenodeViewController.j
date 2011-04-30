@import <Foundation/CPObject.j>
@import "Person.j"

@implementation TreeNodeViewController : CPViewController
{
	CPArray				objects @accessors;
	int					folderId @accessors;
	CPURLConnection		listConnection;
	CPURLConnection		updateConnection;
	CPURLConnection		deleteConnection;
	CPURLConnection		addConnection;
	
	CPArrayController	objectsArrayController;
	CPTableView			theTableView;
	
	CPString			searchText @accessors;
}

- (id) init
{
	self = [super init];
	if( self )
	{
		objects=[CPArray array];
		folderId=0;
		listConnection=nil;
		updateConnection=nil;
		deleteConnection=nil;
		addConnection=nil;
		
		objectsArrayController = [CPArrayController new];
		[objectsArrayController bind:@"contentArray" toObject:self withKeyPath:@"objects" options:nil];
	}
	return self;
}
