@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Public Holiday'
@ObjectModel.semanticKey: ['Holiday']
define view entity ZCAL_I_MCAL_POC 
  as select from zcal_holiday_poc
  composition [0..*] of zcal_i_mcal_txt_poc as _HolidayTxt
  association to parent ZCAL_I_MCAL_ALL_POC as _HolidayAll 
  on $projection.HolidayAllID = _HolidayAll.HolidayAllID
{
  key holiday_id       as Holiday,
      1                as HolidayAllID,
      month_of_holiday as HolidayMonth,
      day_of_holiday   as HolidayDay,
      _HolidayTxt,
      _HolidayAll
}
