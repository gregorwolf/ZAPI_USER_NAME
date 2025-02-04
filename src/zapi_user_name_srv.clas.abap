"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>ZAPI_USER_NAME_SRV</em>
CLASS zapi_user_name_srv DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">UserDetails</p>
      BEGIN OF tys_user_details,
        "! <em>Key property</em> UserName
        user_name      TYPE c LENGTH 12,
        "! Sysid
        sysid          TYPE c LENGTH 8,
        "! Mandt
        mandt          TYPE c LENGTH 3,
        "! Logsys
        logsys         TYPE c LENGTH 10,
        "! Sylangu
        sylangu        TYPE c LENGTH 2,
        "! Language
        language       TYPE c LENGTH 2,
        "! FullUserName
        full_user_name TYPE c LENGTH 80,
        "! Aliasname
        aliasname      TYPE c LENGTH 40,
      END OF tys_user_details,
      "! <p class="shorttext synchronized">List of UserDetails</p>
      tyt_user_details TYPE STANDARD TABLE OF tys_user_details WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! UserDetailsSet
        "! <br/> Collection of type 'UserDetails'
        user_details_set TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'USER_DETAILS_SET',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for UserDetails</p>
        "! See also structure type {@link ..tys_user_details}
        BEGIN OF user_details,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF user_details,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define UserDetails</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_user_details RAISING /iwbep/cx_gateway.

ENDCLASS.


CLASS zapi_user_name_srv IMPLEMENTATION.

  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'ZAPI_USER_NAME_SRV' ) ##NO_TEXT.

    def_user_details( ).

  ENDMETHOD.


  METHOD def_user_details.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'USER_DETAILS'
                                    is_structure              = VALUE tys_user_details( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'UserDetails' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'USER_DETAILS_SET' ).
    lo_entity_set->set_edm_name( 'UserDetailsSet' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'USER_NAME' ).
    lo_primitive_property->set_edm_name( 'UserName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSID' ).
    lo_primitive_property->set_edm_name( 'Sysid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANDT' ).
    lo_primitive_property->set_edm_name( 'Mandt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LOGSYS' ).
    lo_primitive_property->set_edm_name( 'Logsys' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYLANGU' ).
    lo_primitive_property->set_edm_name( 'Sylangu' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE' ).
    lo_primitive_property->set_edm_name( 'Language' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FULL_USER_NAME' ).
    lo_primitive_property->set_edm_name( 'FullUserName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALIASNAME' ).
    lo_primitive_property->set_edm_name( 'Aliasname' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.

  ENDMETHOD.


ENDCLASS.
