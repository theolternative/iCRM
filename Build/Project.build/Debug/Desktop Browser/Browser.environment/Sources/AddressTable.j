@STATIC;1.0;I;21;Foundation/CPObject.ji;14;THRTableView.jt;3067;

objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("THRTableView.j", YES);

{var the_class = objj_allocateClassPair(THRTableView, "AddressTable"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("customColumns"), function $AddressTable__customColumns(self, _cmd)
{ with(self)
{
    var customColumns;

    var tagColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "0");
    objj_msgSend(tagColumn, "setWidth:", 60.0);
    var tagEditField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,60,25));
    objj_msgSend(tagEditField, "setPlaceholderString:", "Etichette");
    objj_msgSend(tagColumn, "setEditable:", YES);
    objj_msgSend(tagColumn, "setDataView:", tagEditField);

    var cityColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "1");
    objj_msgSend(cityColumn, "setWidth:", 100.0);
    var cityEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,100,25));
    objj_msgSend(cityEditfield, "setPlaceholderString:", "Città");
    objj_msgSend(cityColumn, "setEditable:", YES);
    objj_msgSend(cityColumn, "setDataView:", cityEditfield);

    var addressColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "2");
    objj_msgSend(addressColumn, "setWidth:", 150.0);
    var addessEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,150,25));
    objj_msgSend(addressColumn, "setEditable:", YES);
    objj_msgSend(addressColumn, "setDataView:", addessEditfield);

    var zipcodeColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "3");
    objj_msgSend(zipcodeColumn, "setWidth:", 60.0);
    var zipcodeEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,60,25));
    objj_msgSend(zipcodeColumn, "setEditable:", YES);
    objj_msgSend(zipcodeColumn, "setDataView:", zipcodeEditfield);

    var stateColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "4");
    objj_msgSend(stateColumn, "setWidth:", 60.0);
    var stateEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,60,25));
    objj_msgSend(stateColumn, "setEditable:", YES);
    objj_msgSend(stateColumn, "setDataView:", stateEditfield);

    var countryColumn = objj_msgSend(objj_msgSend(CPTableColumn, "alloc"), "initWithIdentifier:", "5");
    objj_msgSend(countryColumn, "setWidth:", 100.0);
    var countryEditfield = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(0,0,100,25));
    objj_msgSend(countryColumn, "setEditable:", YES);
    objj_msgSend(countryEditfield, "setStringValue:", "Italia");
    objj_msgSend(countryColumn, "setDataView:", countryEditfield);

    customColumns = [tagColumn, cityColumn, addressColumn, zipcodeColumn, stateColumn, countryColumn];
    return customColumns;
}
},["CPArray"])]);
}

