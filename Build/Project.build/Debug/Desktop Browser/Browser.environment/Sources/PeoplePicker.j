@STATIC;1.0;I;21;Foundation/CPObject.ji;11;THRPicker.ji;8;Person.jt;1757;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("THRPicker.j", YES);
objj_executeFile("Person.j", YES);

{var the_class = objj_allocateClassPair(THRPicker, "PeoplePicker"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("objectFromJSON:"), function $PeoplePicker__objectFromJSON_(self, _cmd, jsonString)
{ with(self)
{
    var addressesArray = jsonString.addresses.split("::");
    var person = objj_msgSend(objj_msgSend(Person, "alloc"), "init");
    person.index=jsonString.id;
    person.name = jsonString.name;
    person.surname = jsonString.surname;
    person.companyName = jsonString.companyName;
    person.isCompany = objj_msgSend(jsonString.isCompany, "intValue");
    for( var j=0;j<addressesArray.length-1;j++ )
    {
        var addressArray = addressesArray[j].split(";");
        var dictionaryEntry = objj_msgSend(objj_msgSend(DictionaryEntry, "alloc"), "initWithValue:forKey:", addressArray[1], addressArray[2]);
        objj_msgSend(person.addresses, "addObject:", dictionaryEntry);
    }
    return person;
}
},["id","CPString"]), new objj_method(sel_getUid("urlWithSearchString:"), function $PeoplePicker__urlWithSearchString_(self, _cmd, searchText)
{ with(self)
{
    var url = nil;
    if( objj_msgSend(searchText, "length")>2)
        url=objj_msgSend(CPString, "stringWithFormat:", "https://iscrizioni.iltemporitrovato.org/gestione/PHP/contacts.php?task=LISTING&search=%@",searchText);
    return url;
}
},["CPString","CPString"]), new objj_method(sel_getUid("descriptionForObject:"), function $PeoplePicker__descriptionForObject_(self, _cmd, aObject)
{ with(self)
{
    return objj_msgSend(aObject, "fullName");
}
},["CPString","id"])]);
}

