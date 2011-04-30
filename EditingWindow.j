@import <Foundation/CPObject.j>

editingWindow = nil;

@implementation EditingWindow : CPObject
{
	int		returnCode;
    id      childView @accessors;
}
+ (CPWindow) showEditingWindowWithView:(CPView)aView delegate:(id)aDelegate endSelector:(SEL)aSelector
{
	var application = [CPApplication sharedApplication]; 
		
	if( !editingWindow )
	{
        editingWindow = [[CPWindow alloc] initWithContentRect:CGRectMake(0, 0, 500, 350) styleMask:CPDocModalWindowMask | CPClosableWindowMask]; 
		var contentView = [editingWindow contentView]; 
		var bounds = [contentView bounds]; 
		
        var okButton = [[CPButton alloc] initWithFrame: CGRectMake(380, 310, 100, 18)];
        [okButton setAutoresizingMask:CPViewMinXMargin |  CPViewMinYMargin]; 
        [okButton setTitle:"OK"]; 
        [okButton setTarget:self];
		[okButton setBezelStyle:CPRoundRectBezelStyle];
        [okButton setAction:@selector(okAction:)]; 
        [contentView addSubview:okButton];

        var cancelButton = [[CPButton alloc] initWithFrame: CGRectMake(260, 310, 100, 18)];
        [cancelButton setAutoresizingMask:CPViewMinXMargin |  CPViewMinYMargin]; 
        [cancelButton setTitle:"Annulla"]; 
        [cancelButton setTarget:self]; 
        [cancelButton setAction:@selector(cancelAction:)]; 
        [contentView addSubview:cancelButton];
        childView = nil;
	}
	var bounds = [aView bounds];
	var width = bounds.size.width+40;
	var height = bounds.size.height+80;
	
	[editingWindow setFrameSize:CGSizeMake(width, height)];
	[aView setFrameOrigin:CGPointMake(20,20)];
	[[editingWindow contentView] addSubview:aView];
    editingWindow.childView = aView;
	editingWindow.returnCode = 0;
	[application beginSheet:editingWindow modalForWindow:[application mainWindow] modalDelegate:aDelegate didEndSelector:aSelector contextInfo:nil]; 

	return editingWindow;
}

+ (void) cancelAction:(id) sender
{
    [editingWindow.childView removeFromSuperview];
	editingWindow.returnCode=0;
	var application = [CPApplication sharedApplication];
	[application endSheet:editingWindow];
}

+ (void) okAction:(id) sender
{
    [editingWindow.childView removeFromSuperview];
	editingWindow.returnCode=1;
	var application = [CPApplication sharedApplication];
	[application endSheet:editingWindow];
}

@end