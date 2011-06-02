@STATIC;1.0;I;21;Foundation/CPObject.jI;15;AppKit/CPView.jt;4503;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPView.j", NO);

{var the_class = objj_allocateClassPair(CPView, "TVCell_Phones"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("firstLabel"), new objj_ivar("secondLabel"), new objj_ivar("firstTag"), new objj_ivar("secondTag")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithFrame:"), function $TVCell_Phones__initWithFrame_(self, _cmd, frame)
{ with(self)
{
    self=objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Phones").super_class }, "initWithFrame:", frame);
    if( self )
    {
        firstLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,3.0,110.0,20.0));
        secondLabel = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(3.0,26.0,110.0,20.0));

        firstTag = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(115.0,3.0,55.0,20.0));
        secondTag = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(115.0,26.0,55.0,20.0));

        objj_msgSend(firstLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 14.0));
        objj_msgSend(secondLabel, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 14.0));
        objj_msgSend(firstLabel, "setAlignment:",  CPRightTextAlignment);
        objj_msgSend(secondLabel, "setAlignment:",  CPRightTextAlignment);

        objj_msgSend(firstTag, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
        objj_msgSend(firstTag, "setTextColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(secondTag, "setFont:", objj_msgSend(CPFont, "systemFontOfSize:", 12.0));
        objj_msgSend(secondTag, "setTextColor:", objj_msgSend(CPColor, "grayColor"));
        objj_msgSend(self, "addSubview:", firstLabel);
        objj_msgSend(self, "addSubview:", secondLabel);
        objj_msgSend(self, "addSubview:", firstTag);
        objj_msgSend(self, "addSubview:", secondTag);
    }
    return self;
}
},["id","CGRect"]), new objj_method(sel_getUid("setObjectValue:"), function $TVCell_Phones__setObjectValue_(self, _cmd, value)
{ with(self)
{
    if( value )
    {
        var phonesCount;
        phonesCount=objj_msgSend(value.phones, "count");

        if( phonesCount )
        {
            objj_msgSend(firstLabel, "setStringValue:", objj_msgSend(objj_msgSend(value.phones, "objectAtIndex:", 0), "objectAtIndex:", 1));
            objj_msgSend(firstTag, "setStringValue:", objj_msgSend(objj_msgSend(value.phones, "objectAtIndex:", 0), "objectAtIndex:", 0));
            if( phonesCount>1 )
            {
                objj_msgSend(secondLabel, "setStringValue:", objj_msgSend(objj_msgSend(value.phones, "objectAtIndex:", 1), "objectAtIndex:", 1));
                objj_msgSend(secondTag, "setStringValue:", objj_msgSend(objj_msgSend(value.phones, "objectAtIndex:", 1), "objectAtIndex:", 0));
            }
        }
    }
    else
    {
        objj_msgSend(firstLabel, "setStringValue:", "");
        objj_msgSend(secondLabel, "setStringValue:", "");
        objj_msgSend(firstTag, "setStringValue:", "");
        objj_msgSend(secondTag, "setStringValue:", "");
    }
}
},["void","id"]), new objj_method(sel_getUid("initWithCoder:"), function $TVCell_Phones__initWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Phones").super_class }, "initWithCoder:", aCoder);
        firstLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "firstLabel");
        secondLabel = objj_msgSend(aCoder, "decodeObjectForKey:", "secondLabel");
        firstTag = objj_msgSend(aCoder, "decodeObjectForKey:", "firstTag");
        secondTag = objj_msgSend(aCoder, "decodeObjectForKey:", "secondTag");
        return self;
}
},["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $TVCell_Phones__encodeWithCoder_(self, _cmd, aCoder)
{ with(self)
{
        objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TVCell_Phones").super_class }, "encodeWithCoder:", aCoder);
        objj_msgSend(aCoder, "encodeObject:forKey:", firstLabel, "firstLabel");
        objj_msgSend(aCoder, "encodeObject:forKey:", secondLabel, "secondLabel");
        objj_msgSend(aCoder, "encodeObject:forKey:", firstTag, "firstTag");
        objj_msgSend(aCoder, "encodeObject:forKey:", secondTag, "secondTag");
}
},["void","CPCoder"])]);
}

