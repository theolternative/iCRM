@import <Foundation/CPObject.j>

editingWindow = nil;

@implementation EditingWindow : CPObject
{
    int             returnCode;
    id              childView @accessors;
    CPSCrollView    scrollView;
}
+ (CPWindow) showEditingWindowWithView:(CPView)aView delegate:(id)aDelegate endSelector:(SEL)aSelector
{
    var application = [CPApplication sharedApplication]; 

    if( !editingWindow )
    {
        editingWindow = [[CPWindow alloc] initWithContentRect:CGRectMake(0, 0, 500, 350) styleMask:CPDocModalWindowMask | CPClosableWindowMask]; 
        var contentView = [editingWindow contentView]; 
        [contentView setBackgroundColor:[CPColor whiteColor]];
        var bounds = [contentView bounds]; 

        var okButton = [[CPButton alloc] initWithFrame: CGRectMake(380, 307, 100, 24)];
        [okButton setAutoresizingMask:CPViewMinXMargin |  CPViewMinYMargin]; 
        [okButton setTitle:"OK"]; 
        [okButton setTarget:self];
        [okButton setBezelStyle:CPRoundedBezelStyle];
        [okButton setAction:@selector(okAction:)]; 
        [contentView addSubview:okButton];

        var cancelButton = [[CPButton alloc] initWithFrame: CGRectMake(260, 307, 100, 24)];
        [cancelButton setAutoresizingMask:CPViewMinXMargin |  CPViewMinYMargin]; 
        [cancelButton setTitle:"Annulla"]; 
        [cancelButton setTarget:self]; 
        [cancelButton setBezelStyle:CPRoundedBezelStyle];
        [cancelButton setAction:@selector(cancelAction:)]; 
        [contentView addSubview:cancelButton];
    
        scrollView = [[CPScrollView alloc] initWithFrame:CGRectMakeZero()];
        [scrollView setAutohidesScrollers:YES];
        [contentView addSubview:scrollView];
        childView = nil;
    }
    var bounds = [aView bounds];
    var width = bounds.size.width+60;
    var height = bounds.size.height+100;

    [editingWindow setFrameSize:CGSizeMake(width, height)];
    [scrollView setFrame:CGRectMake(20,20,bounds.size.width+20, bounds.size.height+20)];
    [scrollView setDocumentView:aView];
    //[aView setFrameOrigin:CGPointMake(20,20)];
    //[[editingWindow contentView] addSubview:aView];
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