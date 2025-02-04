CLASS zrfc_user_name_get DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_aco_proxy .

    TYPES:
      usalias                        TYPE c LENGTH 000040 ##TYPSHADOW .
    TYPES:
      ad_namtext                     TYPE c LENGTH 000080 ##TYPSHADOW .
    TYPES:
      laiso                          TYPE c LENGTH 000002 ##TYPSHADOW .
    TYPES:
      logsys                         TYPE c LENGTH 000010 ##TYPSHADOW .
    TYPES:
      syst_mandt                     TYPE c LENGTH 000003 ##TYPSHADOW .
    TYPES:
      syst_langu                     TYPE c LENGTH 000001 ##TYPSHADOW .
    TYPES:
      syst_sysid                     TYPE c LENGTH 000008 ##TYPSHADOW .
    TYPES:
      syst_uname                     TYPE c LENGTH 000012 ##TYPSHADOW .

    METHODS constructor
      IMPORTING
        !destination TYPE REF TO if_rfc_dest
      RAISING
        cx_rfc_dest_provider_error .
    METHODS user_name_get
      EXPORTING
        !aliasname      TYPE usalias
        !full_user_name TYPE ad_namtext
        !language       TYPE laiso
        !logsys         TYPE logsys
        !mandt          TYPE syst_mandt
        !sylangu        TYPE syst_langu
        !sysid          TYPE syst_sysid
        !user_name      TYPE syst_uname
      RAISING
        cx_aco_application_exception
        cx_aco_communication_failure
        cx_aco_system_failure .
  PROTECTED SECTION.

    DATA destination TYPE rfcdest .
  PRIVATE SECTION.
ENDCLASS.



CLASS zrfc_user_name_get IMPLEMENTATION.


  METHOD constructor.
    me->destination = destination->get_destination_name( ).
  ENDMETHOD.


  METHOD user_name_get.
    DATA: _rfc_message_ TYPE aco_proxy_msg_type.
    CALL FUNCTION 'USER_NAME_GET' DESTINATION me->destination
      IMPORTING
        aliasname             = aliasname
        full_user_name        = full_user_name
        language              = language
        logsys                = logsys
        mandt                 = mandt
        sylangu               = sylangu
        sysid                 = sysid
        user_name             = user_name
      EXCEPTIONS
        communication_failure = 1 MESSAGE _rfc_message_
        system_failure        = 2 MESSAGE _rfc_message_
        OTHERS                = 3.
    IF sy-subrc NE 0.
      DATA __sysubrc TYPE sy-subrc.
      DATA __textid TYPE aco_proxy_textid_type.
      __sysubrc = sy-subrc.
      __textid-msgid = sy-msgid.
      __textid-msgno = sy-msgno.
      __textid-attr1 = sy-msgv1.
      __textid-attr2 = sy-msgv2.
      __textid-attr3 = sy-msgv3.
      __textid-attr4 = sy-msgv4.
      CASE __sysubrc.
        WHEN 1 .
          RAISE EXCEPTION TYPE cx_aco_communication_failure
            EXPORTING
              rfc_msg = _rfc_message_.
        WHEN 2 .
          RAISE EXCEPTION TYPE cx_aco_system_failure
            EXPORTING
              rfc_msg = _rfc_message_.
        WHEN 3 .
          RAISE EXCEPTION TYPE cx_aco_application_exception
            EXPORTING
              exception_id = 'OTHERS'
              textid       = __textid.
      ENDCASE.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
