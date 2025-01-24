function cppc
	# Assert correct usage
    if test (count $argv) -ne 1
        echo "usage: cppp {class}" >&2
        return 1
    end

	set className $argv[1]
	set classFile $className.cpp

	# Create class file if it doesn't exist
	if test ! -e $classFile
		touch $classFile
	end

    set classDeclaration "class $className {

};"
	set headerFile $className.hpp
	
	# Create header file if it doesn't exist
	if test ! -e $headerFile
		cpph $className $classDeclaration
	end

	# Add template to class file
	echo "#include \"$headerFile\"

" > $classFile

end
