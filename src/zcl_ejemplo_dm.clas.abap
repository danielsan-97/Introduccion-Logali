CLASS zcl_ejemplo_dm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejemplo_dm IMPLEMENTATION.


  METHOD  if_oo_adt_classrun~main.
*Variables sencillas............................................................................................
    DATA: lv_string   TYPE string,                                   "Cadena de caracteres
          lv_entero   TYPE i VALUE 20250808,                         "Numero entero
          lv_fecha    TYPE d VALUE '20250808',                       "Fecha
          lv_decimal  TYPE p LENGTH 8 DECIMALS 2 VALUE '202508.08',  "Decimal
          lv_caracter TYPE c LENGTH 6 VALUE 'a'.

    lv_string =  '20250808'.

    out->write( 'Hola mundo' ).
    out->write( lv_string ).
    out->write( lv_entero ).
    out->write( lv_fecha ).
    out->write( lv_decimal ).
    out->write( lv_caracter ).

*Variables complejas............................................................................................
    TYPES: BEGIN OF lt_ejemplo,
             id   TYPE i,
             name TYPE string,
             age  TYPE i,
           END OF lt_ejemplo.

    DATA ls_ejemplo TYPE lt_ejemplo.

    ls_ejemplo = VALUE #( id = 1075684173
                          name = 'Daniel Santiago'
                          age = 27 ).
    out->write( ls_ejemplo ).
    out->write( |Id: { ls_ejemplo-id } Name: { ls_ejemplo-name } Age: { ls_ejemplo-age }| ).


    TYPES: BEGIN OF ENUM lt_enumen,
             vacio,
             medio,
             lleno,
           END OF ENUM lt_enumen.

    DATA lv_status TYPE lt_enumen.
    lv_status = lleno.

    CASE lv_status.

      WHEN vacio.
        out->write( 'Vacio, llenelo' ).

      WHEN medio.
        out->write( 'Meido, llenelo' ).

      WHEN lleno.
        out->write( 'Lleno, vacielo' ).

      WHEN OTHERS.
        out->write( 'Ninguno' ).

    ENDCASE.

    out->write( |Estatus = { lv_status }| ).


*Tipos de referencia..................................................................................................
    DATA: lv_iref       TYPE  REF TO i,
          lv_stringref  TYPE REF TO string,
          lvt_tabla_ref TYPE  REF TO /dmo/airport.

    DATA: lv_iref2 LIKE lv_iref.

    TYPES: lt_iref TYPE REF TO i.
    DATA lv_iref3 TYPE lt_iref.

    DATA lt_reftab TYPE TABLE OF REF TO /dmo/airport.

    CONSTANTS num1 TYPE i VALUE 32.


*Conversion de datos
    DATA: lv_fecha2 TYPE d VALUE '20201010'.
    out->write( |Fecha en formato    = { lv_fecha2 DATE = USER }| ).

*Conversion forzada
    DATA(lv_fecha3) = '20201010'.
    DATA(lv_fecha_con) = CONV d( lv_fecha3 ).

*Fecha y hora
    DATA: lv_fecha_now TYPE d,
          lv_time_now  TYPE t.

    lv_fecha_now = cl_abap_context_info=>get_system_date( ).
    lv_time_now = cl_abap_context_info=>get_system_time(  ).

    DATA(lv_mes) = lv_fecha2+4(2).
    DATA(lv_year) = lv_fecha2(4).
    DATA(lv_dia) = lv_fecha2+6(2).

*Campos Timestamp
    DATA: lv_timestap  TYPE utclong,
          lv_timestap2 TYPE utclong.

    lv_timestap = utclong_current(  ). "Funcion que trae fecha hora y zona horaria del servidor
    out->write( lv_timestap ).

    lv_timestap = utclong_add( val = lv_timestap days = 1 hours = -2 ).
    out->write( lv_timestap ).


    lv_timestap2 = utclong_current(  ).

    DATA(lv_fecha_total) = utclong_diff( high = lv_timestap low = lv_timestap2 ).
    out->write( lv_fecha_total ).

    DATA: lv_date TYPE d,
          lv_time TYPE t.

    CONVERT UTCLONG lv_timestap
        TIME ZONE cl_abap_context_info=>get_user_time_zone(  )
        INTO DATE lv_date
        TIME lv_time.

    out->write( lv_date ).
    out->write( lv_time ).


  ENDMETHOD.
ENDCLASS.
