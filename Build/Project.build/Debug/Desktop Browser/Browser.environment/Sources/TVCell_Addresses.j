@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;2768;

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

