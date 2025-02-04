class ZCO_TEST_SYSTEM_INFO definition
  public
  inheriting from CL_PROXY_CLIENT
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !DESTINATION type ref to IF_PROXY_DESTINATION optional
      !LOGICAL_PORT_NAME type PRX_LOGICAL_PORT_NAME optional
    preferred parameter LOGICAL_PORT_NAME
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_INFO
    importing
      !INPUT type ZTEST_NONEED1
    exporting
      !OUTPUT type ZTEST_SYS_RESP1
    raising
      CX_AI_SYSTEM_FAULT .
protected section.
private section.
ENDCLASS.



CLASS ZCO_TEST_SYSTEM_INFO IMPLEMENTATION.


  method CONSTRUCTOR.

  super->constructor(
    class_name          = 'ZCO_TEST_SYSTEM_INFO'
    logical_port_name   = logical_port_name
    destination         = destination
  ).

  endmethod.


  method GET_INFO.

  data(lt_parmbind) = value abap_parmbind_tab(
    ( name = 'INPUT' kind = '0' value = ref #( INPUT ) )
    ( name = 'OUTPUT' kind = '1' value = ref #( OUTPUT ) )
  ).
  if_proxy_client~execute(
    exporting
      method_name = 'GET_INFO'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.
ENDCLASS.
