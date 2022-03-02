CLASS zcl_cal_register_bc_poc DEFINITION
  PUBLIC
  INHERITING FROM cl_xco_cp_adt_simple_classrun
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS: main REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZCL_CAL_REGISTER_BC_POC IMPLEMENTATION.
  METHOD main.
    DATA(lo_business_configuration) = mbc_cp_api=>business_configuration(
      iv_identifier = 'ZC_PARA_TEST' && sy-uname
      iv_namespace  = '' ).
    TRY.
        lo_business_configuration->create(
          iv_name                  = |Parameter Test| && sy-uname
          iv_description           = 'Maitain Parameter Data'
          iv_service_binding       = 'ZC_UI_PARAM_TAB_TEST'
          iv_service_name          = 'ZC_PARAM_TAB_TE'
          iv_service_version       = 0001
          iv_root_entity_set       = 'ParamAll'
          iv_transport             = 'H01K900118'
          iv_skip_root_entity_list_rep = abap_true
        ).
        out->write( 'done' ).
      CATCH cx_mbc_api_exception INTO DATA(lx_err).
        out->write( lx_err ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
