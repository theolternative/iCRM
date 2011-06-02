@import <Foundation/CPObject.j>
@import <AppKit/CPAccordionView.j>
@import "TreenodeViewController.j"
@import "Person.j"
@import "TVCell_Fullname.j" 
@import "TVCell_Phones.j" 
@import "TVCell_Addresses.j" 
@import "TVCell_Emails.j" 
@import "EditingWindow.j"
@import "THRTextField.j"
@import "THRLabel.j"
@import "THRCheckBox.j"
@import "AddressTable.j"
@import "PeoplePicker.j"
@import "THRList.j"

@implementation PeopleViewController : TreeNodeViewController
{
    int                 rowInEditing;
    TVCell_Fullname     tvcellFullname;
    TVCell_Phones       tvcellPhones;
    TVCell_Emails       tvcellEmails;
    TVCell_Addresses    tvcellAddresses;
    Person              inEditingPerson @accessors;

    THRList             editPersonAddressList;
    THRList             editPersonPhoneList;
    THRList             editPersonEmailList;

}


- (void) refreshObjects
{
    if( folderId )
    {
        var url;
        if( [searchText length]>2)
            url=[CPString stringWithFormat:@"https://iscrizioni.iltemporitrovato.org/gestione/PHP/contacts.php?task=LISTING&folder=%d&search=%@",folderId,searchText];
        else
            url=[CPString stringWithFormat:@"%@%d",@"https://iscrizioni.iltemporitrovato.org/gestione/PHP/contacts.php?task=LISTING&folder=",folderId];
        var request = [CPURLRequest requestWithURL:url];
    listConnection = [CPURLConnection connectionWithRequest:request delegate:self];
    }
}
- (void) loadView
{
    rowInEditing = -1;
    inEditingPerson = [[Person alloc] init];

    var containerView = [[CPSplitView alloc] initWithFrame:CGRectMake(0,0,1000,500)];
    [containerView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];
    [containerView setIsPaneSplitter:YES];

    // list view
    var listView = [[CPView alloc] initWithFrame:CGRectMake(0,0,600,500)];
    var toolbarView = [[CPView alloc] initWithFrame:CGRectMake(0,0,600,50)];
    [toolbarView setAutoresizingMask:CPViewWidthSizable];
    [toolbarView setBackgroundColor:[CPColor whiteColor]];
    
    var addButton = [[CPButton alloc] initWithFrame:CGRectMake(20,13,120,24)];
    //[addButton setTitle:@"Aggiungi"];
    [addButton setTarget:self];
    [addButton setAction:@selector(addPerson:)];
    [addButton setImage:[CPImage imageNamed:@"toolbar_quickentry.png"]];

    var removeButton = [[CPButton alloc] initWithFrame:CGRectMake(160,13,120,24)];
    [removeButton setTitle:@"Rimuovi"];	
    [removeButton setTarget:self];
    [removeButton setAction:@selector(removePerson:)];	

    var editButton = [[CPButton alloc] initWithFrame:CGRectMake(300,13,120,24)];
    [editButton setTitle:@"Modifica"];
    [editButton setTarget:self];
    [editButton setAction:@selector(editPerson:)];

    var peoplePicker = [[PeoplePicker alloc] initWithFrame:CGRectMake(440,13,250,25) selectedObject:nil];

    var searchField = [[CPSearchField alloc] initWithFrame:CGRectMake(460,10,120,30)];
    [searchField setAutoresizingMask:CPViewMinXMargin];
    [self addObserver:self forKeyPath:@"searchText" options:(CPKeyValueObservingOptionNew) context:nil];
    [self bind:@"searchText" toObject:searchField withKeyPath:@"objectValue" options:nil];

    [toolbarView addSubview:searchField];
    [toolbarView addSubview:addButton];
    [toolbarView addSubview:removeButton];
    [toolbarView addSubview:editButton];
    [toolbarView addSubview:peoplePicker];

    var scrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0.0,50.0,600.0,450.0)];
    [scrollView setAutoresizingMask:CPViewWidthSizable | CPViewHeightSizable];

    var tableView = [[CPTableView alloc] initWithFrame:[scrollView bounds]];
    //[tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView setRowHeight: 50.0];
    [tableView setUsesAlternatingRowBackgroundColors:YES];	
    [tableView setDoubleAction:@selector(selectRow:)];
    [tableView setSelectionHighlightStyle:CPTableViewSelectionHighlightStyleSourceList];
    [tableView setTarget:self];

    var fullnameColumn = [[CPTableColumn alloc] initWithIdentifier:@"Nome"];
    [[fullnameColumn headerView] setStringValue:@"Nome"];
    [fullnameColumn setWidth:210.0];
    
    tvcellFullname = [[TVCell_Fullname alloc] initWithFrame:CGRectMake(0,0,200,50)];    
    [tableView addTableColumn:fullnameColumn];

    var phonesColumn = [[CPTableColumn alloc] initWithIdentifier:@"Telefoni"];
    [[phonesColumn headerView] setStringValue:@"Telefoni"];
    [phonesColumn setWidth:170.0];

    tvcellPhones = [[TVCell_Phones alloc] initWithFrame:CGRectMake(0,0,160,50)];
    [tableView addTableColumn:phonesColumn];

    var emailsColumn = [[CPTableColumn alloc] initWithIdentifier:@"Email"];
    [[emailsColumn headerView] setStringValue:@"Email"];
    [emailsColumn setWidth:220.0];

    tvcellEmails = [[TVCell_Emails alloc] initWithFrame:CGRectMake(0,0,210,50)];
    [tableView addTableColumn:emailsColumn];

    [scrollView setDocumentView:tableView];

    [listView addSubview:toolbarView];
    [listView addSubview:scrollView];

    // detail view
    var detailView = [[CPAccordionView alloc] initWithFrame:CGRectMake(0,0,400,500)];
    var profileTab = [[CPAccordionViewItem alloc] initWithIdentifier:@"0"];
    [profileTab setLabel:@"Dati anagrafici"];
    [profileTab setView:[self profileView]];	
    var projectsTab = [[CPAccordionViewItem alloc] initWithIdentifier:@"1"];
    var projectsView = [[CPView alloc] initWithFrame:CGRectMake(0,0,400,200)];
    [projectsTab setLabel:@"Progetti"];
    [projectsTab setView:projectsView];	
    var invoicesTab = [[CPAccordionViewItem alloc] initWithIdentifier:@"2"];
    var invoicesView = [[CPView alloc] initWithFrame:CGRectMake(0,0,400,200)];
    [invoicesTab setLabel:@"Proforme e fatture"];
    [invoicesTab setView:invoicesView];	
    
    [detailView addItem:profileTab];
    [detailView addItem:projectsTab];
    [detailView addItem:invoicesTab];
    
    [detailView setBackgroundColor:[CPColor whiteColor]];
    
    [containerView addSubview:listView];
    [containerView addSubview:detailView];
    [containerView setPosition:600.0 ofDividerAtIndex:0];
    
    [fullnameColumn bind:@"value" toObject:objectsArrayController withKeyPath:@"arrangedObjects" options:nil];
    [phonesColumn bind:@"value" toObject:objectsArrayController withKeyPath:@"arrangedObjects" options:nil];
    [emailsColumn bind:@"value" toObject:objectsArrayController withKeyPath:@"arrangedObjects" options:nil];
    
    [self setView:containerView];
    
    theTableView = tableView;
}

