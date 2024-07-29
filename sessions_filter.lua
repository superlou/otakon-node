-- Filter a table of sessions in place
function sessions_filter(sessions, location_str, track_str)
    if location_str then
        filter_inplace(sessions, function(session)
            for location in string_split(location_str, ",") do
                if array_contains(session.locations, string_strip(location)) then
                    return true
                end 
            end

            return false
        end)
    end

    if track_str then
        filter_inplace(sessions, function(session)
            for track in string_split(track_str, ",") do
                if array_contains(session.tracks, string_strip(track)) then
                    return true
                end
            end

            return false
        end)
    end

    return sessions
end

return sessions_filter