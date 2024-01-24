CLASS zcl_zapi_user_name_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_zapi_user_name_dpc
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.

    METHODS userdetailsset_get_entityset
        REDEFINITION .
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zapi_user_name_dpc_ext IMPLEMENTATION.


  METHOD userdetailsset_get_entityset.
    DATA: user_details TYPE zapi_user_details.

    CALL FUNCTION 'USER_NAME_GET'
      IMPORTING
        user_name      = user_details-user_name
        sysid          = user_details-sysid
        mandt          = user_details-mandt
        logsys         = user_details-logsys
        sylangu        = user_details-sylangu
        language       = user_details-language
        full_user_name = user_details-full_user_name
        aliasname      = user_details-aliasname.

    APPEND user_details TO et_entityset.

  ENDMETHOD.
ENDCLASS.
