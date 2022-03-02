@EndUserText.label: 'Projection Holiday'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZCAL_C_MCAL_POC 
  as projection on ZCAL_I_MCAL_POC
 {
    key Holiday,
    @Consumption.hidden: true
    HolidayAllID,
    HolidayMonth,
    HolidayDay,
    _HolidayTxt.HolidayDescription as HolidayDescription : localized,    
    _HolidayTxt : redirected to composition child ZCAL_C_MCAL_TXT_POC,
    _HolidayAll : redirected to parent ZCAL_C_MCAL_ALL_POC
}
