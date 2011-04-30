@STATIC;1.0;p;15;AppController.jt;5246;@STATIC;1.0;I;21;Foundation/CPObject.jI;22;AppKit/CPOutlineView.ji;8;Folder.jt;5162;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPOutlineView.j", NO);
objj_executeFile("Folder.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "AppController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("theWindow"), new objj_ivar("theScrollView"), new objj_ivar("theOutlineView"), new objj_ivar("folders"), new objj_ivar("folderConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("applicationDidFinishLaunching:"), function $AppController__applicationDidFinishLaunching_(self, _cmd, aNotification)
{ with(self)
{
    var textColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "TextColumn");
    objj_msgSend(textColumn, "setWidth:", 200.0);
    objj_msgSend(theOutlineView, "setHeaderView:", nil);
    objj_msgSend(theOutlineView, "setCornerView:", nil);
    objj_msgSend(theOutlineView, "addTableColumn:", textColumn);
    objj_msgSend(theOutlineView, "setOutlineTableColumn:", textColumn);
    objj_msgSend(theOutlineView, "setBackgroundColor:", objj_msgSend(CPColor, "colorWithHexString:", "e0ecfa"));
    objj_msgSend(theScrollView, "setDocumentView:", theOutlineView);
    objj_msgSend(theScrollView, "setAutohidesScrollers:", YES);
    items = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", [["glossary 1"], ["proj 1", "proj 2", "proj 3"]], ["Glossaries", "Projects"]);
    objj_msgSend(theOutlineView, "setDataSource:", self);
    objj_msgSend(self, "refreshFolders");
}
},["void","CPNotification"]), new objj_method(sel_getUid("refreshFolders"), function $AppController__refreshFolders(self, _cmd)
{ with(self)
{
    var request = objj_msgSend(CPURLRequest, "requestWithURL:", "https://iscrizioni.iltemporitrovato.org/gestione/PHP/folders.php?task=LISTING");
    folderConnection = objj_msgSend(CPURLConnection, "connectionWithRequest:delegate:", request, self);
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $AppController__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
    if( connection == folderConnection )
    {
        var result = JSON.parse(data);
        var foldersCount = result.length;
        var contactsFolders, projectsFolders, invoicesFolders, warnings, allFolders, allFoldersNames;
        contactsFolders = objj_msgSend(CPArray, "array");
        projectsFolders = objj_msgSend(CPArray, "array");
        invoicesFolders = objj_msgSend(CPArray, "array");
        warningsFolders = objj_msgSend(CPArray, "array");
        allFolders = objj_msgSend(CPArray, "arrayWithObjects:", contactsFolders, projectsFolders, invoicesFolders, warningsFolders,nil);
        allFoldersNames = objj_msgSend(CPArray, "arrayWithObjects:", "CONTATTI","PROGETTI","FATTURE","AVVISI",nil);
        for( var i=0;i<foldersCount;i++ )
        {
            var folderObj = result[i];
            var folder = objj_msgSend(objj_msgSend(Folder, "alloc"), "initWithName:type:", folderObj.name, objj_msgSend(folderObj.type, "intValue"));
            objj_msgSend(objj_msgSend(allFolders, "objectAtIndex:", objj_msgSend(folderObj.type, "intValue")), "addObject:", folder);
        }
        folders = objj_msgSend(CPDictionary, "dictionaryWithObjects:forKeys:", allFolders, allFoldersNames);
        objj_msgSend(theOutlineView, "reloadData");
        folderConnection=nil;
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("awakeFromCib"), function $AppController__awakeFromCib(self, _cmd)
{ with(self)
{
}
},["void"]), new objj_method(sel_getUid("outlineView:child:ofItem:"), function $AppController__outlineView_child_ofItem_(self, _cmd, outlineView, index, item)
{ with(self)
{
    if (item === nil)
    {
        var keys = objj_msgSend(folders, "allKeys");
        return objj_msgSend(keys, "objectAtIndex:", index);
    }
    else
    {
        var values = objj_msgSend(folders, "objectForKey:", item);
        return objj_msgSend(values, "objectAtIndex:", index);
    }
}
},["id","CPOutlineView","int","id"]), new objj_method(sel_getUid("outlineView:isItemExpandable:"), function $AppController__outlineView_isItemExpandable_(self, _cmd, outlineView, item)
{ with(self)
{
    var values = objj_msgSend(folders, "objectForKey:", item);
    return (objj_msgSend(values, "count") > 0);
}
},["BOOL","CPOutlineView","id"]), new objj_method(sel_getUid("outlineView:numberOfChildrenOfItem:"), function $AppController__outlineView_numberOfChildrenOfItem_(self, _cmd, outlineView, item)
{ with(self)
{
    if (item === nil)
    {
        return objj_msgSend(folders, "count");
    }
    else
    {
        var values = objj_msgSend(folders, "objectForKey:", item);
        return objj_msgSend(values, "count");
    }
}
},["int","CPOutlineView","id"]), new objj_method(sel_getUid("outlineView:objectValueForTableColumn:byItem:"), function $AppController__outlineView_objectValueForTableColumn_byItem_(self, _cmd, outlineView, tableColumn, item)
{ with(self)
{
    if( objj_msgSend(item, "isKindOfClass:", Folder) )
        return item.name;
    return item;
}
},["id","CPOutlineView","CPTableColumn","id"])]);
}

p;8;Folder.jt;1171;@STATIC;1.0;I;21;Foundation/CPObject.jt;1126;


objj_executeFile("Foundation/CPObject.j", NO);

{var the_class = objj_allocateClassPair(CPObject, "Folder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("name"), new objj_ivar("type")]);
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

p;6;main.jt;295;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;209;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
objj_executeFile("AppController.j", YES);
main= function(args, namedArgs)
{
    CPApplicationMain(args, namedArgs);
}

e;