@STATIC;1.0;I;21;Foundation/CPObject.jt;3804;

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

