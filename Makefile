# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bcosters <bcosters@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/08 10:32:48 by bcosters          #+#    #+#              #
#    Updated: 2021/03/14 14:16:48 by bcosters         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -*- MakeFile for Simple debugs Library -*-

# -*- Variable definitions -*-

#	Project sources/objects/headers

TEST	= tests/test_gnl.c
OBJTEST	= $(TEST:tests/%.c=tests/%.o)

SRCS	= ../get_next_line.c ../get_next_line_utils.c
OBJS	= $(SRCS:../%.c=../%.o)
HEAD	= simple_debugs.h ../get_next_line.h

SRCS_BONUS	= ../get_next_line_bonus.c ../get_next_line_utils_bonus.c
OBJS_BONUS	= $(SRCS_BONUS:../%.c=../%.o)
HEAD_BONUS	= simple_debugs.h ../get_next_line_bonus.h

LIB		= debugs.a
LIBHEAD	= simple_debugs.h

NAME	= testgnl
NAME1	= $(addsuffix 1, $(NAME))
NAME2	= $(addsuffix 2, $(NAME))
NAME5	= $(addsuffix 5, $(NAME))
NAME32	= $(addsuffix 32, $(NAME))
NAME42	= $(addsuffix 42, $(NAME))
NAME256	= $(addsuffix 256, $(NAME))
NAME1K	= $(addsuffix 1000, $(NAME))
NAME9K	= $(addsuffix 9001, $(NAME))
NAME1M	= $(addsuffix 1000000, $(NAME))

# Compiler stuff

CC		= gcc

CFLAGS 	= -Wall -Wextra -Werror

DEFFLAG	= -D

BUFF	= BUFFER_SIZE=

BUFF1	= $(addsuffix 1, $(BUFF))
BUFF2	= $(addsuffix 2, $(BUFF))
BUFF5	= $(addsuffix 5, $(BUFF))
BUFF32	= $(addsuffix 32, $(BUFF))
BUFF42	= $(addsuffix 42, $(BUFF))
BUFF256	= $(addsuffix 256, $(BUFF))
BUFF1K	= $(addsuffix 1000, $(BUFF))
BUFF9K	= $(addsuffix 9001, $(BUFF))
BUFF1M	= $(addsuffix 1000000, $(BUFF))

# Shell scripts

IMPORT	= shell_scripts/import_debugs.sh
YESNO	= shell_scripts/yesno.sh

# -*- Rules -*-
#target: dependencies
#	action

#	Implicit rules

%.o : %.c
			@$(CC) -c $(CFLAGS) $< -o $@

../%.o : ../%.c
			@$(CC) -c $(CFLAGS) $< -o $@

#	Normal rules

all:		start debugs m #b

#Welcome message
start:
			@echo Welcome to GNLtest Version 2: Electric Boogaloo
			@echo The builtin tester checks for memory leaks.
			@echo Do you want to start the fun?
			@bash $(YESNO)
			@echo

#Import debugs
debugs:
			@bash $(IMPORT)
			@echo

#Test
#test_gnl.o:	$(TEST)
#			@$(CC) -c $(CFLAGS) $(LIB) $< -o $@

#	MANDATORY
m:	debugs m1

m1:			$(OBJTEST) $(OBJS) $(HEADER) $(LIB)
			@echo [BUFFER_SIZE = 1]
			@$(CC) $(DEFFLAG) $(BUFF1) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) < test1.txt
			@rm $(NAME1)

.PHONY:		clean

clean:
	@rm -f ${LIB} ${LIBHEAD}

fclean:		clean
	@rm -f ${wildcard testgnl*}

re:			fclean all