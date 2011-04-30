@STATIC;1.0;I;21;Foundation/CPObject.jt;1123;

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

