@STATIC;1.0;p;14;AddressTable.jt;3131;@STATIC;1.0;I;21;Foundation/CPObject.ji;14;THRTableView.jt;3067;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("THRTableView.j", YES);

{var the_class = objj_allocateClassPair(THRTableView, "AddressTable"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("customColumns"), function $AddressTable__customColumns(self, _cmd)
{ with(self)
{
    var customColumns;

    var tagColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "0");
    objj_msgSend(tagColumn, "setWidth:", 60.0);
    var tagEditField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,60,25));
    objj_msgSend(tagEditField, "setPlaceholderString:", "Etichette");
    objj_msgSend(tagColumn, "setEditable:", YES);
    objj_msgSend(tagColumn, "setDataView:", tagEditField);

    var cityColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "1");
    objj_msgSend(cityColumn, "setWidth:", 100.0);
    var cityEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,100,25));
    objj_msgSend(cityEditfield, "setPlaceholderString:", "Città");
    objj_msgSend(cityColumn, "setEditable:", YES);
    objj_msgSend(cityColumn, "setDataView:", cityEditfield);

    var addressColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "2");
    objj_msgSend(addressColumn, "setWidth:", 150.0);
    var addessEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,150,25));
    objj_msgSend(addressColumn, "setEditable:", YES);
    objj_msgSend(addressColumn, "setDataView:", addessEditfield);

    var zipcodeColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "3");
    objj_msgSend(zipcodeColumn, "setWidth:", 60.0);
    var zipcodeEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,60,25));
    objj_msgSend(zipcodeColumn, "setEditable:", YES);
    objj_msgSend(zipcodeColumn, "setDataView:", zipcodeEditfield);

    var stateColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "4");
    objj_msgSend(stateColumn, "setWidth:", 60.0);
    var stateEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,60,25));
    objj_msgSend(stateColumn, "setEditable:", YES);
    objj_msgSend(stateColumn, "setDataView:", stateEditfield);

    var countryColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "5");
    objj_msgSend(countryColumn, "setWidth:", 100.0);
    var countryEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,100,25));
    objj_msgSend(countryColumn, "setEditable:", YES);
    objj_msgSend(countryEditfield, "setStringValue:", "Italia");
    objj_msgSend(countryColumn, "setDataView:", countryEditfield);

    customColumns = [tagColumn, cityColumn, addressColumn, zipcodeColumn, stateColumn, countryColumn];
    return customColumns;
}
},["CPArray"])]);
}

p;15;AppController.jt;6896;@STATIC;1.0;I;21;Foundation/CPObject.jI;22;AppKit/CPOutlineView.ji;8;Folder.ji;22;PeopleViewController.jt;6785;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPOutlineView.j", NO);
objj_executeFile("Folder.j", YES);
objj_executeFile("PeopleViewController.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow"), new objj_ivar("theScrollView"), new objj_ivar("theOutlineView"), new objj_ivar("detailView"), new objj_ivar("folders"), new objj_ivar("folderConnection"), new objj_ivar("peopleViewController"), new objj_ivar("currentView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{ with(self)
{
    CPLogRegister(CPLogPopup);
    var textColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "TextColumn");
    objj_msgSend(textColumn, "setWidth:", 140.0);
    objj_msgSend(theOutlineView, "setHeaderView:", nil);
    objj_msgSend(theOutlineView, "setCornerView:", nil);
    objj_msgSend(theOutlineView, "addTableColumn:", textColumn);
    objj_msgSend(theOutlineView, "setOutlineTableColumn:", textColumn);
    objj_msgSend(theOutlineView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "e0ecfa"));
    objj_msgSend(theScrollView, "setDocumentView:", theOutlineView);
    objj_msgSend(theScrollView, "setAutohidesScrollers:", YES);
    objj_msgSend(theOutlineView, "setDataSource:", self);
    objj_msgSend(theOutlineView, "setDelegate:", self);
    objj_msgSend(self, "refreshFolders");
 peopleViewController = objj_msgSend(objj_msgSend(PeopleViewController, "alloc"), "init");
 objj_msgSend(CPMenu, "setMenuBarVisible:", NO);
 currentView=nil;
}
},["void","CPNotification"]), new objj_method(sel_getUid("refreshFolders"), function $AppController__refreshFolders(self, _cmd)
{ with(self)
{
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", "https://iscrizioni.iltemporitrovato.org/gestione/PHP/folders.php?task=LISTING");
    folderConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $AppController__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    if( connection == folderConnection )
    {
        var result = JSON.parse(data);
        var foldersCount = result.length;
        var contactsFolders, projectsFolders, invoicesFolders, warnings, allFolders, allFoldersNames;
        contactsFolders = objj_msgSend(CPArray, "array");
        projectsFolders = objj_msgSend(CPArray, "array");
        invoicesFolders = objj_msgSend(CPArray, "array");
        warningsFolders = objj_msgSend(CPArray, "array");
        allFolders = objj_msgSend(CPArray, "arrayWithObjects:", contactsFolders, projectsFolders, invoicesFolders, warningsFolders,nil);
        allFoldersNames = objj_msgSend(CPArray, "arrayWithObjects:", "Progetti","Fatture","Contatti","Avvisi",nil);
        for( var i=0;i<foldersCount;i++ )
        {
            var folderObj = result[i];
            var folder = objj_msgSend(objj_msgSend(Folder, "alloc"), "initWithName:type:", folderObj.name, objj_msgSend(folderObj.type, "intValue"));
   folder.uindex = folderObj["id"];
            objj_msgSend(objj_msgSend(allFolders, "objectAtIndex:", objj_msgSend(folderObj.type, "intValue")), "addObject:", folder);
        }
        folders = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", allFolders, allFoldersNames);
        objj_msgSend(theOutlineView, "reloadData");
        folderConnection=nil;
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("outlineView:child:ofItem:"), function $AppController__outlineView_child_ofItem_(self, _cmd, outlineView, index, item)
{ with(self)
{
    if (item === nil)
    {
        var keys = objj_msgSend(folders, "allKeys");
        return objj_msgSend(keys, "objectAtIndex:", index);
    }
    else
    {
        var values = objj_msgSend(folders, "objectForKey:", item);
        return objj_msgSend(values, "objectAtIndex:", index);
    }
}
},["id","CPOutlineView","int","id"]), new objj_method(sel_getUid("outlineView:isItemExpandable:"), function $AppController__outlineView_isItemExpandable_(self, _cmd, outlineView, item)
{ with(self)
{
    var values = objj_msgSend(folders, "objectForKey:", item);
    return (objj_msgSend(values, "count") > 0);
}
},["BOOL","CPOutlineView","id"]), new objj_method(sel_getUid("outlineView:numberOfChildrenOfItem:"), function $AppController__outlineView_numberOfChildrenOfItem_(self, _cmd, outlineView, item)
{ with(self)
{
    if (item === nil)
    {
        return objj_msgSend(folders, "count");
    }
    else
    {
        var values = objj_msgSend(folders, "objectForKey:", item);
        return objj_msgSend(values, "count");
    }
}
},["int","CPOutlineView","id"]), new objj_method(sel_getUid("outlineView:objectValueForTableColumn:byItem:"), function $AppController__outlineView_objectValueForTableColumn_byItem_(self, _cmd, outlineView, tableColumn, item)
{ with(self)
{
    if( objj_msgSend(item, "isKindOfClass:", Folder) )
        return item.name;
    return item;
}
},["id","CPOutlineView","CPTableColumn","id"]), new objj_method(sel_getUid("outlineView:shouldSelectItem:"), function $AppController__outlineView_shouldSelectItem_(self, _cmd, outlineView, item)
{ with(self)
{
    if( objj_msgSend(item, "isKindOfClass:", Folder) )
        return YES;
 return NO;
}
},["BOOL","CPOutlineView","id"]), new objj_method(sel_getUid("outlineViewSelectionDidChange:"), function $AppController__outlineViewSelectionDidChange_(self, _cmd, notification)
{ with(self)
{
 if( objj_msgSend(notification, "object") === theOutlineView )
 {
  var folderObj =objj_msgSend(theOutlineView, "itemAtRow:", objj_msgSend(theOutlineView, "selectedRow"));
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
   newView = objj_msgSend(peopleViewController, "view");
  if( currentView && currentView != newView )
  {
   objj_msgSend(currentView, "retain");
   objj_msgSend(currentView, "removeFromSuperview");
  }
  if( newView )
  {
   viewController.folderId = folderObj.uindex;
   currentView = newView;
   objj_msgSend(currentView, "setFrame:", objj_msgSend(detailView, "bounds"));
   objj_msgSend(detailView, "addSubview:", currentView);
   objj_msgSend(viewController, "refreshObjects");
  }
 }
}
},["void","CPNotification"])]);
}

