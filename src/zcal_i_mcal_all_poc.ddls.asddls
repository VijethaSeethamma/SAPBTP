@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Singleton: Multi Edit Holiday Calendar'
define root view entity ZCAL_I_MCAL_ALL_POC 
as select from    I_Language
    left outer join zcal_holiday_poc on 0 = 0
    composition [0..*] of zcal_i_mcal_poc as _Holiday
{
  key 1                                          as HolidayAllID,
      @Semantics.systemDateTime.lastChangedAt: true
      max( zcal_holiday_poc.last_changed_at )       as LastChangedAtMax,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      max( zcal_holiday_poc.local_last_changed_at ) as LocalLastChangedAtMax,
      cast( '' as sxco_transport)                as Request,
      cast( 'X' as abap_boolean)                 as HideTransport,
      _Holiday
}
where
  I_Language.Language = $session.system_language
