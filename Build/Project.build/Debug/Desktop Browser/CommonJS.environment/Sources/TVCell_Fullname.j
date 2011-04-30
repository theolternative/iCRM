@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;3255;

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
}