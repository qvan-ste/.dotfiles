function cppp
    # Assert correct usage 
    if test (count $argv) -ne 2
        echo "usage: cppp {dir} {project}" >&2
        return 1
    end

    set dir $argv[1]
    set project $argv[2]

    # Create directory if it doesn't exist
    if test ! -d $dir
        mkdir -p $dir
    end
    cd $dir

    # Create project file if it doesn't exist and add template
    if test ! -e "$project.cpp"
        touch "$project.cpp"
        echo "int main (void) {
}
" > $project.cpp
    end

   # Create Makefile if it doesn't exist and add template
    if test ! -e Makefile
        touch Makefile
    echo "RED = \033[0;31m
ORANGE = \033[0;33m
GREEN = \033[0;32m
NO_COLOUR = \033[0m

CPPFILES = $project.cpp
OFILES = \$(CPPFILES:.cpp=.o)

CXXFLAGS = -Wall -Werror -Wextra -std=c++20

NAME = $project

all: \$(NAME)

.cpp.o:
	@echo \"\$(ORANGE)[\$(NAME)] Compiling \$<\$(NO_COLOUR)\"
	@\$(CXX) -c \$(CXXFLAGS) \$< -o \$@

\$(NAME): \$(OFILES)
	@\$(CXX) \$(CXXFLAGS) \$(OFILES) -o \$(NAME)
	@echo \"\$(GREEN)[\$(NAME)] Compiling finished\$(NO_COLOUR)\"

clean:
	@echo \"\$(RED)[\$(NAME)] Removing .o files\$(NO_COLOUR)\"
	@rm -f \$(OFILES)

fclean: clean
	@echo \"\$(RED)[\$(NAME)] Removing \$(NAME)\$(NO_COLOUR)\"
	@rm -f \$(NAME)

re: fclean all

.PHONY: all clean fclean re .cpp.o" > Makefile
    end

end 