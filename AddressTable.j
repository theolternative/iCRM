@import <Foundation/CPObject.j>
@import "THRTableView.j"

@implementation AddressTable : THRTableView
{
}

- (CPArray) customColumns
{
    var customColumns;

    var tagColumn = [[CPTableColumn alloc] initWithIdentifier:@"0"];
    [tagColumn setWidth:60.0];
    var tagEditField = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,60,25)];
    [tagEditField setPlaceholderString:@"Etichette"];
    [tagColumn setEditable:YES];
    [tagColumn setDataView:tagEditField];

    var cityColumn = [[CPTableColumn alloc] initWithIdentifier:@"1"];
    [cityColumn setWidth:100.0];
    var cityEditfield = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,100,25)];
    [cityEditfield setPlaceholderString:@"Città"];
    [cityColumn setEditable:YES];
    [cityColumn setDataView:cityEditfield];

    var addressColumn = [[CPTableColumn alloc] initWithIdentifier:@"2"];
    [addressColumn setWidth:150.0];
    var addessEditfield = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,150,25)];
    [addressColumn setEditable:YES];
    [addressColumn setDataView:addessEditfield];

    var zipcodeColumn = [[CPTableColumn alloc] initWithIdentifier:@"3"];
    [zipcodeColumn setWidth:60.0];
    var zipcodeEditfield = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,60,25)];
    [zipcodeColumn setEditable:YES];
    [zipcodeColumn setDataView:zipcodeEditfield];

    var stateColumn = [[CPTableColumn alloc] initWithIdentifier:@"4"];
    [stateColumn setWidth:60.0];
    var stateEditfield = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,60,25)];
    [stateColumn setEditable:YES];
    [stateColumn setDataView:stateEditfield];

    var countryColumn = [[CPTableColumn alloc] initWithIdentifier:@"5"];
    [countryColumn setWidth:100.0];
    var countryEditfield = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,100,25)];
    [countryColumn setEditable:YES];
    [countryEditfield setStringValue:@"Italia"];
    [countryColumn setDataView:countryEditfield];

    customColumns = [tagColumn, cityColumn, addressColumn, zipcodeColumn, stateColumn, countryColumn];
    return customColumns;
}

@end