p;15;EditingWindow.jt;4182;@STATIC;1.0;I;21;Foundation/CPObject.jt;4137;

objj_executeFile("Foundation/CPObject.j", NO);

editingWindow = nil;

{var the_class = objj_allocateClassPair(CPObject, "EditingWindow"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("returnCode"), new objj_ivar("childView"), new objj_ivar("scrollView")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("childView"), function $EditingWindow__childView(self, _cmd)
{ with(self)
{
return childView;
}
},["id"]),
new objj_method(sel_getUid("setChildView:"), function $EditingWindow__setChildView_(self, _cmd, newValue)
{ with(self)
{
childView = newValue;
}
},["void","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("showEditingWindowWithView:delegate:endSelector:"), function $EditingWindow__showEditingWindowWithView_delegate_endSelector_(self, _cmd, aView, aDelegate, aSelector)
{ with(self)
{
    var application = objj_msgSend(CPApplication, "sharedApplication");

    if( !editingWindow )
    {
        editingWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0, 0, 500, 350), CPDocModalWindowMask | CPClosableWindowMask);
        var contentView = objj_msgSend(editingWindow, "contentView");
        objj_msgSend(contentView, "setBackgroundColor:", objj_msgSend(CPColor, "whiteColor"));
        var bounds = objj_msgSend(contentView, "bounds");

        var okButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:",  CGRectMake(380, 307, 100, 24));
        objj_msgSend(okButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
        objj_msgSend(okButton, "setTitle:", "OK");
        objj_msgSend(okButton, "setTarget:", self);
        objj_msgSend(okButton, "setBezelStyle:", CPRoundedBezelStyle);
        objj_msgSend(okButton, "setAction:", sel_getUid("okAction:"));
        objj_msgSend(contentView, "addSubview:", okButton);

        var cancelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:",  CGRectMake(260, 307, 100, 24));
        objj_msgSend(cancelButton, "setAutoresizingMask:", CPViewMinXMargin | CPViewMinYMargin);
        objj_msgSend(cancelButton, "setTitle:", "Annulla");
        objj_msgSend(cancelButton, "setTarget:", self);
        objj_msgSend(cancelButton, "setBezelStyle:", CPRoundedBezelStyle);
        objj_msgSend(cancelButton, "setAction:", sel_getUid("cancelAction:"));
        objj_msgSend(contentView, "addSubview:", cancelButton);

        scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(scrollView, "setAutohidesScrollers:", YES);
        objj_msgSend(contentView, "addSubview:", scrollView);
        childView = nil;
    }
    var bounds = objj_msgSend(aView, "bounds");
    var width = bounds.size.width+60;
    var height = bounds.size.height+100;

    objj_msgSend(editingWindow, "setFrameSize:", CGSizeMake(width, height));
    objj_msgSend(scrollView, "setFrame:", CGRectMake(20,20,bounds.size.width+20, bounds.size.height+20));
    objj_msgSend(scrollView, "setDocumentView:", aView);


    editingWindow.childView = aView;
    editingWindow.returnCode = 0;
    objj_msgSend(application, "beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:", editingWindow, objj_msgSend(application, "mainWindow"), aDelegate, aSelector, nil);

    return editingWindow;
}
},["CPWindow","CPView","id","SEL"]), new objj_method(sel_getUid("cancelAction:"), function $EditingWindow__cancelAction_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(editingWindow.childView, "removeFromSuperview");
 editingWindow.returnCode=0;
 var application = objj_msgSend(CPApplication, "sharedApplication");
 objj_msgSend(application, "endSheet:", editingWindow);
}
},["void","id"]), new objj_method(sel_getUid("okAction:"), function $EditingWindow__okAction_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(editingWindow.childView, "removeFromSuperview");
 editingWindow.returnCode=1;
 var application = objj_msgSend(CPApplication, "sharedApplication");
 objj_msgSend(application, "endSheet:", editingWindow);
}
},["void","id"])]);
}

p;8;Folder.jt;1461;@STATIC;1.0;I;21;Foundation/CPObject.jt;1416;


objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPObject, "Folder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("name"), new objj_ivar("type"), new objj_ivar("uindex")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("name"), function $Folder__name(self, _cmd)
{ with(self)
{
return name;
}
},["id"]),
new objj_method(sel_getUid("setName:"), function $Folder__setName_(self, _cmd, newValue)
{ with(self)
{
name = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("type"), function $Folder__type(self, _cmd)
{ with(self)
{
return type;
}
},["id"]),
new objj_method(sel_getUid("setType:"), function $Folder__setType_(self, _cmd, newValue)
{ with(self)
{
type = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("uindex"), function $Folder__uindex(self, _cmd)
{ with(self)
{
return uindex;
}
},["id"]),
new objj_method(sel_getUid("setUindex:"), function $Folder__setUindex_(self, _cmd, newValue)
{ with(self)
{
uindex = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithName:type:"), function $Folder__initWithName_type_(self, _cmd, aName, aType)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Folder").super_class }, "init"))
    {
        name=aName;
        type=aType;
    }
    return self;
}
},["id","CPString","int"])]);
}

p;6;main.jt;295;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;209;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
objj_executeFile("AppController.j", YES);
main= function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}

p;14;PeoplePicker.jt;1830;@STATIC;1.0;I;21;Foundation/CPObject.ji;11;THRPicker.ji;8;Person.jt;1757;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("THRPicker.j", YES);
objj_executeFile("Person.j", YES);

