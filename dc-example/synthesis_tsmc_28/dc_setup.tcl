#--------------------------------------------------------------------
# Logical Library Settings
#--------------------------------------------------------------------
# Define the search path
set_app_var search_path [ concat . $search_path \
                                 $DESIGN_SCRIPT_PATH \
                                 $ADDITIONAL_SEARCH_PATH \
                                 $CURRENT_RTL_SRC]
set_app_var target_library $TARGET_LIBRARY_FILES
set_app_var link_library "* $target_library"
#set_app_var symbol_library $SYMBOL_LIBRARY_FILES
set_app_var designer "Macro"
set_app_var set_constant_register_removal "false"
set_app_var set_unloaded_register_removal "false"
set_app_var compile_enable_regisiter_mergeing "false"
#--------------------------------------------------------------------
