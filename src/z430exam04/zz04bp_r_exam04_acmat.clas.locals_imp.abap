CLASS lhc_Stock DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    " Name korrigiert: 'global_authorization' statt 'get_global_authorizations'
    METHODS global_authorization FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Stock RESULT result.

ENDCLASS.

CLASS lhc_Stock IMPLEMENTATION.

  METHOD global_authorization.
    " Simpler Freipass für die Prüfung: Erlaubt das Erstellen, Ändern und Löschen
    result-%create = if_abap_behv=>auth-allowed.
    result-%update = if_abap_behv=>auth-allowed.
    result-%delete = if_abap_behv=>auth-allowed.
  ENDMETHOD.

ENDCLASS.
