CLASS zcl_campos_texto_dm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_campos_texto_dm IMPLEMENTATION.

  METHOD  if_oo_adt_classrun~main.
    out->write( 'Cadena de texto' ).
    "Para crear clic derecho, open others y tex elements
    out->write( TEXT-t01 ).
    out->write( 'Prueba'(t02) ). "Si no encuenra el simbolo de texto pone la frase que la antecede

    "Se puede crear directamente en el codigo fuente
    out->write( TEXT-t03 ).
    out->write( 'Prueba de texto cuatro'(t04) ).

*Funciones con cadenas
*Parametros
    DATA lv_texto TYPE string VALUE 'Prueba1234BA'.

    DATA(lv_string) = find( val = lv_texto sub = 'ba' case = abap_true occ = 1 ). "Devuelve posicion de la coincidencia
    out->write( lv_string ).

*Descripcion
    DATA(lv_num) = strlen( '   PRUEBA  ' ). "Cuenta caracteres e ignora los espacios al final
    out->write( lv_num  ).

    CLEAR lv_num.
    lv_num = numofchar( '   PRUEBA  ' ). " Tambien cuenta caracteres
    out->write( lv_num  ).

*Count
    CLEAR lv_num.
    lv_num = count( val = lv_texto sub = 'ba' ). "cantidad de coincidencias
    out->write( lv_num  ).

    CLEAR lv_num.
    lv_num = count_any_of( val = lv_texto sub = 'ba' ). "cuenta coincidencias nde manera individual
    out->write( lv_num  ).

    CLEAR lv_num.
    lv_num = count_any_not_of( val = lv_texto sub = 'ba' ). "cuenta las no coincidencias
    out->write( lv_num  ).

*FIND
    CLEAR lv_num.
    lv_num = find( val = lv_texto sub = 'ba' ). "Posicion en la que esta la coincidencia
    out->write( lv_num  ).

    CLEAR lv_num.
    lv_num = find_any_of( val = lv_texto sub = 'ba' ). "Posicion individual de cualquier caracter
    out->write( lv_num  ).

    CLEAR lv_num.
    lv_num = find_any_not_of( val = lv_texto sub = 'ba' ). "Posicion de primera no coincidencia
    out->write( lv_num  ).

*Funciones de procesamiento
    CLEAR lv_texto.
    lv_texto = '  pRUEBA cOn cADeNA dE cARACTeRES  '.

    "MAYUS minus
    out->write( |A MAYUS  = {   to_upper( lv_texto ) }| ).
    out->write( |A MINUS  = {   to_lower( lv_texto ) }| ).
    out->write( |MIX      = {   to_mixed( lv_texto ) }| ).
    out->write( |FROM_MIX = { from_mixed( lv_texto ) }| ).

    "Order
    out->write( |REVERSE               = { reverse( lv_texto ) }| ).
    out->write( |SHIFT LEFT (places)   = { shift_left(   val = lv_texto places = 3 ) }| ).
    out->write( |SHIFT RIGHT (places)  = { shift_right(  val = lv_texto places = 3 ) }| ).
    out->write( |SHIFT LEFT (circ)     = { shift_left(   val = lv_texto places = 3 ) }| ).
    out->write( |SHIFT RIGHT (circ)    = { shift_right(  val = lv_texto places = 3 ) }| ).

    "Substring
    out->write( |SUBSTRING          = { substring(  val = lv_texto off = 3 len = 2 ) }| ).
    out->write( |SUBSTRING_FROM     = { substring_from(    val = lv_texto sub = 'dE' ) }| ).
    out->write( |SUBSTRING_AFTER    = { substring_after(   val = lv_texto sub = 'dE' ) }| ).
    out->write( |SUBSTRING_TO       = { substring_to(      val = lv_texto sub = 'dE' ) }| ).
    out->write( |SUBSTRING_BEFORE   = { substring_before(  val = lv_texto sub = 'dE' ) }| ).

    "Others
    out->write( |CODENSE = { condense( val = lv_texto ) }| ).
    out->write( |REPEAT = { repeat( val = lv_texto  occ = 2 ) }| ).
    out->write( |SEGMENT1 = { segment( val = lv_texto sep = 'dE' index =  1 ) }| ).
    out->write( |SEGMENT2 = { segment( val = lv_texto sep = 'dE' index =  2 ) }| ).

*Funciones de contenido
    CLEAR lv_texto.
    DATA lv_pattern TYPE string.

    lv_texto = 'El numero en cuestion es 113-433-3445'.
    lv_pattern = '\d{3}-\d{3}-\d{4}'.

    IF contains( val = lv_texto pcre = lv_pattern ).
      out->write( 'Si hay numero' ).
    ELSE.
      out->write( 'No hay numero' ).
    ENDIF.

    "MATCH
    DATA(lv_numero) = match( val = lv_texto pcre = lv_pattern occ = 1 ).
    out->write( lv_numero ).

  ENDMETHOD.

ENDCLASS.
