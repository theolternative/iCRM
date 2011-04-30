@STATIC;1.0;I;21;Foundation/CPObject.jt;6064;

objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPObject, "Person"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("index"), new objj_ivar("name"), new objj_ivar("surname"), new objj_ivar("companyName"), new objj_ivar("tags"), new objj_ivar("fiscalID"), new objj_ivar("VAT"), new objj_ivar("addresses"), new objj_ivar("phones"), new objj_ivar("emails"), new objj_ivar("isCompany"), new objj_ivar("privacy")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("index"), function $Person__index(self, _cmd)
{ with(self)
{
return index;
}
},["id"]),
new objj_method(sel_getUid("setIndex:"), function $Person__setIndex_(self, _cmd, newValue)
{ with(self)
{
index = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("name"), function $Person__name(self, _cmd)
{ with(self)
{
return name;
}
},["id"]),
new objj_method(sel_getUid("setName:"), function $Person__setName_(self, _cmd, newValue)
{ with(self)
{
name = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("surname"), function $Person__surname(self, _cmd)
{ with(self)
{
return surname;
}
},["id"]),
new objj_method(sel_getUid("setSurname:"), function $Person__setSurname_(self, _cmd, newValue)
{ with(self)
{
surname = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("companyName"), function $Person__companyName(self, _cmd)
{ with(self)
{
return companyName;
}
},["id"]),
new objj_method(sel_getUid("setCompanyName:"), function $Person__setCompanyName_(self, _cmd, newValue)
{ with(self)
{
companyName = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("tags"), function $Person__tags(self, _cmd)
{ with(self)
{
return tags;
}
},["id"]),
new objj_method(sel_getUid("setTags:"), function $Person__setTags_(self, _cmd, newValue)
{ with(self)
{
tags = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("fiscalID"), function $Person__fiscalID(self, _cmd)
{ with(self)
{
return fiscalID;
}
},["id"]),
new objj_method(sel_getUid("setFiscalID:"), function $Person__setFiscalID_(self, _cmd, newValue)
{ with(self)
{
fiscalID = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("VAT"), function $Person__VAT(self, _cmd)
{ with(self)
{
return VAT;
}
},["id"]),
new objj_method(sel_getUid("setVAT:"), function $Person__setVAT_(self, _cmd, newValue)
{ with(self)
{
VAT = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("addresses"), function $Person__addresses(self, _cmd)
{ with(self)
{
return addresses;
}
},["id"]),
new objj_method(sel_getUid("setAddresses:"), function $Person__setAddresses_(self, _cmd, newValue)
{ with(self)
{
addresses = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("phones"), function $Person__phones(self, _cmd)
{ with(self)
{
return phones;
}
},["id"]),
new objj_method(sel_getUid("setPhones:"), function $Person__setPhones_(self, _cmd, newValue)
{ with(self)
{
phones = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("emails"), function $Person__emails(self, _cmd)
{ with(self)
{
return emails;
}
},["id"]),
new objj_method(sel_getUid("setEmails:"), function $Person__setEmails_(self, _cmd, newValue)
{ with(self)
{
emails = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("isCompany"), function $Person__isCompany(self, _cmd)
{ with(self)
{
return isCompany;
}
},["id"]),
new objj_method(sel_getUid("setIsCompany:"), function $Person__setIsCompany_(self, _cmd, newValue)
{ with(self)
{
isCompany = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("privacy"), function $Person__privacy(self, _cmd)
{ with(self)
{
return privacy;
}
},["id"]),
new objj_method(sel_getUid("setPrivacy:"), function $Person__setPrivacy_(self, _cmd, newValue)
{ with(self)
{
privacy = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $Person__init(self, _cmd)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Person").super_class }, "init"))
    {
        name="";
        surname="";
        isCompany=NO;
        addresses=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
        phones=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
        emails=objj_msgSend(objj_msgSend(CPMutableArray, "alloc"), "init");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("fullName"), function $Person__fullName(self, _cmd)
{ with(self)
{
 return (self.isCompany?self.companyName:(self.surname+" "+self.name));
}
},["CPString"]), new objj_method(sel_getUid("copyTo:"), function $Person__copyTo_(self, _cmd, aPerson)
{ with(self)
{
    aPerson.name=name;
    aPerson.surname=surname;
    aPerson.companyName=companyName;
    aPerson.tags=tags;
    aPerson.fiscalID=fiscalID;
    aPerson.VAT=VAT;
    aPerson.addresses=addresses;
    aPerson.phone=phones;
    aPerson.emails=emails;
    aPerson.isCompany=isCompany;
    aPerson.privacy=privacy;
}
},["void","Person"])]);
}

{var the_class = objj_allocateClassPair(CPObject, "DictionaryEntry"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("key"), new objj_ivar("value")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("key"), function $DictionaryEntry__key(self, _cmd)
{ with(self)
{
return key;
}
},["id"]),
new objj_method(sel_getUid("setKey:"), function $DictionaryEntry__setKey_(self, _cmd, newValue)
{ with(self)
{
key = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("value"), function $DictionaryEntry__value(self, _cmd)
{ with(self)
{
return value;
}
},["id"]),
new objj_method(sel_getUid("setValue:"), function $DictionaryEntry__setValue_(self, _cmd, newValue)
{ with(self)
{
value = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithValue:forKey:"), function $DictionaryEntry__initWithValue_forKey_(self, _cmd, aValue, aKey)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("DictionaryEntry").super_class }, "init"))
    {
        key=aKey;
        value=aValue;
    }
    return self;
}
},["id","CPString","CPString"])]);
}

