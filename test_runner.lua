require "test_table_util"
require "test_sessions_filter"

function test_runner()
    print("Starting tests...")
    test_array_contains()
    test_string_split()
    test_string_strip()
    test_sessions_filter_location()
    test_sessions_filter_track()
    test_sessions_filter_multiple()
    test_sessions_filter_real_data()
    print("Tests done.")
end

return test_runner