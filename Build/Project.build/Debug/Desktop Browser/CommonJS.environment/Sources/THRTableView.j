@STATIC;1.0;I;21;Foundation/CPObject.jt;4254;

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

