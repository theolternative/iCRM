@STATIC;1.0;I;21;Foundation/CPObject.jt;6861;

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