{var the_class = objj_allocateClassPair(THRPicker, "PeoplePicker"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("objectFromJSON:"), function $PeoplePicker__objectFromJSON_(self, _cmd, jsonString)
{ with(self)
{
    var addressesArray = jsonString.addresses.split("::");
    var person = objj_msgSend(objj_msgSend(Person, "alloc"), "init");
    person.index=jsonString.id;
    person.name = jsonString.name;
    person.surname = jsonString.surname;
    person.companyName = jsonString.companyName;
    person.isCompany = objj_msgSend(jsonString.isCompany, "intValue");
    for( var j=0;j<addressesArray.length-1;j++ )
    {
        var addressArray = addressesArray[j].split(";");
        var dictionaryEntry = objj_msgSend(objj_msgSend(DictionaryEntry, "alloc"), "initWithValue:forKey:", addressArray[1], addressArray[2]);
        objj_msgSend(person.addresses, "addObject:", dictionaryEntry);
    }
    return person;
}
},["id","CPString"]), new objj_method(sel_getUid("urlWithSearchString:"), function $PeoplePicker__urlWithSearchString_(self, _cmd, searchText)
{ with(self)
{
    var url = nil;
    if( objj_msgSend(searchText, "length")>2)
        url=objj_msgSend(CPString, "stringWithFormat:", "https://iscrizioni.iltemporitrovato.org/gestione/PHP/contacts.php?task=LISTING&search=%@",searchText);
    return url;
}
},["CPString","CPString"]), new objj_method(sel_getUid("descriptionForObject:"), function $PeoplePicker__descriptionForObject_(self, _cmd, aObject)
{ with(self)
{
    return objj_msgSend(aObject, "fullName");
}
},["CPString","id"])]);
}

p;22;PeopleViewController.jt;29034;@STATIC;1.0;I;21;Foundation/CPObject.jI;24;AppKit/CPAccordionView.ji;24;TreenodeViewController.ji;8;Person.ji;17;TVCell_Fullname.ji;15;TVCell_Phones.ji;18;TVCell_Addresses.ji;15;TVCell_Emails.ji;15;EditingWindow.ji;14;THRTextField.ji;10;THRLabel.ji;13;THRCheckBox.ji;14;AddressTable.ji;14;PeoplePicker.ji;9;THRList.jt;28710;

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

p;8;Person.jt;6110;@STATIC;1.0;I;21;Foundation/CPObject.jt;6065;

objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPObject, "Person"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("index"), new objj_ivar("name"), new objj_ivar("surname"), new objj_ivar("companyName"), new objj_ivar("tags"), new objj_ivar("fiscalID"), new objj_ivar("VAT"), new objj_ivar("addresses"), new objj_ivar("phones"), new objj_ivar("emails"), new objj_ivar("isCompany"), new objj_ivar("privacy")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("index"), function $Person__index(self, _cmd)
{ with(self)
{
return index;
}
},["id"]),
new objj_method(sel_getUid("setIndex:"), function $Person__setIndex_(self, _cmd, newValue)
{ with(self)
{
index = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("name"), function $Person__name(self, _cmd)
{ with(self)
{
return name;
}
},["id"]),
new objj_method(sel_getUid("setName:"), function $Person__setName_(self, _cmd, newValue)
{ with(self)
{
name = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("surname"), function $Person__surname(self, _cmd)
{ with(self)
{
return surname;
}
},["id"]),
new objj_method(sel_getUid("setSurname:"), function $Person__setSurname_(self, _cmd, newValue)
{ with(self)
{
surname = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("companyName"), function $Person__companyName(self, _cmd)
{ with(self)
{
return companyName;
}
},["id"]),
new objj_method(sel_getUid("setCompanyName:"), function $Person__setCompanyName_(self, _cmd, newValue)
{ with(self)
{
companyName = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("tags"), function $Person__tags(self, _cmd)
{ with(self)
{
return tags;
}
},["id"]),
new objj_method(sel_getUid("setTags:"), function $Person__setTags_(self, _cmd, newValue)
{ with(self)
{
tags = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("fiscalID"), function $Person__fiscalID(self, _cmd)
{ with(self)
{
return fiscalID;
}
},["id"]),
new objj_method(sel_getUid("setFiscalID:"), function $Person__setFiscalID_(self, _cmd, newValue)
{ with(self)
{
fiscalID = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("VAT"), function $Person__VAT(self, _cmd)
{ with(self)
{
return VAT;
}
},["id"]),
new objj_method(sel_getUid("setVAT:"), function $Person__setVAT_(self, _cmd, newValue)
{ with(self)
{
VAT = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("addresses"), function $Person__addresses(self, _cmd)
{ with(self)
{
return addresses;
}
},["id"]),
new objj_method(sel_getUid("setAddresses:"), function $Person__setAddresses_(self, _cmd, newValue)
{ with(self)
{
addresses = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("phones"), function $Person__phones(self, _cmd)
{ with(self)
{
return phones;
}
},["id"]),
new objj_method(sel_getUid("setPhones:"), function $Person__setPhones_(self, _cmd, newValue)
{ with(self)
{
phones = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("emails"), function $Person__emails(self, _cmd)
{ with(self)
{
return emails;
}
},["id"]),
new objj_method(sel_getUid("setEmails:"), function $Person__setEmails_(self, _cmd, newValue)
{ with(self)
{
emails = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("isCompany"), function $Person__isCompany(self, _cmd)
{ with(self)
{
return isCompany;
}
},["id"]),
new objj_method(sel_getUid("setIsCompany:"), function $Person__setIsCompany_(self, _cmd, newValue)
{ with(self)
{
isCompany = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("privacy"), function $Person__privacy(self, _cmd)
{ with(self)
{
return privacy;
}
},["id"]),
new objj_method(sel_getUid("setPrivacy:"), function $Person__setPrivacy_(self, _cmd, newValue)
{ with(self)
{
privacy = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $Person__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Person").super_class }, "init"))
    {
        name="";
        surname="";
        isCompany=NO;
        addresses=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
        phones=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
        emails=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("fullName"), function $Person__fullName(self, _cmd)
{ with(self)
{
 return (self.isCompany?self.companyName:(self.surname+" "+self.name));
}
},["CPString"]), new objj_method(sel_getUid("copyTo:"), function $Person__copyTo_(self, _cmd, aPerson)
{ with(self)
{
    aPerson.name=name;
    aPerson.surname=surname;
    aPerson.companyName=companyName;
    aPerson.tags=tags;
    aPerson.fiscalID=fiscalID;
    aPerson.VAT=VAT;
    aPerson.addresses=addresses;
    aPerson.phones=phones;
    aPerson.emails=emails;
    aPerson.isCompany=isCompany;
    aPerson.privacy=privacy;
}
},["void","Person"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "DictionaryEntry"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("key"), new objj_ivar("value")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("key"), function $DictionaryEntry__key(self, _cmd)
{ with(self)
{
return key;
}
},["id"]),
new objj_method(sel_getUid("setKey:"), function $DictionaryEntry__setKey_(self, _cmd, newValue)
{ with(self)
{
key = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("value"), function $DictionaryEntry__value(self, _cmd)
{ with(self)
{
return value;
}
},["id"]),
new objj_method(sel_getUid("setValue:"), function $DictionaryEntry__setValue_(self, _cmd, newValue)
{ with(self)
{
value = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithValue:forKey:"), function $DictionaryEntry__initWithValue_forKey_(self, _cmd, aValue, aKey)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DictionaryEntry").super_class }, "init"))
    {
        key=aKey;
        value=aValue;
    }
    return self;
}
},["id","CPString","CPString"])]);
}

p;13;THRCheckBox.jt;1259;@STATIC;1.0;I;21;Foundation/CPObject.jt;1214;

objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPCheckBox, "THRCheckBox"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("checkboxWithTitle:frame:"), function $THRCheckBox__checkboxWithTitle_frame_(self, _cmd, aTitle, aFrame)
{ with(self)
{
    var checkbox = objj_msgSend(objj_msgSend(THRCheckBox, "alloc"), "initWithFrame:", aFrame);
    if (checkbox)
    {
        objj_msgSend(checkbox, "setTitle:", aTitle);
        objj_msgSend(checkbox, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 15));
    }
    return checkbox;
}
},["THRCheckBox","CPString","CGRect"]), new objj_method(sel_getUid("checkboxWithTitle:frame:bindTo:withKeyPath:"), function $THRCheckBox__checkboxWithTitle_frame_bindTo_withKeyPath_(self, _cmd, aTitle, aFrame, aController, aKeyPath)
{ with(self)
{
    var checkbox = objj_msgSend(THRCheckBox, "checkboxWithTitle:frame:", aTitle, aFrame);
    if (checkbox)
    {
        objj_msgSend(checkbox, "bind:toObject:withKeyPath:options:", "objectValue", aController, aKeyPath, nil);
    }
    return checkbox;
}
},["THRCheckBox","CPString","CGRect","id","CPString"])]);
}

p;10;THRLabel.jt;995;@STATIC;1.0;I;21;Foundation/CPObject.jt;951;


objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPTextField, "THRLabel"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("labelWithTitle:frame:"), function $THRLabel__labelWithTitle_frame_(self, _cmd, aTitle, aFrame)
{ with(self)
{
    var textField = objj_msgSend(objj_msgSend(THRLabel, "alloc"), "initWithFrame:", aFrame);
    if (textField)
    {
        objj_msgSend(textField, "setStringValue:", aTitle);
        objj_msgSend(textField, "setValue:forThemeAttribute:", CPRightTextAlignment, "alignment");
        objj_msgSend(textField, "setValue:forThemeAttribute:", objj_msgSend(CPColor, "colorWithHexString:", "004EDE"), "text-color");
        objj_msgSend(textField, "setValue:forThemeAttribute:", objj_msgSend(CPFont, "systemFontOfSize:", 14.0), "font");
    }
    return textField;
}
},["THRLabel","CPString","CGRect"])]);
}

p;9;THRList.jt;5157;@STATIC;1.0;I;15;AppKit/CPView.ji;16;THRRowTemplate.jt;5097;

objj_executeFile("AppKit/CPView.j", NO);
objj_executeFile("THRRowTemplate.j", YES);

{var the_class = objj_allocateClassPair(CPView, "THRList"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("contentArray"), new objj_ivar("rowTemplate"), new objj_ivar("contentString")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentString"), function $THRList__contentString(self, _cmd)
{ with(self)
{
return contentString;
}
},["id"]),
new objj_method(sel_getUid("setContentString:"), function $THRList__setContentString_(self, _cmd, newValue)
{ with(self)
{
contentString = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:rowTemplate:bindTo:withKeyPath:"), function $THRList__initWithFrame_rowTemplate_bindTo_withKeyPath_(self, _cmd, aRect, aRowTemplate, aController, aKeyPath)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("THRList").super_class }, "initWithFrame:", aRect))
    {
        rowTemplate = aRowTemplate;
        contentArray = objj_msgSend(CPArray, "array");

        objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "contentArray", (CPKeyValueObservingOptionNew), nil);
        objj_msgSend(self, "bind:toObject:withKeyPath:options:", "contentArray", aController, aKeyPath, nil);

    }
    return self;
}
},["id","CGRect","THRRowTemplate","id","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $THRList__observeValueForKeyPath_ofObject_change_context_(self, _cmd, keyPath, object, change, context)
{ with(self)
{
    if( objj_msgSend(keyPath, "isEqual:", "contentArray") )
    {
        if( contentArray )
        {
            objj_msgSend(self, "updateLayout");
        }
        return;
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("THRList").super_class }, "observeValueForKeyPath:ofObject:change:context:", keyPath, object, change, context);
}
},["void","CPString*","id","CPDictionary*","void*"]), new objj_method(sel_getUid("updateLayout"), function $THRList__updateLayout(self, _cmd)
{ with(self)
{
    var rowsCount = objj_msgSend(contentArray, "count");
    var rowHeight = rowTemplate.height;
    var rowWidth = objj_msgSend(self, "bounds").size.width-100;
    var frameHeight = rowHeight * rowsCount;
    var frameWidth = rowWidth + 100.0;
    var oldFrame = objj_msgSend(self, "frame");
    var subViewsCount = objj_msgSend(objj_msgSend(self, "subviews"), "count");
    for( var i=subViewsCount-1;i>=0;i--)
        objj_msgSend(objj_msgSend(objj_msgSend(self, "subviews"), "objectAtIndex:", i), "removeFromSuperview");
    var odd=YES;
    for( var i=0;i<rowsCount; i++ )
    {
        var newRow = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,0+rowHeight*i,frameWidth, rowHeight));
        if( (i>0) || (i==0 && rowsCount>1) )
        {
            var removeButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(rowWidth+5.0,(rowHeight-24)/2.0,40,24));
            objj_msgSend(removeButton, "setTitle:", "-");
            objj_msgSend(removeButton, "setBezelStyle:", CPRoundedBezelStyle);
            objj_msgSend(removeButton, "setTarget:", self);
            objj_msgSend(removeButton, "setAction:", sel_getUid("removeRow:"));
            objj_msgSend(removeButton, "setTag:", (100+i));
            objj_msgSend(newRow, "addSubview:", removeButton);
        }
        if( i==(rowsCount-1) )
        {
            var addButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(rowWidth+50.0,(rowHeight-24)/2.0,40,24));
            objj_msgSend(addButton, "setTitle:", "+");
            objj_msgSend(addButton, "setBezelStyle:", CPRoundedBezelStyle);
            objj_msgSend(addButton, "setTarget:", self);
            objj_msgSend(addButton, "setAction:", sel_getUid("addRow:"));
            objj_msgSend(newRow, "addSubview:", addButton);
        }
        odd=!odd;
        if( odd )
        {
            objj_msgSend(newRow, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "E0ECFA"));
        }
        var newRowTemplate =objj_msgSend(rowTemplate, "newRowAtIndex:withContent:", i, objj_msgSend(contentArray, "objectAtIndex:", i));
        objj_msgSend(newRow, "addSubview:", newRowTemplate);
        objj_msgSend(self, "addSubview:", newRow);
    }
    objj_msgSend(self, "setFrame:", CGRectMake(oldFrame.origin.x, oldFrame.origin.y, frameWidth, frameHeight));
}
},["void"]), new objj_method(sel_getUid("removeRow:"), function $THRList__removeRow_(self, _cmd, sender)
{ with(self)
{
    var rowIndex = objj_msgSend(sender, "tag")-100;
    objj_msgSend(contentArray, "removeObjectAtIndex:", rowIndex);
    objj_msgSend(self, "updateLayout");
}
},["void","id"]), new objj_method(sel_getUid("addRow:"), function $THRList__addRow_(self, _cmd, sender)
{ with(self)
{
    objj_msgSend(contentArray, "addObject:", objj_msgSend(rowTemplate, "defaultRowString"));
    objj_msgSend(self, "updateLayout");
}
},["void","id"])]);
}

p;11;THRPicker.jt;6906;@STATIC;1.0;I;21;Foundation/CPObject.jt;6861;

objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPButton, "THRPicker"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("overlayWindow"), new objj_ivar("objects"), new objj_ivar("searchText"), new objj_ivar("listConnection"), new objj_ivar("tableView"), new objj_ivar("searchField"), new objj_ivar("selectedObject")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("selectedObject"), function $THRPicker__selectedObject(self, _cmd)
{ with(self)
{
return selectedObject;
}
},["id"]), new objj_method(sel_getUid("initWithFrame:selectedObject:"), function $THRPicker__initWithFrame_selectedObject_(self, _cmd, frame, aObject)
{ with(self)
{
    frame.size = CGSizeMake(250,25);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("THRPicker").super_class }, "initWithFrame:", frame);
    if( !self )
        return nil;

    overlayWindow = objj_msgSend(objj_msgSend(CPWindow, "alloc"), "initWithContentRect:styleMask:", CGRectMake(0, 0, 250, 175), CPBorderlessWindowMask);
    objj_msgSend(overlayWindow, "setHasShadow:", YES);
    var contentView = objj_msgSend(overlayWindow, "contentView");

    objj_msgSend(self, "setTarget:", self);
    objj_msgSend(self, "setAction:", sel_getUid("togglePicker:"));
    if( aObject )
    {
        selectedObject = aObject;
        objj_msgSend(self, "setStringValue:", objj_msgSend(self, "descriptionForObject:", aObject));
    }
    else
    {
        selectedObject = nil;
        objj_msgSend(self, "setTitle:", "Clicca per scegliere");
    }

    searchField = objj_msgSend(objj_msgSend(CPSearchField, "alloc"), "initWithFrame:", CGRectMake(1,0,248,30));
    objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "searchText", (CPKeyValueObservingOptionNew), nil);
    objj_msgSend(self, "bind:toObject:withKeyPath:options:", "searchText", searchField, "objectValue", nil);

    var scrollView = objj_msgSend(objj_msgSend(CPScrollView, "alloc"), "initWithFrame:", CGRectMake(1,30,248,145));
    objj_msgSend(scrollView, "setAutoresizingMask:", CPViewWidthSizable | CPViewHeightSizable);
    searchText=nil;
    selectedObject = nil;
    tableView = objj_msgSend(objj_msgSend(CPTableView, "alloc"), "initWithFrame:", objj_msgSend(scrollView, "bounds"));
    objj_msgSend(tableView, "setDelegate:", self);
    objj_msgSend(tableView, "setDataSource:", self);
    objj_msgSend(tableView, "setRowHeight:",  20.0);
    objj_msgSend(tableView, "setUsesAlternatingRowBackgroundColors:", YES);
    objj_msgSend(tableView, "setTarget:", self);
    objj_msgSend(tableView, "setAction:", sel_getUid("selectRow:"));
    objj_msgSend(tableView, "setHeaderView:", nil);
    objj_msgSend(tableView, "setCornerView:", nil);

    var fullnameColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "Nome");
    objj_msgSend(fullnameColumn, "setWidth:", 248.0);
    objj_msgSend(tableView, "addTableColumn:", fullnameColumn);
    objj_msgSend(scrollView, "setDocumentView:", tableView);

    objj_msgSend(contentView, "addSubview:", searchField);
    objj_msgSend(contentView, "addSubview:", scrollView);

    return self;
}
},["id","CGRect","id"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $THRPicker__observeValueForKeyPath_ofObject_change_context_(self, _cmd, keyPath, object, change, context)
{ with(self)
{
    if( objj_msgSend(keyPath, "isEqual:", "searchText") )
    {
        objj_msgSend(self, "refreshObjects");
        return;
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("THRPicker").super_class }, "observeValueForKeyPath:ofObject:change:context:", keyPath, object, change, context);
}
},["void","CPString*","id","CPDictionary*","void*"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $THRPicker__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    if( connection == listConnection )
    {
        objj_msgSend(objects, "release");
        objects = objj_msgSend(CPArray, "array");
        if( !objj_msgSend(data, "length") )
        {
            objj_msgSend(tableView, "reloadData");
            return;
        }
        var result = JSON.parse(data);
        var objectsCount = result.length;
        for( var i=0;i<objectsCount;i++ )
        {
            var object = objj_msgSend(self, "objectFromJSON:", result[i]);
            objj_msgSend(objects, "addObject:", object);
        }
        listConnection=nil;
        objj_msgSend(tableView, "reloadData");
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("refreshObjects"), function $THRPicker__refreshObjects(self, _cmd)
{ with(self)
{
    var url = objj_msgSend(self, "urlWithSearchString:", searchText);
    if( url )
    {
        var request = objj_msgSend(CPURLRequest, "requestWithURL:", url);
        listConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
    }
    else
    {
        objj_msgSend(objects, "removeAllObjects");
        objj_msgSend(tableView, "reloadData");
    }
}
},["void"]), new objj_method(sel_getUid("togglePicker:"), function $THRPicker__togglePicker_(self, _cmd, sender)
{ with(self)
{
    if( !objj_msgSend(overlayWindow, "isVisible") )
    {
        var newPoint = objj_msgSend(self, "convertPointToBase:", CGPointMake(0,25));
        self.searchText = "";
        objj_msgSend(searchField, "setStringValue:", "");
        objj_msgSend(objects, "removeAllObjects");
        objj_msgSend(tableView, "reloadData");

        objj_msgSend(overlayWindow, "setFrameOrigin:", newPoint);
        objj_msgSend(overlayWindow, "orderFront:", self);
    }
    else
    {
        objj_msgSend(overlayWindow, "orderOut:", self);
    }
}
},["void","id"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $THRPicker__numberOfRowsInTableView_(self, _cmd, aTableView)
{ with(self)
{
    return objj_msgSend(objects, "count");
}
},["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $THRPicker__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aTableColumn, aRow)
{ with(self)
{
    var obj = objj_msgSend(objects, "objectAtIndex:", aRow);
    return objj_msgSend(self, "descriptionForObject:", obj);
}
},["id","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("selectRow:"), function $THRPicker__selectRow_(self, _cmd, sender)
{ with(self)
{
    var aRow = objj_msgSend(tableView, "selectedRow");
    if( aRow != -1 )
    {
        selectedObject = objj_msgSend(objects, "objectAtIndex:", aRow);
        objj_msgSend(self, "setTitle:", objj_msgSend(self, "descriptionForObject:", selectedObject));
        objj_msgSend(overlayWindow, "orderOut:", self);
    }
}
},["void","id"])]);
}

p;16;THRRowTemplate.jt;3203;@STATIC;1.0;I;21;Foundation/CPObject.jt;3158;

objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPObject, "THRRowTemplate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("subviewsArray"), new objj_ivar("height"), new objj_ivar("width")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("height"), function $THRRowTemplate__height(self, _cmd)
{ with(self)
{
return height;
}
},["id"]),
new objj_method(sel_getUid("width"), function $THRRowTemplate__width(self, _cmd)
{ with(self)
{
return width;
}
},["id"]), new objj_method(sel_getUid("initWithSubviewsArray:"), function $THRRowTemplate__initWithSubviewsArray_(self, _cmd, aSubviewsArray)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("THRRowTemplate").super_class }, "init"))
    {
        width=5.0;
        height=3.0;

        subviewsArray = aSubviewsArray;
        var c=objj_msgSend(subviewsArray, "count");
        for( var i=0;i<c;i++ )
        {
            var currentView = objj_msgSend(subviewsArray, "objectAtIndex:", i);
            var oldViewFrame = objj_msgSend(currentView, "frame");
            height = (height>6.0+oldViewFrame.size.height ? height : 6.0+oldViewFrame.size.height);
        }

        for( var i=0;i<c;i++ )
        {
            var currentView = objj_msgSend(subviewsArray, "objectAtIndex:", i);
            var oldViewFrame = objj_msgSend(currentView, "frame");
            var newViewFrame = CGRectMake(width, (height-oldViewFrame.size.height)/2.0,oldViewFrame.size.width, oldViewFrame.size.height);
            width += (oldViewFrame.size.width+8);
            objj_msgSend(currentView, "setFrame:", newViewFrame);
        }
        width -= (i ? 3 : 0);
    }
    return self;
}
},["id","CPArray"]), new objj_method(sel_getUid("newRowAtIndex:withContent:"), function $THRRowTemplate__newRowAtIndex_withContent_(self, _cmd, aIndex, content)
{ with(self)
{
    var c=objj_msgSend(subviewsArray, "count");
    var d=objj_msgSend(content, "count");

    var newRow = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMake(0,0,width, height));
    for( var i=0;i<c;i++ )
    {
        var currentView = objj_msgSend(objj_msgSend(subviewsArray, "objectAtIndex:", i), "copy");
        if( i<d )
        {

            if( objj_msgSend(currentView, "isKindOfClass:", CPClassFromString("CPTextField")) )
            {
                objj_msgSend(currentView, "setStringValue:", objj_msgSend(content, "objectAtIndex:", i));
            }
        }
        objj_msgSend(currentView, "setTag:", (aIndex*1000+i));
        objj_msgSend(newRow, "addSubview:", currentView);
    }
    return newRow;
}
},["id","int","CPArray"]), new objj_method(sel_getUid("defaultRowString"), function $THRRowTemplate__defaultRowString(self, _cmd)
{ with(self)
{
    var c=objj_msgSend(subviewsArray, "count");
    var newContent = objj_msgSend(CPArray, "array");
    for( var i=0;i<c;i++ )
    {
        var currentView = objj_msgSend(subviewsArray, "objectAtIndex:", i);
        objj_msgSend(newContent, "addObject:", "");
    }
    return newContent;
}
},["id"])]);
}

