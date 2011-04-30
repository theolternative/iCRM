@STATIC;1.0;I;21;Foundation/CPObject.jt;1416;


objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPObject, "Folder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("name"), new objj_ivar("type"), new objj_ivar("uindex")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("name"), function $Folder__name(self, _cmd)
{ with(self)
{
return name;
}
},["id"]),
new objj_method(sel_getUid("setName:"), function $Folder__setName_(self, _cmd, newValue)
{ with(self)
{
name = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("type"), function $Folder__type(self, _cmd)
{ with(self)
{
return type;
}
},["id"]),
new objj_method(sel_getUid("setType:"), function $Folder__setType_(self, _cmd, newValue)
{ with(self)
{
type = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("uindex"), function $Folder__uindex(self, _cmd)
{ with(self)
{
return uindex;
}
},["id"]),
new objj_method(sel_getUid("setUindex:"), function $Folder__setUindex_(self, _cmd, newValue)
{ with(self)
{
uindex = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithName:type:"), function $Folder__initWithName_type_(self, _cmd, aName, aType)
{ with(self)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Folder").super_class }, "init"))
    {
        name=aName;
        type=aType;
    }
    return self;
}
},["id","CPString","int"])]);
}

