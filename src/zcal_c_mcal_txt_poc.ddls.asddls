@EndUserText.label: 'Holiday Text'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZCAL_C_MCAL_TXT_POC 
  as projection on ZCAL_I_MCAL_TXT_POC 
{
   @Consumption.valueHelpDefinition: [ {entity: {name: 'I_Language', element: 'Language' }} ]
    @ObjectModel.text.element:['LanguageDescription']
    key Language,
    key Holiday,
    @Consumption.hidden: true
    HolidayAllID,
    HolidayDescription,
     _LanguageText.LanguageName as LanguageDescription : localized,
     _Public_Holiday : redirected to parent ZCAL_c_MCAL_POC,
     _HolidayAll     : redirected to ZCAL_C_MCAL_ALL_POC
}