- (void) observeValueForKeyPath:(CPString *)keyPath ofObject:(id)object change:(CPDictionary *)change  context:(void *)context
{
    if( [keyPath isEqual:@"searchText"] )
    {
        [self refreshObjects];
        return;
    } else if( [keyPath isEqual:@"frameSize"] )
    {
        var oldFrame = [change valueForKey:CPKeyValueChangeOldKey];
        var newFrame = [change valueForKey:CPKeyValueChangeNewKey];
        var heightDiff = newFrame.height-oldFrame.height;
        if( object==editPersonAddressList )
        {
            var addressFrame = [[editPersonAddressList superview] frame];
            addressFrame.size.height += heightDiff;
            [[editPersonAddressList superview] setFrame:addressFrame];
            var phoneFrame = [[editPersonPhoneList superview] frame];
            phoneFrame.origin.y += heightDiff;
            [[editPersonPhoneList superview] setFrame:phoneFrame];
            var emailFrame = [[editPersonEmailList superview] frame];
            emailFrame.origin.y += heightDiff;
            [[editPersonEmailList superview] setFrame:emailFrame];
        } else if( object==editPersonPhoneList )
        {
            var phoneFrame = [[editPersonPhoneList superview] frame];
            phoneFrame.size.height += heightDiff;
            [[editPersonPhoneList superview] setFrame:phoneFrame];
            var emailFrame = [[editPersonEmailList superview] frame];
            emailFrame.origin.y += heightDiff;
            [[editPersonEmailList superview] setFrame:emailFrame];
        } else if( object==editPersonEmailList )
        {
            var emailFrame = [[editPersonEmailList superview] frame];
            emailFrame.size.height += heightDiff;
            [[editPersonEmailList superview] setFrame:emailFrame];
        }
        var superviewFrame = [[[object superview] superview] frame];
        superviewFrame.size.height += heightDiff;
        [[[object superview] superview] setFrame:superviewFrame];
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
        [objectsArrayController bind:@"contentArray" toObject:self withKeyPath:@"objects" options:nil];
        if( ![data length] )
            return;
        var result = JSON.parse(data);
        var peopleCount = result.length;	


        for( var i=0;i<peopleCount;i++ )
        {
            var personObj = result[i];
            var phonesArray = personObj.phones.split("::");
            var emailsArray = personObj.emails.split("::");
            var addressesArray = personObj.addresses.split("::");
            var person = [[Person alloc] init];
            person.index=personObj.id;
            person.name = personObj.name;
            person.surname = personObj.surname;
            person.companyName = personObj.companyName;
            person.tags = personObj.tags;
            person.privacy = personObj.privacy;
            person.fiscalID = personObj.fiscalID;
            person.VAT = personObj.VAT;

            person.isCompany = [personObj.isCompany intValue];
            for( var j=0;j<phonesArray.length-1;j++ )
            {
                var phoneArray = phonesArray[j].split(";");
                [person.phones addObject:phoneArray];
            }
            for( var j=0;j<emailsArray.length-1;j++ )
            {
                var emailArray = emailsArray[j].split(";");
                [person.emails addObject:emailArray];
            }

            for( var j=0;j<addressesArray.length-1;j++ )
            {
                var addressArray = addressesArray[j].split(";");
                [person.addresses addObject:addressArray];
            }
        
            [objectsArrayController addObject:person];
        }
        listConnection=nil;
        [theTableView reloadData];
    }
    if( connection==deleteConnection )
    {  
        [self errorFromResponse:data];
        deleteConnection=nil;
        [self refreshObjects];
    } 
}

