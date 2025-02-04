CLASS zrfc_user_name_get_console DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrfc_user_name_get_console IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA dest TYPE REF TO if_rfc_dest.
    DATA myobj  TYPE REF TO zrfc_user_name_get.

    DATA aliasname TYPE zrfc_user_name_get=>usalias.
    DATA full_user_name TYPE zrfc_user_name_get=>ad_namtext.
    DATA language TYPE zrfc_user_name_get=>laiso.
    DATA logsys TYPE zrfc_user_name_get=>logsys.
    DATA mandt TYPE zrfc_user_name_get=>syst_mandt.
    DATA sylangu TYPE zrfc_user_name_get=>syst_langu.
    DATA sysid TYPE zrfc_user_name_get=>syst_sysid.
    DATA user_name TYPE zrfc_user_name_get=>syst_uname.

    TRY.
        dest = cl_rfc_destination_provider=>create_by_comm_arrangement(
          comm_scenario = 'ZRFC_USER_NAME_GET'
        ).

        CREATE OBJECT myobj
          EXPORTING
            destination = dest.

        myobj->user_name_get(
           IMPORTING
             aliasname = aliasname
             full_user_name = full_user_name
             language = language
             logsys = logsys
             mandt = mandt
             sylangu = sylangu
             sysid = sysid
             user_name = user_name
         ).

        out->write( full_user_name ).
      CATCH  cx_aco_communication_failure INTO DATA(lcx_comm).
        " handle CX_ACO_COMMUNICATION_FAILURE (sy-msg* in lcx_comm->IF_T100_MESSAGE~T100KEY)
        out->write( lcx_comm->get_longtext( ) ).
      CATCH cx_aco_system_failure INTO DATA(lcx_sys).
        " handle CX_ACO_SYSTEM_FAILURE (sy-msg* in lcx_sys->IF_T100_MESSAGE~T100KEY)
        out->write( lcx_sys->get_longtext( ) ).
      CATCH cx_aco_application_exception INTO DATA(lcx_appl).
        " handle APPLICATION_EXCEPTIONS (sy-msg* in lcx_appl->IF_T100_MESSAGE~T100KEY)
        out->write( lcx_appl->get_longtext( ) ).
      CATCH cx_rfc_dest_provider_error into DATA(lcx_provider).
        " handle CX_RFC_DEST_PROVIDER_ERROR
        out->write( lcx_provider->get_longtext( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
