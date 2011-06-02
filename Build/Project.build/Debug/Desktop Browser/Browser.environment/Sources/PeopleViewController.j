@STATIC;1.0;I;21;Foundation/CPObject.jI;24;AppKit/CPAccordionView.ji;24;TreenodeViewController.ji;8;Person.ji;17;TVCell_Fullname.ji;15;TVCell_Phones.ji;18;TVCell_Addresses.ji;15;TVCell_Emails.ji;15;EditingWindow.ji;14;THRTextField.ji;10;THRLabel.ji;13;THRCheckBox.ji;14;AddressTable.ji;14;PeoplePicker.ji;9;THRList.jt;28710;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPAccordionView.j", NO);
objj_executeFile("TreenodeViewController.j", YES);
objj_executeFile("Person.j", YES);
objj_executeFile("TVCell_Fullname.j", YES);
objj_executeFile("TVCell_Phones.j", YES);
objj_executeFile("TVCell_Addresses.j", YES);
objj_executeFile("TVCell_Emails.j", YES);
objj_executeFile("EditingWindow.j", YES);
objj_executeFile("THRTextField.j", YES);
objj_executeFile("THRLabel.j", YES);
objj_executeFile("THRCheckBox.j", YES);
objj_executeFile("AddressTable.j", YES);
objj_executeFile("PeoplePicker.j", YES);
objj_executeFile("THRList.j", YES);

