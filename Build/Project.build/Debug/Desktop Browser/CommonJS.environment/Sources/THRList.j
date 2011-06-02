@STATIC;1.0;I;15;AppKit/CPView.ji;16;THRRowTemplate.jt;5097;

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

