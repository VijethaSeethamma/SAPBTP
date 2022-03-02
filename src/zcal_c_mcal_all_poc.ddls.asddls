@EndUserText.label: 'Projection singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['HolidayAllID']
define root view entity ZCAL_C_MCAL_ALL_POC 
  provider contract transactional_query
    as projection on ZCAL_I_MCAL_ALL_POC 
 {
    key HolidayAllID,
    LastChangedAtMax,
    LocalLastChangedAtMax,
    Request,
    HideTransport,
    _Holiday : redirected to composition child ZCAL_C_MCAL_POC
}
