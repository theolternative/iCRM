@import <Foundation/CPObject.j>

@implementation Person : CPObject
{
    int             index @accessors;
	
    CPString        name @accessors;
    CPString        surname @accessors;
    CPString        companyName @accessors;
    CPString        tags @accessors;
    CPString        fiscalID @accessors;
    CPString        VAT @accessors;

    CPMutableArray  addresses @accessors;
    CPMutableArray  phones @accessors;
    CPMutableArray  emails @accessors;
    BOOL            isCompany @accessors;
    BOOL            privacy @accessors;

}

- (id)init
{
    if (self = [super init])
    {
        name=@"";
        surname=@"";
        isCompany=NO;
        addresses=[[CPMutableArray alloc] init];
        phones=[[CPMutableArray alloc] init];
        emails=[[CPMutableArray alloc] init];
    }
    return self;
}

- (CPString) fullName
{
	return (self.isCompany?self.companyName:(self.surname+@" "+self.name));
}

- (void) copyTo:(Person) aPerson
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
@end

@implementation DictionaryEntry : CPObject
{
    CPString    key @accessors;
    CPString    value @accessors;
}

- (id)initWithValue:(CPString)aValue forKey:(CPString)aKey
{
    if (self = [super init])
    {
        key=aKey;
        value=aValue;
    }
    return self;
}

@end