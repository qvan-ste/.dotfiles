function cpph
	# Assert correct usage
	if test (count $argv) -ne 1 -a (count $argv) -ne 2
        echo "usage: cpph {header} (optional) {content}" >&2
        return 1
    end

	# Define header content if passed as argument
	if set -q argv[2]
		set content $argv[2]
	else
		set content ""
	end

	#Create header file if it doesn't exist
	set headerName $argv[1]
	set headerFile $headerName.hpp
	if test ! -e $headerFile
		touch $headerFile
	end

	# Add header template to header file
	set headerGuard (upper_string_case $headerName)"_HPP"
	echo "#ifndef $headerGuard
#define $headerGuard

$content

#endif" > $headerFile
end

function upper_string_case
    set -l input_string $argv[1]
    set -l transformed_string (echo $input_string | sed -E 's/([A-Z])/_\1/g' | sed 's/^_//' | tr '[:lower:]' '[:upper:]')
    echo $transformed_string
end
