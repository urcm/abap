***** WS_FILENAME_GET ist veraltet
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(DEF_FILENAME) DEFAULT SPACE
*"     VALUE(DEF_PATH) DEFAULT SPACE
*"     VALUE(MASK) DEFAULT SPACE
*"     VALUE(MODE) DEFAULT SPACE
*"     VALUE(TITLE) DEFAULT SPACE
*"  EXPORTING
*"     VALUE(FILENAME)
*"     VALUE(RC)
*"  EXCEPTIONS
*"      INV_WINSYS
*"      NO_BATCH
*"      SELECTION_CANCEL
*"      SELECTION_ERROR
*"----------------------------------------------------------------------


parameters: p_file type rlgrap-filename obligatory.


at selection-screen on value-request for p_file.

call function 'WS_FILENAME_GET'
    exporting
        def_filename = space
        def_path = p_file
        mask = ',*.*.'
        mode = 'O'
        title = 'Datei auswählen'
    importing
        filename = p_file
*        rc = dummy
    exceptions
        inv_winsys = 04
        no_batch = 08
        selection_cancel = 12
        selection_error = 16.

start-of-selection.

write :/ p_file.

