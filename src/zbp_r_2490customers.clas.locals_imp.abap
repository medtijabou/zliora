CLASS LHC_ZR_2490CUSTOMERS DEFINITION
  INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.

  PRIVATE SECTION.

    METHODS:

      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
          REQUEST requested_authorizations FOR Customers
        RESULT result,

      setCustomerID FOR DETERMINE ON MODIFY
        keys FOR Customers~setCustomerID.

ENDCLASS.


CLASS LHC_ZR_2490CUSTOMERS IMPLEMENTATION.

  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.


  METHOD setCustomerID.

    DATA lv_max_customer_id   TYPE z2490customerid.
    DATA lv_next_number       TYPE i.
    DATA lv_next_customer_id TYPE z2490customerid.

    SELECT MAX( customer_id )
      FROM z2490customers
      INTO @lv_max_customer_id.

    lv_next_number = CONV i( lv_max_customer_id ).

    DATA lt_update TYPE TABLE FOR UPDATE zr_2490customers.

    LOOP AT keys INTO DATA(key).

      lv_next_number = lv_next_number + 1.

      lv_next_customer_id = lv_next_number.

      APPEND VALUE #(
        %tky       = key-%tky
        CustomerID = lv_next_customer_id
      ) TO lt_update.

    ENDLOOP.

    MODIFY ENTITIES OF zr_2490customers IN LOCAL MODE
      ENTITY Customers
        UPDATE FIELDS ( CustomerID )
        WITH lt_update.

  ENDMETHOD.

ENDCLASS.
