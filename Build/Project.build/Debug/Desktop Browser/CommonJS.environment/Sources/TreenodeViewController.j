@STATIC;1.0;I;21;Foundation/CPObject.ji;8;Person.jt;2112;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Person.j", YES);

{var the_class = objj_allocateClassPair(CPViewController, "TreeNodeViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("objects"), new objj_ivar("folderId"), new objj_ivar("listConnection"), new objj_ivar("updateConnection"), new objj_ivar("deleteConnection"), new objj_ivar("addConnection"), new objj_ivar("objectsArrayController"), new objj_ivar("theTableView"), new objj_ivar("searchText")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("objects"), function $TreeNodeViewController__objects(self, _cmd)
{ with(self)
{
return objects;
}
},["id"]),
new objj_method(sel_getUid("setObjects:"), function $TreeNodeViewController__setObjects_(self, _cmd, newValue)
{ with(self)
{
objects = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("folderId"), function $TreeNodeViewController__folderId(self, _cmd)
{ with(self)
{
return folderId;
}
},["id"]),
new objj_method(sel_getUid("setFolderId:"), function $TreeNodeViewController__setFolderId_(self, _cmd, newValue)
{ with(self)
{
folderId = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("searchText"), function $TreeNodeViewController__searchText(self, _cmd)
{ with(self)
{
return searchText;
}
},["id"]),
new objj_method(sel_getUid("setSearchText:"), function $TreeNodeViewController__setSearchText_(self, _cmd, newValue)
{ with(self)
{
searchText = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $TreeNodeViewController__init(self, _cmd)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("TreeNodeViewController").super_class }, "init");
 if( self )
 {
  objects=objj_msgSend(CPArray, "array");
  folderId=0;
  listConnection=nil;
  updateConnection=nil;
  deleteConnection=nil;
  addConnection=nil;

  objectsArrayController = objj_msgSend(CPArrayController, "new");
  objj_msgSend(objectsArrayController, "bind:toObject:withKeyPath:options:", "contentArray", self, "objects", nil);
 }
 return self;
}
},["id"])]);
}