p;14;THRTableView.jt;4299;@STATIC;1.0;I;21;Foundation/CPObject.jt;4254;

objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPTableView, "THRTableView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("contentArray"), new objj_ivar("contentString")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("contentString"), function $THRTableView__contentString(self, _cmd)
{ with(self)
{
return contentString;
}
},["id"]),
new objj_method(sel_getUid("setContentString:"), function $THRTableView__setContentString_(self, _cmd, newValue)
{ with(self)
{
contentString = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:bindTo:withKeyPath:"), function $THRTableView__initWithFrame_bindTo_withKeyPath_(self, _cmd, frame, aController, aKeyPath)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("THRTableView").super_class }, "initWithFrame:", frame);
    if( self )
    {
        var customColumns = objj_msgSend(self, "customColumns");
        var c=objj_msgSend(customColumns, "count");
        for( var i=0;i<c;i++ )
        {
            objj_msgSend(self, "addTableColumn:", objj_msgSend(customColumns, "objectAtIndex:", i));
        }
        contentArray = objj_msgSend(CPArray, "array");
        objj_msgSend(self, "setDataSource:", self);
        objj_msgSend(self, "setDelegate:", self);
        objj_msgSend(self, "setUsesAlternatingRowBackgroundColors:", YES);
        objj_msgSend(self, "setHeaderView:", nil);
        objj_msgSend(self, "setCornerView:", nil);

        objj_msgSend(self, "addObserver:forKeyPath:options:context:", self, "contentString", (CPKeyValueObservingOptionNew), nil);
        objj_msgSend(self, "bind:toObject:withKeyPath:options:", "contentString", aController, aKeyPath, nil);
    }
    return self;
}
},["id","CGRect","id","CPString"]), new objj_method(sel_getUid("observeValueForKeyPath:ofObject:change:context:"), function $THRTableView__observeValueForKeyPath_ofObject_change_context_(self, _cmd, keyPath, object, change, context)
{ with(self)
{
    if( objj_msgSend(keyPath, "isEqual:", "contentString") )
    {
        if( contentString )
        {
            var tmpArray = contentString.split("##");
            var c=objj_msgSend(tmpArray, "count");
            objj_msgSend(contentArray, "removeAllObjects");
            for( var i=0;i<c;i++ )
            {
                var objectArray = objj_msgSend(tmpArray, "objectAtIndex:", i).split(";");
                objj_msgSend(contentArray, "addObject:", objectArray);
            }
            objj_msgSend(self, "reloadData");
        }
        return;
    }
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("THRTableView").super_class }, "observeValueForKeyPath:ofObject:change:context:", keyPath, object, change, context);
}
},["void","CPString*","id","CPDictionary*","void*"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $THRTableView__numberOfRowsInTableView_(self, _cmd, aTableView)
{ with(self)
{
    return objj_msgSend(contentArray, "count");
}
},["int","CPTableView"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $THRTableView__tableView_objectValueForTableColumn_row_(self, _cmd, aTableView, aTableColumn, aRow)
{ with(self)
{
    var obj = objj_msgSend(objj_msgSend(contentArray, "objectAtIndex:", aRow), "objectAtIndex:", objj_msgSend(objj_msgSend(aTableColumn, "identifier"), "intValue"));
    return obj;
}
},["id","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("tableView:shouldEditTableColumn:row:"), function $THRTableView__tableView_shouldEditTableColumn_row_(self, _cmd, aTableView, aTableColumn, aRow)
{ with(self)
{
    return YES;
}
},["BOOL","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("tableView:setObjectValue:forTableColumn:row:"), function $THRTableView__tableView_setObjectValue_forTableColumn_row_(self, _cmd, aTableView, anObject, aTableColumn, aRow)
{ with(self)
{
    objj_msgSend(objj_msgSend(contentArray, "objectAtIndex:", aRow), "replaceObjectAtIndex:withObject:", objj_msgSend(objj_msgSend(aTableColumn, "identifier"), "intValue"), anObject);
    return;
}
},["void","CPTableView","id","CPTableColumn","int"])]);
}

