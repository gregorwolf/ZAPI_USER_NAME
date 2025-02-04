CLASS zsoap_test_system_info_console DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsoap_test_system_info_console IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(destination) = cl_soap_destination_provider=>create_by_comm_arrangement(
          comm_scenario  = 'ZSOAP_TEST_SYSTEM_INFO'
*     service_id     = '<outbound service>'
*     comm_system_id = '<communication system identifier>'
        ).

        DATA(proxy) = NEW zco_test_system_info( destination = destination ).

        " fill request
        DATA(request) = VALUE ztest_noneed1( ).

        proxy->get_info(
          EXPORTING
            input = request
          IMPORTING
            output = DATA(response)
        ).
        " handle response
        out->write( response ).
      CATCH cx_soap_destination_error INTO DATA(lx_soap_dest).
        " handle error
        out->write( lx_soap_dest->get_longtext( ) ).
      CATCH cx_ai_system_fault INTO DATA(lx_ai_system).
        " handle error
        out->write( lx_ai_system->get_longtext( ) ).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