{var the_class = objj_allocateClassPair(TreeNodeViewController, "PeopleViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("rowInEditing"), new objj_ivar("tvcellFullname"), new objj_ivar("tvcellPhones"), new objj_ivar("tvcellEmails"), new objj_ivar("tvcellAddresses"), new objj_ivar("inEditingPerson"), new objj_ivar("editPersonAddressList"), new objj_ivar("editPersonPhoneList"), new objj_ivar("editPersonEmailList")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("inEditingPerson"), function $PeopleViewController__inEditingPerson(self, _cmd)
{ with(self)
{
return inEditingPerson;
}
},["id"]),
new objj_method(sel_getUid("setInEditingPerson:"), function $PeopleViewController__setInEditingPerson_(self, _cmd, newValue)
{ with(self)
{
inEditingPerson = newValue;
}
},["void","id"]), new objj_method(sel_getUid("refreshObjects"), function $PeopleViewController__refreshObjects(self, _cmd)
{ with(self)
{
    if( folderId )
    {
        var url;
        if( objj_msgSend(searchText, "length")>2)
            url=objj_msgSend(CPString, "stringWithFormat:", "https://iscrizioni.iltemporitrovato.org/gestione/PHP/contacts.php?task=LISTING&folder=%d&search=%@",folderId,searchText);
        else
            url=objj_msgSend(CPString, "stringWithFormat:", "%@%d","https://iscrizioni.iltemporitrovato.org/gestione/PHP/contacts.php?task=LISTING&folder=",folderId);
        var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
    listConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
    }
}
},["void"]), new objj_method(sel_getUid("loadView"), function $PeopleViewController__loadView(self, _cmd)
{ with(self)
{
    rowInEditing = -1;
    inEditingPerson = objj_msgSend(objj_msgSend(Person, "alloc"), "init");

    var containerView = objj_msgSend(objj_msgSend(CPSplitView, "alloc"), "initWithFrame:", CGRectMake(0,0,1000,500));
    objj_msgSend(containerView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    objj_msgSend(containerView, "setIsPaneSplitter:", YES);


    var listView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,0,600,500));
    var toolbarView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,0,600,50));
    objj_msgSend(toolbarView, "setAutoresizingMask:", CPViewWidthSizable);
    objj_msgSend(toolbarView, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));

    var addButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(20,13,120,24));

    objj_msgSend(addButton, "setTarget:", self);
    objj_msgSend(addButton, "setAction:", sel_getUid("addPerson:"));
    objj_msgSend(addButton, "setImage:", objj_msgSend(CPImage, "imageNamed:", "toolbar_quickentry.png"));

    var removeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(160,13,120,24));
    objj_msgSend(removeButton, "setTitle:", "Rimuovi");
    objj_msgSend(removeButton, "setTarget:", self);
    objj_msgSend(removeButton, "setAction:", sel_getUid("removePerson:"));

    var editButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(300,13,120,24));
    objj_msgSend(editButton, "setTitle:", "Modifica");
    objj_msgSend(editButton, "setTarget:", self);
    objj_msgSend(editButton, "setAction:", sel_getUid("editPerson:"));

    var peoplePicker = objj_msgSend(objj_msgSend(PeoplePicker, "alloc"), "initWithFrame:selectedObject:", CGRectMake(440,13,250,25), nil);

    var searchField = objj_msgSend(objj_msgSend(CPSearchField, "alloc"), "initWithFrame:", CGRectMake(460,10,120,30));
    objj_msgSend(searchField, "setAutoresizingMask:", CPViewMinXMargin);
    objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "searchText", (CPKeyValueObservingOptionNew), nil);
    objj_msgSend(self, "bind:toObject:withKeyPath:options:", "searchText", searchField, "objectValue", nil);

    objj_msgSend(toolbarView, "addSubview:", searchField);
    objj_msgSend(toolbarView, "addSubview:", addButton);
    objj_msgSend(toolbarView, "addSubview:", removeButton);
    objj_msgSend(toolbarView, "addSubview:", editButton);
    objj_msgSend(toolbarView, "addSubview:", peoplePicker);

    var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(0.0,50.0,600.0,450.0));
    objj_msgSend(scrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);

    var tableView = objj_msgSend(objj_msgSend(CPTableView, "alloc"), "initWithFrame:", objj_msgSend(scrollView, "bounds"));

    objj_msgSend(tableView, "setDelegate:", self);
    objj_msgSend(tableView, "setRowHeight:",  50.0);
    objj_msgSend(tableView, "setUsesAlternatingRowBackgroundColors:", YES);
    objj_msgSend(tableView, "setDoubleAction:", sel_getUid("selectRow:"));
    objj_msgSend(tableView, "setSelectionHighlightStyle:", CPTableViewSelectionHighlightStyleSourceList);
    objj_msgSend(tableView, "setTarget:", self);

    var fullnameColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "Nome");
    objj_msgSend(objj_msgSend(fullnameColumn, "headerView"), "setStringValue:", "Nome");
    objj_msgSend(fullnameColumn, "setWidth:", 210.0);

    tvcellFullname = objj_msgSend(objj_msgSend(TVCell_Fullname, "alloc"), "initWithFrame:", CGRectMake(0,0,200,50));
    objj_msgSend(tableView, "addTableColumn:", fullnameColumn);

    var phonesColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "Telefoni");
    objj_msgSend(objj_msgSend(phonesColumn, "headerView"), "setStringValue:", "Telefoni");
    objj_msgSend(phonesColumn, "setWidth:", 170.0);

    tvcellPhones = objj_msgSend(objj_msgSend(TVCell_Phones, "alloc"), "initWithFrame:", CGRectMake(0,0,160,50));
    objj_msgSend(tableView, "addTableColumn:", phonesColumn);

    var emailsColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "Email");
    objj_msgSend(objj_msgSend(emailsColumn, "headerView"), "setStringValue:", "Email");
    objj_msgSend(emailsColumn, "setWidth:", 220.0);

    tvcellEmails = objj_msgSend(objj_msgSend(TVCell_Emails, "alloc"), "initWithFrame:", CGRectMake(0,0,210,50));
    objj_msgSend(tableView, "addTableColumn:", emailsColumn);

    objj_msgSend(scrollView, "setDocumentView:", tableView);

    objj_msgSend(listView, "addSubview:", toolbarView);
    objj_msgSend(listView, "addSubview:", scrollView);


    var detailView = objj_msgSend(objj_msgSend(CPAccordionView, "alloc"), "initWithFrame:", CGRectMake(0,0,400,500));
    var profileTab = objj_msgSend(objj_msgSend(CPAccordionViewItem, "alloc"), "initWithIdentifier:", "0");
    objj_msgSend(profileTab, "setLabel:", "Dati anagrafici");
    objj_msgSend(profileTab, "setView:", objj_msgSend(self, "profileView"));
    var projectsTab = objj_msgSend(objj_msgSend(CPAccordionViewItem, "alloc"), "initWithIdentifier:", "1");
    var projectsView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,0,400,200));
    objj_msgSend(projectsTab, "setLabel:", "Progetti");
    objj_msgSend(projectsTab, "setView:", projectsView);
    var invoicesTab = objj_msgSend(objj_msgSend(CPAccordionViewItem, "alloc"), "initWithIdentifier:", "2");
    var invoicesView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,0,400,200));
    objj_msgSend(invoicesTab, "setLabel:", "Proforme e fatture");
    objj_msgSend(invoicesTab, "setView:", invoicesView);

    objj_msgSend(detailView, "addItem:", profileTab);
    objj_msgSend(detailView, "addItem:", projectsTab);
    objj_msgSend(detailView, "addItem:", invoicesTab);

    objj_msgSend(detailView, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));

    objj_msgSend(containerView, "addSubview:", listView);
    objj_msgSend(containerView, "addSubview:", detailView);
    objj_msgSend(containerView, "setPosition:ofDividerAtIndex:", 600.0, 0);

    objj_msgSend(fullnameColumn, "bind:toObject:withKeyPath:options:", "value", objectsArrayController, "arrangedObjects", nil);
    objj_msgSend(phonesColumn, "bind:toObject:withKeyPath:options:", "value", objectsArrayController, "arrangedObjects", nil);
    objj_msgSend(emailsColumn, "bind:toObject:withKeyPath:options:", "value", objectsArrayController, "arrangedObjects", nil);

    objj_msgSend(self, "setView:", containerView);

    theTableView = tableView;
}
},["void"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $PeopleViewController__observeValueForKeyPath_ofObject_change_context_(self, _cmd, keyPath, object, change, context)
{ with(self)
{
    if( objj_msgSend(keyPath, "isEqual:", "searchText") )
    {
        objj_msgSend(self, "refreshObjects");
        return;
    } else if( objj_msgSend(keyPath, "isEqual:", "frameSize") )
    {
        var oldFrame = objj_msgSend(change, "valueForKey:", CPKeyValueChangeOldKey);
        var newFrame = objj_msgSend(change, "valueForKey:", CPKeyValueChangeNewKey);
        var heightDiff = newFrame.height-oldFrame.height;
        if( object==editPersonAddressList )
        {
            var addressFrame = objj_msgSend(objj_msgSend(editPersonAddressList, "superview"), "frame");
            addressFrame.size.height += heightDiff;
            objj_msgSend(objj_msgSend(editPersonAddressList, "superview"), "setFrame:", addressFrame);
            var phoneFrame = objj_msgSend(objj_msgSend(editPersonPhoneList, "superview"), "frame");
            phoneFrame.origin.y += heightDiff;
            objj_msgSend(objj_msgSend(editPersonPhoneList, "superview"), "setFrame:", phoneFrame);
            var emailFrame = objj_msgSend(objj_msgSend(editPersonEmailList, "superview"), "frame");
            emailFrame.origin.y += heightDiff;
            objj_msgSend(objj_msgSend(editPersonEmailList, "superview"), "setFrame:", emailFrame);
        } else if( object==editPersonPhoneList )
        {
            var phoneFrame = objj_msgSend(objj_msgSend(editPersonPhoneList, "superview"), "frame");
            phoneFrame.size.height += heightDiff;
            objj_msgSend(objj_msgSend(editPersonPhoneList, "superview"), "setFrame:", phoneFrame);
            var emailFrame = objj_msgSend(objj_msgSend(editPersonEmailList, "superview"), "frame");
            emailFrame.origin.y += heightDiff;
            objj_msgSend(objj_msgSend(editPersonEmailList, "superview"), "setFrame:", emailFrame);
        } else if( object==editPersonEmailList )
        {
            var emailFrame = objj_msgSend(objj_msgSend(editPersonEmailList, "superview"), "frame");
            emailFrame.size.height += heightDiff;
            objj_msgSend(objj_msgSend(editPersonEmailList, "superview"), "setFrame:", emailFrame);
        }
        var superviewFrame = objj_msgSend(objj_msgSend(objj_msgSend(object, "superview"), "superview"), "frame");
        superviewFrame.size.height += heightDiff;
        objj_msgSend(objj_msgSend(objj_msgSend(object, "superview"), "superview"), "setFrame:", superviewFrame);
        return;
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("PeopleViewController").super_class }, "observeValueForKeyPath:ofObject:change:context:", keyPath, object, change, context);
}
},["void","CPString*","id","CPDictionary*","void*"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $PeopleViewController__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    if( connection == listConnection )
    {
        objj_msgSend(objects, "release");
        objects = objj_msgSend(CPArray, "array");
        objj_msgSend(objectsArrayController, "bind:toObject:withKeyPath:options:", "contentArray", self, "objects", nil);
        if( !objj_msgSend(data, "length") )
            return;
        var result = JSON.parse(data);
        var peopleCount = result.length;


        for( var i=0;i<peopleCount;i++ )
        {
            var personObj = result[i];
            var phonesArray = personObj.phones.split("::");
            var emailsArray = personObj.emails.split("::");
            var addressesArray = personObj.addresses.split("::");
            var person = objj_msgSend(objj_msgSend(Person, "alloc"), "init");
            person.index=personObj.id;
            person.name = personObj.name;
            person.surname = personObj.surname;
            person.companyName = personObj.companyName;
            person.tags = personObj.tags;
            person.privacy = personObj.privacy;
            person.fiscalID = personObj.fiscalID;
            person.VAT = personObj.VAT;

            person.isCompany = objj_msgSend(personObj.isCompany, "intValue");
            for( var j=0;j<phonesArray.length-1;j++ )
            {
                var phoneArray = phonesArray[j].split(";");
                objj_msgSend(person.phones, "addObject:", phoneArray);
            }
            for( var j=0;j<emailsArray.length-1;j++ )
            {
                var emailArray = emailsArray[j].split(";");
                objj_msgSend(person.emails, "addObject:", emailArray);
            }

            for( var j=0;j<addressesArray.length-1;j++ )
            {
                var addressArray = addressesArray[j].split(";");
                objj_msgSend(person.addresses, "addObject:", addressArray);
            }

            objj_msgSend(objectsArrayController, "addObject:", person);
        }
        listConnection=nil;
        objj_msgSend(theTableView, "reloadData");
    }
    if( connection==deleteConnection )
    {
        objj_msgSend(self, "errorFromResponse:", data);
        deleteConnection=nil;
        objj_msgSend(self, "refreshObjects");
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("addPerson:"), function $PeopleViewController__addPerson_(self, _cmd, sender)
{ with(self)
{
    var person=objj_msgSend(objj_msgSend(Person, "alloc"), "init");
    person.name = "Nuovo";
    person.surname ="Valore";
    objj_msgSend(objectsArrayController, "addObject:", person);
}
},["void","id"]), new objj_method(sel_getUid("removePerson:"), function $PeopleViewController__removePerson_(self, _cmd, sender)
{ with(self)
{
    var personArray=objj_msgSend(objectsArrayController, "selectedObjects");
    var person=nil;
    if( objj_msgSend(personArray, "count") )
        person = objj_msgSend(personArray, "objectAtIndex:", 0);

    if( person )
    {
        var index=person.index;
        var url=objj_msgSend(CPString, "stringWithFormat:", "%@","http://127.0.0.1/CRM2/PHP/contacts.php?task=DELETE");
        var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
        var content = objj_msgSend(CPString, "stringWithFormat:", "id=%d",index);
        objj_msgSend(request, "setHTTPMethod:", "POST");
        objj_msgSend(request, "setHTTPBody:", content);
        objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/x-www-form-urlencoded", "Content-Type");
        deleteConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
    }
}
},["void","id"]), new objj_method(sel_getUid("editPerson:"), function $PeopleViewController__editPerson_(self, _cmd, sender)
{ with(self)
{
    var personArray=objj_msgSend(objectsArrayController, "selectedObjects");
    var person=nil;
    if( objj_msgSend(personArray, "count") )
        person = objj_msgSend(personArray, "objectAtIndex:", 0);
    if( person )
    {
        objj_msgSend(person, "copyTo:", inEditingPerson);

        var index=person.index;
        var sharedEditingWindow = objj_msgSend(EditingWindow, "showEditingWindowWithView:delegate:endSelector:", objj_msgSend(self, "editPersonView"), self, sel_getUid("didEndEditContactSheet:"));
    }
}
},["void","id"]), new objj_method(sel_getUid("selectRow:"), function $PeopleViewController__selectRow_(self, _cmd, sender)
{ with(self)
{

    var aView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,0,450,350));
    objj_msgSend(aView, "setBackgroundColor:", objj_msgSend(CPColor, "lightGrayColor"));
    var phoneField = objj_msgSend(objj_msgSend(THRTextField_Email, "alloc"), "initWithFrame:", CGRectMake(20,20,250,28));
    objj_msgSend(phoneField, "setEditable:", YES);
    objj_msgSend(phoneField, "setBezeled:", YES);
    objj_msgSend(aView, "addSubview:", phoneField);
    var sharedEditingWindow = objj_msgSend(EditingWindow, "showEditingWindowWithView:delegate:endSelector:", aView, self, sel_getUid("didEndEditContactSheet:"));
}
},["void","id"]), new objj_method(sel_getUid("didEndEditContactSheet:"), function $PeopleViewController__didEndEditContactSheet_(self, _cmd, sheet)
{ with(self)
{
    self.inEdtingPerson=nil;
}
},["void","id"]), new objj_method(sel_getUid("tableView:dataViewForTableColumn:row:"), function $PeopleViewController__tableView_dataViewForTableColumn_row_(self, _cmd, aTableView, aTableColumn, aRow)
{ with(self)
{
    if( aTableColumn != nil)
    {
        if( objj_msgSend(objj_msgSend(aTableColumn, "identifier"), "isEqual:", "Nome") )
            return tvcellFullname;
        if( objj_msgSend(objj_msgSend(aTableColumn, "identifier"), "isEqual:", "Telefoni") )
            return tvcellPhones;
        if( objj_msgSend(objj_msgSend(aTableColumn, "identifier"), "isEqual:", "Email") )
            return tvcellEmails;
        if( objj_msgSend(objj_msgSend(aTableColumn, "identifier"), "isEqual:", "Indirizzo") )
            return tvcellAddresses;
    }
    return nil;
}
},["id","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("errorFromResponse:"), function $PeopleViewController__errorFromResponse_(self, _cmd, message)
{ with(self)
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
},["BOOL","CPString"]), new objj_method(sel_getUid("profileView"), function $PeopleViewController__profileView(self, _cmd)
{ with(self)
{
    var profileView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,0,400,500));


    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Dati generali", CGRectMake(20,20,120,25)));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Privacy", CGRectMake(20,155,120,25)));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Dati fiscali", CGRectMake(20,190,120,25)));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Indirizzo", CGRectMake(20,250,120,25)));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Telefoni", CGRectMake(20,285,120,25)));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Email", CGRectMake(20,320,120,25)));

    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRCheckBox, "checkboxWithTitle:frame:bindTo:withKeyPath:", "E' una società", CGRectMake(150,20,120,25), objectsArrayController, "selection.isCompany"));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Nome", CGRectMake(150,45,120,25), 0, objectsArrayController, "selection.name"));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Cognome", CGRectMake(150,70,120,25), 0, objectsArrayController, "selection.surname"));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Società", CGRectMake(150,95,120,25), 0, objectsArrayController, "selection.companyName"));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Etichette", CGRectMake(150,120,120,25), 0, objectsArrayController, "selection.tags"));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRCheckBox, "checkboxWithTitle:frame:bindTo:withKeyPath:", "Scheda compilata", CGRectMake(150,155,120,25), objectsArrayController, "selection.privacy"));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Codice fiscale", CGRectMake(150,190,120,25), 0, objectsArrayController, "selection.fiscalID"));
    objj_msgSend(profileView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Partita IVA", CGRectMake(150,215,120,25), 0, objectsArrayController, "selection.VAT"));


    return profileView;
}
},["CPView"]), new objj_method(sel_getUid("editPersonView"), function $PeopleViewController__editPersonView(self, _cmd)
{ with(self)
{
    var editPersonView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,0,900,355));


    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Dati generali", CGRectMake(20,20,120,25)));
    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRCheckBox, "checkboxWithTitle:frame:bindTo:withKeyPath:", "E' una società", CGRectMake(150,20,150,25), self.inEditingPerson, "isCompany"));
    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Nome", CGRectMake(150,45,200,25), 0, self, "inEditingPerson.name"));
    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Cognome", CGRectMake(150,70,200,25), 0, self.inEditingPerson, "surname"));
    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Società", CGRectMake(150,95,200,25), 0, self.inEditingPerson, "companyName"));
    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Etichette", CGRectMake(150,120,200,25), 0, self.inEditingPerson, "tags"));


    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Privacy", CGRectMake(20,155,120,25)));
    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRCheckBox, "checkboxWithTitle:frame:bindTo:withKeyPath:", "Scheda compilata", CGRectMake(150,155,150,25), self.inEditingPerson, "privacy"));


    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Dati fiscali", CGRectMake(20,190,120,25)));
    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Codice fiscale", CGRectMake(150,190,200,25), 0, self.inEditingPerson, "fiscalID"));
    objj_msgSend(editPersonView, "addSubview:", objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:", "Partita IVA", CGRectMake(150,215,200,25), 0, self.inEditingPerson, "VAT"));

    var minHeight;
    var yOrigin;


    var addressRowTemplate = objj_msgSend(objj_msgSend(THRRowTemplate, "alloc"), "initWithSubviewsArray:", objj_msgSend(CPArray, "arrayWithObjects:", 
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "etichette", CGRectMake(0,0,70,24), 0),
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "città", CGRectMake(0,0,130,24), 0),
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "indirizzo", CGRectMake(0,0,200,24), 0),
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "CAP", CGRectMake(0,0,50,24), 0),
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "provincia", CGRectMake(0,0,50,24), 0),
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "stato", CGRectMake(0,0,100,24), 0)
   ));
    minHeight = (objj_msgSend(inEditingPerson.addresses, "count") ? objj_msgSend(inEditingPerson.addresses, "count") : 1)*addressRowTemplate.height+5;
    yOrigin=250+minHeight;

    var editPersonAddressSection = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,250,900,minHeight));
    objj_msgSend(editPersonAddressSection, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Indirizzo", CGRectMake(20,0,120,25)));

    editPersonAddressList = objj_msgSend(objj_msgSend(THRList, "alloc"), "initWithFrame:rowTemplate:bindTo:withKeyPath:", CGRectMake(150,0,750,30), addressRowTemplate, self.inEditingPerson, "addresses");

    objj_msgSend(editPersonAddressSection, "addSubview:", editPersonAddressList);
    objj_msgSend(editPersonView, "addSubview:", editPersonAddressSection);



    var phoneRowTemplate = objj_msgSend(objj_msgSend(THRRowTemplate, "alloc"), "initWithSubviewsArray:", objj_msgSend(CPArray, "arrayWithObjects:", 
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "etichetta", CGRectMake(0,0,70,24), 0),
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "telefono", CGRectMake(0,0,200,24), 0)
   ));
    minHeight = (objj_msgSend(inEditingPerson.phones, "count") ? objj_msgSend(inEditingPerson.phones, "count") : 1)*phoneRowTemplate.height+5;

    var editPersonPhoneSection = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,yOrigin,900,minHeight));
    yOrigin += minHeight;

    objj_msgSend(editPersonPhoneSection, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Telefoni", CGRectMake(20,0,120,25)));

    editPersonPhoneList = objj_msgSend(objj_msgSend(THRList, "alloc"), "initWithFrame:rowTemplate:bindTo:withKeyPath:", CGRectMake(150,0,750,30), phoneRowTemplate, self.inEditingPerson, "phones");
    objj_msgSend(editPersonPhoneSection, "addSubview:", editPersonPhoneList);
    objj_msgSend(editPersonView, "addSubview:", editPersonPhoneSection);


    var emailRowTemplate = objj_msgSend(objj_msgSend(THRRowTemplate, "alloc"), "initWithSubviewsArray:", objj_msgSend(CPArray, "arrayWithObjects:", 
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "etichetta", CGRectMake(0,0,70,24), 0),
        objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", "email", CGRectMake(0,0,200,24), 0)
   ));
    minHeight = (objj_msgSend(inEditingPerson.emails, "count") ? objj_msgSend(inEditingPerson.emails, "count") : 1)*emailRowTemplate.height+5;

    var editPersonEmailSection = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,yOrigin,900,minHeight));
    yOrigin += minHeight;

    objj_msgSend(editPersonEmailSection, "addSubview:", objj_msgSend(THRLabel, "labelWithTitle:frame:", "Email", CGRectMake(20,0,120,25)));

    editPersonEmailList = objj_msgSend(objj_msgSend(THRList, "alloc"), "initWithFrame:rowTemplate:bindTo:withKeyPath:", CGRectMake(150,0,750,30), emailRowTemplate, self.inEditingPerson, "emails");
    objj_msgSend(editPersonEmailSection, "addSubview:", editPersonEmailList);
    objj_msgSend(editPersonView, "addSubview:", editPersonEmailSection);

    objj_msgSend(editPersonAddressList, "addObserver:forKeyPath:options:context:", self, "frameSize", (CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld), nil);
    objj_msgSend(editPersonPhoneList, "addObserver:forKeyPath:options:context:", self, "frameSize", (CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld), nil);
    objj_msgSend(editPersonEmailList, "addObserver:forKeyPath:options:context:", self, "frameSize", (CPKeyValueObservingOptionNew|CPKeyValueObservingOptionOld), nil);

    var frameView = objj_msgSend(editPersonView, "frame");
    frameView.size.height = yOrigin;
    objj_msgSend(editPersonView, "setFrame:", frameView);

    return editPersonView;
}
},["CPView"])]);
}

