@STATIC;1.0;I;21;Foundation/CPObject.jt;951;


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