- (void) addPerson:(id) sender
{
    var person=[[Person alloc] init];
    person.name = "Nuovo";
    person.surname ="Valore";
    [objectsArrayController addObject:person];
}

- (void) removePerson:(id) sender
{
    var personArray=[objectsArrayController selectedObjects];
    var person=nil;
    if( [personArray count] )
        person = [personArray objectAtIndex:0];

    if( person )
    {
        var index=person.index;
        var url=[CPString stringWithFormat:@"%@",@"http://127.0.0.1/CRM2/PHP/contacts.php?task=DELETE"];
        var request = [CPURLRequest requestWithURL:url];
        var content = [CPString stringWithFormat:@"id=%d",index];
        [request setHTTPMethod:@"POST"]; 
        [request setHTTPBody:content]; 
        [request setValue:"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"]; 
        deleteConnection = [CPURLConnection connectionWithRequest:request delegate:self];
    }
}

- (void) editPerson:(id) sender
{
    var personArray=[objectsArrayController selectedObjects];
    var person=nil;
    if( [personArray count] )
        person = [personArray objectAtIndex:0];
    if( person )
    {
        [person copyTo:inEditingPerson];
                
        var index=person.index;
        var sharedEditingWindow = [EditingWindow showEditingWindowWithView:[self editPersonView] delegate:self endSelector:@selector(didEndEditContactSheet:)];
    }
}

