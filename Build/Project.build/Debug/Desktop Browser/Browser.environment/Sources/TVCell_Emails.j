@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;2869;

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
   objj_msgSend(firstLabel, "setStringValue:", objj_msgSend(value.emails, "objectAtIndex:", 0).value);
   if( addressesCount>1 )
   {
    objj_msgSend(secondLabel, "setStringValue:", objj_msgSend(value.emails, "objectAtIndex:", 1).value);
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