p;14;THRTextField.jt;3849;@STATIC;1.0;I;21;Foundation/CPObject.jt;3804;

objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPTextField, "THRTextField"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("validationMask")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("validationMask"), function $THRTextField__validationMask(self, _cmd)
{ with(self)
{
return validationMask;
}
},["id"]),
new objj_method(sel_getUid("setValidationMask:"), function $THRTextField__setValidationMask_(self, _cmd, newValue)
{ with(self)
{
validationMask = newValue;
}
},["void","id"]), new objj_method(sel_getUid("copy"), function $THRTextField__copy(self, _cmd)
{ with(self)
{
    var newObject = objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", objj_msgSend(self, "placeholderString"), objj_msgSend(self, "frame"), validationMask);
    return newObject;
}
},["THRTextField"]), new objj_method(sel_getUid("validateValueSelf"), function $THRTextField__validateValueSelf(self, _cmd)
{ with(self)
{
}
},["CPString"]), new objj_method(sel_getUid("insertNewline:"), function $THRTextField__insertNewline_(self, _cmd, sender)
{ with(self)
{
 objj_msgSend(self, "validateValue");
}
},["void","id"]), new objj_method(sel_getUid("insertTab:"), function $THRTextField__insertTab_(self, _cmd, sender)
{ with(self)
{
 objj_msgSend(self, "validateValue");
}
},["void","id"]), new objj_method(sel_getUid("validateValue"), function $THRTextField__validateValue(self, _cmd)
{ with(self)
{
 var statusMessage = objj_msgSend(self, "validateValueSelf");
 if( objj_msgSend(statusMessage, "length") )
 {
  CPLog(statusMessage);
 }
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("textfieldWithPlaceholder:frame:validationMask:"), function $THRTextField__textfieldWithPlaceholder_frame_validationMask_(self, _cmd, aPlaceholder, aFrame, aMask)
{ with(self)
{
    var textfield = objj_msgSend(objj_msgSend(THRTextField, "alloc"), "initWithFrame:", aFrame);
    if( textfield )
    {
        objj_msgSend(textfield, "setPlaceholderString:", aPlaceholder);
        objj_msgSend(textfield, "setEditable:", YES);
        textfield.validationMask=aMask;
        objj_msgSend(textfield, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 15));
    }
    return textfield;
}
},["THRTextField","CPString","CGRectFrame","int"]), new objj_method(sel_getUid("textfieldWithPlaceholder:frame:validationMask:bindTo:withKeyPath:"), function $THRTextField__textfieldWithPlaceholder_frame_validationMask_bindTo_withKeyPath_(self, _cmd, aPlaceholder, aFrame, aMask, aController, aKeyPath)
{ with(self)
{
    var textfield = objj_msgSend(THRTextField, "textfieldWithPlaceholder:frame:validationMask:", aPlaceholder, aFrame, aMask);
    if( textfield )
    {
        objj_msgSend(textfield, "bind:toObject:withKeyPath:options:", "objectValue", aController, aKeyPath, nil);
    }
    return textfield;
}
},["THRTextField","CPString","CGRectFrame","int","id","CPString"])]);
}