- (void) selectRow:(id) sender
{

    var aView = [[CPView alloc] initWithFrame:CGRectMake(0,0,450,350)];
    [aView setBackgroundColor:[CPColor lightGrayColor]];
    var phoneField = [[THRTextField_Email alloc] initWithFrame:CGRectMake(20,20,250,28)];
    [phoneField setEditable:YES];
    [phoneField setBezeled:YES];
    [aView addSubview:phoneField];
    var sharedEditingWindow = [EditingWindow showEditingWindowWithView:aView delegate:self endSelector:@selector(didEndEditContactSheet:)];
}
- (void) didEndEditContactSheet:(id) sheet
{
    self.inEdtingPerson=nil;
}
-(id)tableView:(CPTableView)aTableView dataViewForTableColumn:(CPTableColumn)aTableColumn row:(int)aRow
{
    if( aTableColumn != nil)
    {
        if( [[aTableColumn identifier] isEqual:@"Nome"] )
            return tvcellFullname;
        if( [[aTableColumn identifier] isEqual:@"Telefoni"] )
            return tvcellPhones;
        if( [[aTableColumn identifier] isEqual:@"Email"] )
            return tvcellEmails;
        if( [[aTableColumn identifier] isEqual:@"Indirizzo"] )
            return tvcellAddresses;
    }
    return nil;
}

- (BOOL) errorFromResponse:(CPString) message
{
    var statusArray = message.split(";");
    if( statusArray.length )
    {
        var statusCode = parseInt(statusArray[0]);
        if( !statusCode )
            alert(statusArray[1]);
    }
    return NO;
}

- (CPView) profileView
{
    var profileView = [[CPView alloc] initWithFrame:CGRectMake(0,0,400,500)];

    // labels
    [profileView addSubview:[THRLabel labelWithTitle:@"Dati generali" frame:CGRectMake(20,20,120,25)]];
    [profileView addSubview:[THRLabel labelWithTitle:@"Privacy" frame:CGRectMake(20,155,120,25)]];
    [profileView addSubview:[THRLabel labelWithTitle:@"Dati fiscali" frame:CGRectMake(20,190,120,25)]];
    [profileView addSubview:[THRLabel labelWithTitle:@"Indirizzo" frame:CGRectMake(20,250,120,25)]];
    [profileView addSubview:[THRLabel labelWithTitle:@"Telefoni" frame:CGRectMake(20,285,120,25)]];
    [profileView addSubview:[THRLabel labelWithTitle:@"Email" frame:CGRectMake(20,320,120,25)]];

    [profileView addSubview:[THRCheckBox checkboxWithTitle:@"E' una società" frame:CGRectMake(150,20,120,25) bindTo:objectsArrayController withKeyPath:@"selection.isCompany"]];
    [profileView addSubview:[THRTextField textfieldWithPlaceholder:@"Nome" frame:CGRectMake(150,45,120,25) validationMask:0 bindTo:objectsArrayController withKeyPath:@"selection.name"]];
    [profileView addSubview:[THRTextField textfieldWithPlaceholder:@"Cognome" frame:CGRectMake(150,70,120,25) validationMask:0 bindTo:objectsArrayController withKeyPath:@"selection.surname"]];
    [profileView addSubview:[THRTextField textfieldWithPlaceholder:@"Società" frame:CGRectMake(150,95,120,25) validationMask:0 bindTo:objectsArrayController withKeyPath:@"selection.companyName"]];
    [profileView addSubview:[THRTextField textfieldWithPlaceholder:@"Etichette" frame:CGRectMake(150,120,120,25) validationMask:0 bindTo:objectsArrayController withKeyPath:@"selection.tags"]];
    [profileView addSubview:[THRCheckBox checkboxWithTitle:@"Scheda compilata" frame:CGRectMake(150,155,120,25) bindTo:objectsArrayController withKeyPath:@"selection.privacy"]];
    [profileView addSubview:[THRTextField textfieldWithPlaceholder:@"Codice fiscale" frame:CGRectMake(150,190,120,25) validationMask:0 bindTo:objectsArrayController withKeyPath:@"selection.fiscalID"]];
    [profileView addSubview:[THRTextField textfieldWithPlaceholder:@"Partita IVA" frame:CGRectMake(150,215,120,25) validationMask:0 bindTo:objectsArrayController withKeyPath:@"selection.VAT"]];

    //[profileView addSubview:[THRTableView tableViewWithColumns:[@"Nome",@"Cognome"] widths:[250.0,125.0] frame:CGRectMake(150,250,250,150) bindTo:objectsArrayController withKeyPath:@"selection.addresses"]];
    return profileView;
}

