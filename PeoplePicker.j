@import <Foundation/CPObject.j>
@import "THRPicker.j"
@import "Person.j"

@implementation PeoplePicker : THRPicker
{
}

- (id) objectFromJSON:(CPString) jsonString
{
    var addressesArray = jsonString.addresses.split("::");
    var person = [[Person alloc] init];
    person.index=jsonString.id;
    person.name = jsonString.name;
    person.surname = jsonString.surname;
    person.companyName = jsonString.companyName;
    person.isCompany = [jsonString.isCompany intValue];
    for( var j=0;j<addressesArray.length-1;j++ )
    {
        var addressArray = addressesArray[j].split(";");
        var dictionaryEntry = [[DictionaryEntry alloc] initWithValue:addressArray[1] forKey:addressArray[2]];
        [person.addresses addObject:dictionaryEntry];
    }
    return person;
}

- (CPString) urlWithSearchString:(CPString) searchText
{
    var url = nil;
    if( [searchText length]>2)
        url=[CPString stringWithFormat:@"https://iscrizioni.iltemporitrovato.org/gestione/PHP/contacts.php?task=LISTING&search=%@",searchText];
    return url;
}

- (CPString) descriptionForObject:(id)aObject
{
    return [aObject fullName];
}

@end