{var the_class = objj_allocateClassPair(THRTextField, "THRTextField_Email"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("validateValueSelf"), function $THRTextField_Email__validateValueSelf(self, _cmd)
{ with(self)
{
 var statusText = "";
 var value = objj_msgSend(self, "stringValue");
 var matchPattern=new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)\b");
 if( value.match(matchPattern) )
 {
  CPLog("OK");
 }
 if( !matchPattern.test(value) )
 {
  statusText="Devi inserire un indirizzo email valido"+value;
 }
 else
  statusText="OK";
 return statusText;
}
},["CPString"])]);
}

p;24;TreenodeViewController.jt;2169;@STATIC;1.0;I;21;Foundation/CPObject.ji;8;Person.jt;2112;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Person.j", YES);

{var the_class = objj_allocateClassPair(CPViewController, "TreeNodeViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("objects"), new objj_ivar("folderId"), new objj_ivar("listConnection"), new objj_ivar("updateConnection"), new objj_ivar("deleteConnection"), new objj_ivar("addConnection"), new objj_ivar("objectsArrayController"), new objj_ivar("theTableView"), new objj_ivar("searchText")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("objects"), function $TreeNodeViewController__objects(self, _cmd)
{ with(self)
{
return objects;
}
},["id"]),
new objj_method(sel_getUid("setObjects:"), function $TreeNodeViewController__setObjects_(self, _cmd, newValue)
{ with(self)
{
objects = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("folderId"), function $TreeNodeViewController__folderId(self, _cmd)
{ with(self)
{
return folderId;
}
},["id"]),
new objj_method(sel_getUid("setFolderId:"), function $TreeNodeViewController__setFolderId_(self, _cmd, newValue)
{ with(self)
{
folderId = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("searchText"), function $TreeNodeViewController__searchText(self, _cmd)
{ with(self)
{
return searchText;
}
},["id"]),
new objj_method(sel_getUid("setSearchText:"), function $TreeNodeViewController__setSearchText_(self, _cmd, newValue)
{ with(self)
{
searchText = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $TreeNodeViewController__init(self, _cmd)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TreeNodeViewController").super_class }, "init");
 if( self )
 {
  objects=objj_msgSend(CPArray, "array");
  folderId=0;
  listConnection=nil;
  updateConnection=nil;
  deleteConnection=nil;
  addConnection=nil;

  objectsArrayController = objj_msgSend(CPArrayController, "new");
  objj_msgSend(objectsArrayController, "bind:toObject:withKeyPath:options:", "contentArray", self, "objects", nil);
 }
 return self;
}
},["id"])]);
}p;18;TVCell_Addresses.jt;2833;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;2768;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPView.j", NO);

{var the_class = objj_allocateClassPair(CPView, "TVCell_Addresses"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("firstLabel"), new objj_ivar("secondLabel")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $TVCell_Addresses__initWithFrame_(self, _cmd, frame)
{ with(self)
{
 self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Addresses").super_class }, "initWithFrame:", frame);
 if( self )
 {
  firstLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,3.0,180.0,22.0));
  secondLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,26.0,180.0,21.0));

  objj_msgSend(firstLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 15.0));
  objj_msgSend(secondLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
  objj_msgSend(secondLabel, "setTextColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(firstLabel, "setAlignment:",  CPRightTextAlignment);
        objj_msgSend(secondLabel, "setAlignment:",  CPRightTextAlignment);

  objj_msgSend(self, "addSubview:", firstLabel);
  objj_msgSend(self, "addSubview:", secondLabel);
 }
 return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setObjectValue:"), function $TVCell_Addresses__setObjectValue_(self, _cmd, value)
{ with(self)
{
 var addressesCount=objj_msgSend(value.addresses, "count");
    if( addressesCount )
    {
        objj_msgSend(firstLabel, "setStringValue:", objj_msgSend(value.addresses, "objectAtIndex:", 0).value);
        objj_msgSend(secondLabel, "setStringValue:", objj_msgSend(value.addresses, "objectAtIndex:", 0).key);
 }
}
},["void","id"]), new objj_method(sel_getUid("initWithCoder:"), function $TVCell_Addresses__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Addresses").super_class }, "initWithCoder:", aCoder);
        firstLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "firstLabel");
        secondLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "secondLabel");
        return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TVCell_Addresses__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Addresses").super_class }, "encodeWithCoder:", aCoder);
        objj_msgSend(aCoder, "encodeObject:forKey:", firstLabel, "firstLabel");
        objj_msgSend(aCoder, "encodeObject:forKey:", secondLabel, "secondLabel");
}
},["void","CPCoder"])]);
}

p;15;TVCell_Emails.jt;3145;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;3080;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPView.j", NO);

