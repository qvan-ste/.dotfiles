function plexcode
    set mkv_files *.mkv
    if test (count $mkv_files) -eq 0
        echo "No MKV files found in current directory." >&2
        return 1
    end

    for file_in in $mkv_files
        if not test -f $file_in
            continue
        end

        echo "Processing: $file_in"
        set file_out (string replace -r '\.mkv$' '.plexcode.mkv' $file_in)

        ffmpeg -i $file_in -map 0 -c:v copy -c:a eac3 -ac 2 -c:s copy $file_out

        if test $status -eq 0
            echo "Successfully processed: $file_in -> $file_out"
            rm -rf $file_in
        else
            echo "Encoding failed for: $file_in" >&2
        end
    end
end
