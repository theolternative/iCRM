@STATIC;1.0;I;21;Foundation/CPObject.jt;3158;

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

