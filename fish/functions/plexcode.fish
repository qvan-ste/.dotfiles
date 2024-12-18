function plexcode
    if not set -q argv[1]
        echo "No input file provided." >&2
        return 1
    end

    set fileIn $argv[1]
    set fileOut (string replace -r '\.mkv$' '.plexcode.mkv' $fileIn)

    ffmpeg -i $fileIn -map 0 -c:v copy -c:a aac -ac 2 -c:s copy $fileOut

    if test -f $fileOut
        rm -rf $fileIn
    else
        echo "Encoding failed, output file not created." >&2
        return 1
    end
end
