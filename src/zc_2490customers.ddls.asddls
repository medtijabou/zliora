@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'Z2490CUSTOMERS'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_2490CUSTOMERS
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_2490CUSTOMERS
  association [1..1] to ZR_2490CUSTOMERS as _BaseEntity on $projection.CUSTOMERUUID = _BaseEntity.CUSTOMERUUID
{
  key CustomerUUID,
  CustomerID,
  Name,
  Street,
  PostalCode,
  City,
  CountryCode,
  PhoneNumber,
  EmailAddress,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