{var the_class = objj_allocateClassPair(CPView, "TVCell_Emails"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("firstLabel"), new objj_ivar("secondLabel"), new objj_ivar("firstTag"), new objj_ivar("secondTag")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $TVCell_Emails__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Emails").super_class }, "initWithFrame:", frame);
    if( self )
    {
        firstLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,3.0,210.0,20.0));
        secondLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,26.0,210.0,20.0));

        objj_msgSend(firstLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 14.0));
        objj_msgSend(secondLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 14.0));
        objj_msgSend(firstLabel, "setAlignment:",  CPRightTextAlignment);
        objj_msgSend(secondLabel, "setAlignment:",  CPRightTextAlignment);

        objj_msgSend(self, "addSubview:", firstLabel);
        objj_msgSend(self, "addSubview:", secondLabel);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setObjectValue:"), function $TVCell_Emails__setObjectValue_(self, _cmd, value)
{ with(self)
{
    if( value )
    {
        var addressesCount=objj_msgSend(value.emails, "count");
        if( addressesCount )
        {
            objj_msgSend(firstLabel, "setStringValue:", objj_msgSend(objj_msgSend(value.emails, "objectAtIndex:", 0), "objectAtIndex:", 1));
            if( addressesCount>1 )
            {
                objj_msgSend(secondLabel, "setStringValue:", objj_msgSend(objj_msgSend(value.emails, "objectAtIndex:", 1), "objectAtIndex:", 1));
            }
        }
    }
    else
    {
        objj_msgSend(firstLabel, "setStringValue:", "");
        objj_msgSend(secondLabel, "setStringValue:", "");
    }
}
},["void","id"]), new objj_method(sel_getUid("initWithCoder:"), function $TVCell_Emails__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Emails").super_class }, "initWithCoder:", aCoder);
        firstLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "firstLabel");
        secondLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "secondLabel");
        return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TVCell_Emails__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Emails").super_class }, "encodeWithCoder:", aCoder);
        objj_msgSend(aCoder, "encodeObject:forKey:", firstLabel, "firstLabel");
        objj_msgSend(aCoder, "encodeObject:forKey:", secondLabel, "secondLabel");
}
},["void","CPCoder"])]);
}

p;17;TVCell_Fullname.jt;3320;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;3255;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPView.j", NO);

{var the_class = objj_allocateClassPair(CPView, "TVCell_Fullname"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("mainLabel"), new objj_ivar("secondaryLabel")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("mainLabel"), function $TVCell_Fullname__mainLabel(self, _cmd)
{ with(self)
{
return mainLabel;
}
},["id"]),
new objj_method(sel_getUid("setMainLabel:"), function $TVCell_Fullname__setMainLabel_(self, _cmd, newValue)
{ with(self)
{
mainLabel = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("secondaryLabel"), function $TVCell_Fullname__secondaryLabel(self, _cmd)
{ with(self)
{
return secondaryLabel;
}
},["id"]),
new objj_method(sel_getUid("setSecondaryLabel:"), function $TVCell_Fullname__setSecondaryLabel_(self, _cmd, newValue)
{ with(self)
{
secondaryLabel = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithFrame:"), function $TVCell_Fullname__initWithFrame_(self, _cmd, frame)
{ with(self)
{
 self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Fullname").super_class }, "initWithFrame:", frame);
 if( self )
 {
  mainLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,3.0,200.0,20.0));
  secondaryLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,26.0,200.0,20.0));

  objj_msgSend(mainLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 14.0));
  objj_msgSend(secondaryLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
  objj_msgSend(secondaryLabel, "setTextColor:", objj_msgSend(CPColor, "grayColor"));
  objj_msgSend(self, "addSubview:", mainLabel);
  objj_msgSend(self, "addSubview:", secondaryLabel);
 }
 return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setObjectValue:"), function $TVCell_Fullname__setObjectValue_(self, _cmd, value)
{ with(self)
{
 if( value )
 {
  objj_msgSend(mainLabel, "setStringValue:", objj_msgSend(value, "fullName"));
  if( !value.isCompany )
   objj_msgSend(secondaryLabel, "setStringValue:", value.companyName);
 }
 else
 {
  objj_msgSend(mainLabel, "setStringValue:", "");
  objj_msgSend(secondaryLabel, "setStringValue:", "");
 }
}
},["void","id"]), new objj_method(sel_getUid("initWithCoder:"), function $TVCell_Fullname__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Fullname").super_class }, "initWithCoder:", aCoder);
        mainLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "mainLabel");
        secondaryLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "secondaryLabel");
        return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TVCell_Fullname__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Fullname").super_class }, "encodeWithCoder:", aCoder);
        objj_msgSend(aCoder, "encodeObject:forKey:", mainLabel, "mainLabel");
        objj_msgSend(aCoder, "encodeObject:forKey:", secondaryLabel, "secondaryLabel");
}
},["void","CPCoder"])]);
}p;15;TVCell_Phones.jt;4568;@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;4503;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPView.j", NO);

{var the_class = objj_allocateClassPair(CPView, "TVCell_Phones"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("firstLabel"), new objj_ivar("secondLabel"), new objj_ivar("firstTag"), new objj_ivar("secondTag")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $TVCell_Phones__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Phones").super_class }, "initWithFrame:", frame);
    if( self )
    {
        firstLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,3.0,110.0,20.0));
        secondLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,26.0,110.0,20.0));

        firstTag = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(115.0,3.0,55.0,20.0));
        secondTag = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(115.0,26.0,55.0,20.0));

        objj_msgSend(firstLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 14.0));
        objj_msgSend(secondLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 14.0));
        objj_msgSend(firstLabel, "setAlignment:",  CPRightTextAlignment);
        objj_msgSend(secondLabel, "setAlignment:",  CPRightTextAlignment);

        objj_msgSend(firstTag, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
        objj_msgSend(firstTag, "setTextColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(secondTag, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
        objj_msgSend(secondTag, "setTextColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(self, "addSubview:", firstLabel);
        objj_msgSend(self, "addSubview:", secondLabel);
        objj_msgSend(self, "addSubview:", firstTag);
        objj_msgSend(self, "addSubview:", secondTag);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setObjectValue:"), function $TVCell_Phones__setObjectValue_(self, _cmd, value)
{ with(self)
{
    if( value )
    {
        var phonesCount;
        phonesCount=objj_msgSend(value.phones, "count");

        if( phonesCount )
        {
            objj_msgSend(firstLabel, "setStringValue:", objj_msgSend(objj_msgSend(value.phones, "objectAtIndex:", 0), "objectAtIndex:", 1));
            objj_msgSend(firstTag, "setStringValue:", objj_msgSend(objj_msgSend(value.phones, "objectAtIndex:", 0), "objectAtIndex:", 0));
            if( phonesCount>1 )
            {
                objj_msgSend(secondLabel, "setStringValue:", objj_msgSend(objj_msgSend(value.phones, "objectAtIndex:", 1), "objectAtIndex:", 1));
                objj_msgSend(secondTag, "setStringValue:", objj_msgSend(objj_msgSend(value.phones, "objectAtIndex:", 1), "objectAtIndex:", 0));
            }
        }
    }
    else
    {
        objj_msgSend(firstLabel, "setStringValue:", "");
        objj_msgSend(secondLabel, "setStringValue:", "");
        objj_msgSend(firstTag, "setStringValue:", "");
        objj_msgSend(secondTag, "setStringValue:", "");
    }
}
},["void","id"]), new objj_method(sel_getUid("initWithCoder:"), function $TVCell_Phones__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Phones").super_class }, "initWithCoder:", aCoder);
        firstLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "firstLabel");
        secondLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "secondLabel");
        firstTag = objj_msgSend(aCoder, "decodeObjectForKey:", "firstTag");
        secondTag = objj_msgSend(aCoder, "decodeObjectForKey:", "secondTag");
        return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TVCell_Phones__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Phones").super_class }, "encodeWithCoder:", aCoder);
        objj_msgSend(aCoder, "encodeObject:forKey:", firstLabel, "firstLabel");
        objj_msgSend(aCoder, "encodeObject:forKey:", secondLabel, "secondLabel");
        objj_msgSend(aCoder, "encodeObject:forKey:", firstTag, "firstTag");
        objj_msgSend(aCoder, "encodeObject:forKey:", secondTag, "secondTag");
}
},["void","CPCoder"])]);
}

e;