- (CPView) editPersonView
{
    var editPersonView = [[CPView alloc] initWithFrame:CGRectMake(0,0,900,355)];

    // General section
    [editPersonView addSubview:[THRLabel labelWithTitle:@"Dati generali" frame:CGRectMake(20,20,120,25)]];
    [editPersonView addSubview:[THRCheckBox checkboxWithTitle:@"E' una società" frame:CGRectMake(150,20,150,25) bindTo:self.inEditingPerson withKeyPath:@"isCompany"]];
    [editPersonView addSubview:[THRTextField textfieldWithPlaceholder:@"Nome" frame:CGRectMake(150,45,200,25) validationMask:0 bindTo:self withKeyPath:@"inEditingPerson.name"]];
    [editPersonView addSubview:[THRTextField textfieldWithPlaceholder:@"Cognome" frame:CGRectMake(150,70,200,25) validationMask:0 bindTo:self.inEditingPerson withKeyPath:@"surname"]];
    [editPersonView addSubview:[THRTextField textfieldWithPlaceholder:@"Società" frame:CGRectMake(150,95,200,25) validationMask:0 bindTo:self.inEditingPerson withKeyPath:@"companyName"]];
    [editPersonView addSubview:[THRTextField textfieldWithPlaceholder:@"Etichette" frame:CGRectMake(150,120,200,25) validationMask:0 bindTo:self.inEditingPerson withKeyPath:@"tags"]];
    
    // Privacy section
    [editPersonView addSubview:[THRLabel labelWithTitle:@"Privacy" frame:CGRectMake(20,155,120,25)]];    
    [editPersonView addSubview:[THRCheckBox checkboxWithTitle:@"Scheda compilata" frame:CGRectMake(150,155,150,25) bindTo:self.inEditingPerson withKeyPath:@"privacy"]];
   
    // Fiscal section
    [editPersonView addSubview:[THRLabel labelWithTitle:@"Dati fiscali" frame:CGRectMake(20,190,120,25)]];
    [editPersonView addSubview:[THRTextField textfieldWithPlaceholder:@"Codice fiscale" frame:CGRectMake(150,190,200,25) validationMask:0 bindTo:self.inEditingPerson withKeyPath:@"fiscalID"]];
    [editPersonView addSubview:[THRTextField textfieldWithPlaceholder:@"Partita IVA" frame:CGRectMake(150,215,200,25) validationMask:0 bindTo:self.inEditingPerson withKeyPath:@"VAT"]];

    var minHeight;
    var yOrigin;

    // Address section    
    var addressRowTemplate = [[THRRowTemplate alloc] initWithSubviewsArray:[CPArray arrayWithObjects:
        [THRTextField textfieldWithPlaceholder:@"etichette" frame:CGRectMake(0,0,70,24) validationMask:0],
        [THRTextField textfieldWithPlaceholder:@"città" frame:CGRectMake(0,0,130,24) validationMask:0],
        [THRTextField textfieldWithPlaceholder:@"indirizzo" frame:CGRectMake(0,0,200,24) validationMask:0],
        [THRTextField textfieldWithPlaceholder:@"CAP" frame:CGRectMake(0,0,50,24) validationMask:0],
        [THRTextField textfieldWithPlaceholder:@"provincia" frame:CGRectMake(0,0,50,24) validationMask:0],
        [THRTextField textfieldWithPlaceholder:@"stato" frame:CGRectMake(0,0,100,24) validationMask:0]  
   ]];
    minHeight = ([inEditingPerson.addresses count] ? [inEditingPerson.addresses count] : 1)*addressRowTemplate.height+5;
    yOrigin=250+minHeight;

    var editPersonAddressSection = [[CPView alloc] initWithFrame:CGRectMake(0,250,900,minHeight)];
    [editPersonAddressSection addSubview:[THRLabel labelWithTitle:@"Indirizzo" frame:CGRectMake(20,0,120,25)]];

    editPersonAddressList = [[THRList alloc] initWithFrame:CGRectMake(150,0,750,30) rowTemplate:addressRowTemplate bindTo:self.inEditingPerson withKeyPath:@"addresses"];

    [editPersonAddressSection addSubview:editPersonAddressList];
    [editPersonView addSubview:editPersonAddressSection];


    // Phone section
    var phoneRowTemplate = [[THRRowTemplate alloc] initWithSubviewsArray:[CPArray arrayWithObjects:
        [THRTextField textfieldWithPlaceholder:@"etichetta" frame:CGRectMake(0,0,70,24) validationMask:0],
        [THRTextField textfieldWithPlaceholder:@"telefono" frame:CGRectMake(0,0,200,24) validationMask:0]
   ]];
    minHeight = ([inEditingPerson.phones count] ? [inEditingPerson.phones count] : 1)*phoneRowTemplate.height+5;

    var editPersonPhoneSection = [[CPView alloc] initWithFrame:CGRectMake(0,yOrigin,900,minHeight)];
    yOrigin += minHeight;

    [editPersonPhoneSection addSubview:[THRLabel labelWithTitle:@"Telefoni" frame:CGRectMake(20,0,120,25)]];

    editPersonPhoneList = [[THRList alloc] initWithFrame:CGRectMake(150,0,750,30) rowTemplate:phoneRowTemplate bindTo:self.inEditingPerson withKeyPath:@"phones"];
    [editPersonPhoneSection addSubview:editPersonPhoneList];
    [editPersonView addSubview:editPersonPhoneSection];

    // Email section
    var emailRowTemplate = [[THRRowTemplate alloc] initWithSubviewsArray:[CPArray arrayWithObjects:
        [THRTextField textfieldWithPlaceholder:@"etichetta" frame:CGRectMake(0,0,70,24) validationMask:0],
        [THRTextField textfieldWithPlaceholder:@"email" frame:CGRectMake(0,0,200,24) validationMask:0]
   ]];
    minHeight = ([inEditingPerson.emails count] ? [inEditingPerson.emails count] : 1)*emailRowTemplate.height+5;

    var editPersonEmailSection = [[CPView alloc] initWithFrame:CGRectMake(0,yOrigin,900,minHeight)];
    yOrigin += minHeight;

    [editPersonEmailSection addSubview:[THRLabel labelWithTitle:@"Email" frame:CGRectMake(20,0,120,25)]];

    editPersonEmailList = [[THRList alloc] initWithFrame:CGRectMake(150,0,750,30) rowTemplate:emailRowTemplate bindTo:self.inEditingPerson withKeyPath:@"emails"];
    [editPersonEmailSection addSubview:editPersonEmailList];
    [editPersonView addSubview:editPersonEmailSection];

    [editPersonAddressList addObserver:self forKeyPath:@"frameSize" options:(CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld) context:nil];
    [editPersonPhoneList addObserver:self forKeyPath:@"frameSize" options:(CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld) context:nil];
    [editPersonEmailList addObserver:self forKeyPath:@"frameSize" options:(CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld) context:nil];
    
    var frameView = [editPersonView frame];
    frameView.size.height = yOrigin;
    [editPersonView setFrame:frameView];

    return editPersonView;
}

@end
