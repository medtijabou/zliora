@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'Z2490CUSTOMERS'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_2490CUSTOMERS
  as select from Z2490CUSTOMERS as Customers
{
  key customer_uuid as CustomerUUID,
  customer_id as CustomerID,
  name as Name,
  street as Street,
  postal_code as PostalCode,
  city as City,
  country_code as CountryCode,
  phone_number as PhoneNumber,
  email_address as EmailAddress,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  last_changed_at as LastChangedAt
}
