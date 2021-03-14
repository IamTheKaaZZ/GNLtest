# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bcosters <bcosters@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/08 10:32:48 by bcosters          #+#    #+#              #
#    Updated: 2021/03/14 17:18:36 by bcosters         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -*- MakeFile for Simple debugs Library -*-

# -*- Variable definitions -*-

#	Project sources/objects/headers

TEST	= tests/test_gnl.c
OBJTEST	= $(TEST:tests/%.c=tests/%.o)
TESTLOG	= ${shell find deepthought -type f \( -name *.log ! -name *output.log \)}

SRCS	= ../get_next_line.c ../get_next_line_utils.c
OBJS	= $(SRCS:../%.c=%.o)
HEAD	= simple_debugs.h ../get_next_line.h

SRCS_BONUS	= ../get_next_line_bonus.c ../get_next_line_utils_bonus.c
OBJS_BONUS	= $(SRCS_BONUS:../%.c=%.o)
HEAD_BONUS	= simple_debugs.h ../get_next_line_bonus.h

LIB		= debugs.a
LIBHEAD	= simple_debugs.h

NAME	= testgnl
NAME1	= $(addsuffix 1, $(NAME))

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

# COLOURS!!!!!

RED		= \033[0;31m
GREEN	= \033[0;32m
LGREEN	= \033[1;32m
ORANGE	= \033[0;33m
YELLOW	= \033[1;33m
LPURP	= \033[1;35m
CYAN	= \033[0;36m
ENDC	= \033[0m

# -*- Rules -*-
#target: dependencies
#	action

#	Implicit rules

%.o : %.c
			@$(CC) -c $(CFLAGS) $< -o $@

#../%.o : ../%.c
#			@$(CC) -c $(CFLAGS) $< -o $@

#	Normal rules

all:		start debugs m end #b

#Welcome message
start:
			@echo "Welcome to $(LGREEN)GNLtest Version 2$(ENDC): $(YELLOW)Electric $(LPURP)Boogaloo$(ENDC)"
			@echo "The builtin tester checks for $(CYAN)memory leaks$(ENDC)."
			@echo "Do you want to $(GREEN)start$(ENDC) the $(RED)FUN$(ENDC)?"
			@bash $(YESNO)
			@echo

#Import debugs
debugs:
			@bash $(IMPORT)
			@echo

#	MANDATORY
m:	m1 m2 m5 m32 m42 m256 m1K m9K m1M

m1:			$(OBJTEST) $(SRCS) $(HEADER) $(LIB)
			@echo "$(LGREEN)[BUFFER_SIZE = 1]$(ENDC)"
			@$(CC) $(DEFFLAG) $(BUFF1) $(CFLAGS) -c $(SRCS)
			@$(CC) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) "tests/test1.txt" > deepthought/test1.log
			@[[ `diff deepthought/test1.log deepthought/test1output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 2]
			@./$(NAME1) "tests/test2.txt" > deepthought/test2.log
			@[[ `diff deepthought/test2.log deepthought/test2output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 3]
			@./$(NAME1) "tests/test3.txt" > deepthought/test3.log
			@[[ `diff deepthought/test3.log deepthought/test3output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 4]
			@./$(NAME1) "tests/test4.txt" > deepthought/test4.log
			@[[ `diff deepthought/test4.log deepthought/test4output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 5]
			@./$(NAME1) "tests/test5.txt" > deepthought/test5.log
			@[[ `diff deepthought/test5.log deepthought/test5output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 6]
			@./$(NAME1) "tests/test6.txt" > deepthought/test6.log
			@[[ `diff deepthought/test6.log deepthought/test6output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 7]
			@./$(NAME1) "tests/test7.txt" > deepthought/test7.log
			@[[ `diff deepthought/test7.log deepthought/test7output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 8]
			@./$(NAME1) "tests/test8.txt" > deepthought/test8.log
			@rm $(NAME1) $(OBJS)
			@[[ `diff deepthought/test8.log deepthought/test8output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)

m2:			$(OBJTEST) $(SRCS) $(HEADER) $(LIB)
			@echo "$(LGREEN)[BUFFER_SIZE = 2]$(ENDC)"
			@$(CC) $(DEFFLAG) $(BUFF2) $(CFLAGS) -c $(SRCS)
			@$(CC) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) "tests/test1.txt" > deepthought/test1.log
			@[[ `diff deepthought/test1.log deepthought/test1output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 2]
			@./$(NAME1) "tests/test2.txt" > deepthought/test2.log
			@[[ `diff deepthought/test2.log deepthought/test2output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 3]
			@./$(NAME1) "tests/test3.txt" > deepthought/test3.log
			@[[ `diff deepthought/test3.log deepthought/test3output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 4]
			@./$(NAME1) "tests/test4.txt" > deepthought/test4.log
			@[[ `diff deepthought/test4.log deepthought/test4output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 5]
			@./$(NAME1) "tests/test5.txt" > deepthought/test5.log
			@[[ `diff deepthought/test5.log deepthought/test5output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 6]
			@./$(NAME1) "tests/test6.txt" > deepthought/test6.log
			@[[ `diff deepthought/test6.log deepthought/test6output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 7]
			@./$(NAME1) "tests/test7.txt" > deepthought/test7.log
			@[[ `diff deepthought/test7.log deepthought/test7output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 8]
			@./$(NAME1) "tests/test8.txt" > deepthought/test8.log
			@rm $(NAME1) $(OBJS)
			@[[ `diff deepthought/test8.log deepthought/test8output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)

m5:			$(OBJTEST) $(SRCS) $(HEADER) $(LIB)
			@echo "$(LGREEN)[BUFFER_SIZE = 5]$(ENDC)"
			@$(CC) $(DEFFLAG) $(BUFF5) $(CFLAGS) -c $(SRCS)
			@$(CC) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) "tests/test1.txt" > deepthought/test1.log
			@[[ `diff deepthought/test1.log deepthought/test1output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 2]
			@./$(NAME1) "tests/test2.txt" > deepthought/test2.log
			@[[ `diff deepthought/test2.log deepthought/test2output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 3]
			@./$(NAME1) "tests/test3.txt" > deepthought/test3.log
			@[[ `diff deepthought/test3.log deepthought/test3output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 4]
			@./$(NAME1) "tests/test4.txt" > deepthought/test4.log
			@[[ `diff deepthought/test4.log deepthought/test4output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 5]
			@./$(NAME1) "tests/test5.txt" > deepthought/test5.log
			@[[ `diff deepthought/test5.log deepthought/test5output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 6]
			@./$(NAME1) "tests/test6.txt" > deepthought/test6.log
			@[[ `diff deepthought/test6.log deepthought/test6output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 7]
			@./$(NAME1) "tests/test7.txt" > deepthought/test7.log
			@[[ `diff deepthought/test7.log deepthought/test7output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 8]
			@./$(NAME1) "tests/test8.txt" > deepthought/test8.log
			@rm $(NAME1) $(OBJS)
			@[[ `diff deepthought/test8.log deepthought/test8output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)

m32:		$(OBJTEST) $(SRCS) $(HEADER) $(LIB)
			@echo "$(LGREEN)[BUFFER_SIZE = 32]$(ENDC)"
			@$(CC) $(DEFFLAG) $(BUFF32) $(CFLAGS) -c $(SRCS)
			@$(CC) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) "tests/test1.txt" > deepthought/test1.log
			@[[ `diff deepthought/test1.log deepthought/test1output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 2]
			@./$(NAME1) "tests/test2.txt" > deepthought/test2.log
			@[[ `diff deepthought/test2.log deepthought/test2output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 3]
			@./$(NAME1) "tests/test3.txt" > deepthought/test3.log
			@[[ `diff deepthought/test3.log deepthought/test3output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 4]
			@./$(NAME1) "tests/test4.txt" > deepthought/test4.log
			@[[ `diff deepthought/test4.log deepthought/test4output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 5]
			@./$(NAME1) "tests/test5.txt" > deepthought/test5.log
			@[[ `diff deepthought/test5.log deepthought/test5output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 6]
			@./$(NAME1) "tests/test6.txt" > deepthought/test6.log
			@[[ `diff deepthought/test6.log deepthought/test6output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 7]
			@./$(NAME1) "tests/test7.txt" > deepthought/test7.log
			@[[ `diff deepthought/test7.log deepthought/test7output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 8]
			@./$(NAME1) "tests/test8.txt" > deepthought/test8.log
			@rm $(NAME1) $(OBJS)
			@[[ `diff deepthought/test8.log deepthought/test8output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)

m42:		$(OBJTEST) $(SRCS) $(HEADER) $(LIB)
			@echo "$(LGREEN)[BUFFER_SIZE = 42]$(ENDC)"
			@$(CC) $(DEFFLAG) $(BUFF42) $(CFLAGS) -c $(SRCS)
			@$(CC) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) "tests/test1.txt" > deepthought/test1.log
			@[[ `diff deepthought/test1.log deepthought/test1output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 2]
			@./$(NAME1) "tests/test2.txt" > deepthought/test2.log
			@[[ `diff deepthought/test2.log deepthought/test2output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 3]
			@./$(NAME1) "tests/test3.txt" > deepthought/test3.log
			@[[ `diff deepthought/test3.log deepthought/test3output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 4]
			@./$(NAME1) "tests/test4.txt" > deepthought/test4.log
			@[[ `diff deepthought/test4.log deepthought/test4output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 5]
			@./$(NAME1) "tests/test5.txt" > deepthought/test5.log
			@[[ `diff deepthought/test5.log deepthought/test5output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 6]
			@./$(NAME1) "tests/test6.txt" > deepthought/test6.log
			@[[ `diff deepthought/test6.log deepthought/test6output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 7]
			@./$(NAME1) "tests/test7.txt" > deepthought/test7.log
			@[[ `diff deepthought/test7.log deepthought/test7output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 8]
			@./$(NAME1) "tests/test8.txt" > deepthought/test8.log
			@rm $(NAME1) $(OBJS)
			@[[ `diff deepthought/test8.log deepthought/test8output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)

m256:		$(OBJTEST) $(SRCS) $(HEADER) $(LIB)
			@echo "$(LGREEN)[BUFFER_SIZE = 256]$(ENDC)"
			@$(CC) $(DEFFLAG) $(BUFF256) $(CFLAGS) -c $(SRCS)
			@$(CC) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) "tests/test1.txt" > deepthought/test1.log
			@[[ `diff deepthought/test1.log deepthought/test1output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 2]
			@./$(NAME1) "tests/test2.txt" > deepthought/test2.log
			@[[ `diff deepthought/test2.log deepthought/test2output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 3]
			@./$(NAME1) "tests/test3.txt" > deepthought/test3.log
			@[[ `diff deepthought/test3.log deepthought/test3output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 4]
			@./$(NAME1) "tests/test4.txt" > deepthought/test4.log
			@[[ `diff deepthought/test4.log deepthought/test4output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 5]
			@./$(NAME1) "tests/test5.txt" > deepthought/test5.log
			@[[ `diff deepthought/test5.log deepthought/test5output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 6]
			@./$(NAME1) "tests/test6.txt" > deepthought/test6.log
			@[[ `diff deepthought/test6.log deepthought/test6output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 7]
			@./$(NAME1) "tests/test7.txt" > deepthought/test7.log
			@[[ `diff deepthought/test7.log deepthought/test7output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 8]
			@./$(NAME1) "tests/test8.txt" > deepthought/test8.log
			@rm $(NAME1) $(OBJS)
			@[[ `diff deepthought/test8.log deepthought/test8output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)

m1K:		$(OBJTEST) $(SRCS) $(HEADER) $(LIB)
			@echo "$(LGREEN)[BUFFER_SIZE = 1000]$(ENDC)"
			@$(CC) $(DEFFLAG) $(BUFF1K) $(CFLAGS) -c $(SRCS)
			@$(CC) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) "tests/test1.txt" > deepthought/test1.log
			@[[ `diff deepthought/test1.log deepthought/test1output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 2]
			@./$(NAME1) "tests/test2.txt" > deepthought/test2.log
			@[[ `diff deepthought/test2.log deepthought/test2output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 3]
			@./$(NAME1) "tests/test3.txt" > deepthought/test3.log
			@[[ `diff deepthought/test3.log deepthought/test3output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 4]
			@./$(NAME1) "tests/test4.txt" > deepthought/test4.log
			@[[ `diff deepthought/test4.log deepthought/test4output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 5]
			@./$(NAME1) "tests/test5.txt" > deepthought/test5.log
			@[[ `diff deepthought/test5.log deepthought/test5output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 6]
			@./$(NAME1) "tests/test6.txt" > deepthought/test6.log
			@[[ `diff deepthought/test6.log deepthought/test6output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 7]
			@./$(NAME1) "tests/test7.txt" > deepthought/test7.log
			@[[ `diff deepthought/test7.log deepthought/test7output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 8]
			@./$(NAME1) "tests/test8.txt" > deepthought/test8.log
			@rm $(NAME1) $(OBJS)
			@[[ `diff deepthought/test8.log deepthought/test8output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)

m9K:		$(OBJTEST) $(SRCS) $(HEADER) $(LIB)
			@echo "$(RED)[🤯 BUFFER_SIZE IS OVER 9000!!!! 🤯]$(ENDC)" && sleep 3
			@echo "$(LGREEN)[BUFFER_SIZE=9001]$(ENDC)"
			@$(CC) $(DEFFLAG) $(BUFF9K) $(CFLAGS) -c $(SRCS)
			@$(CC) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) "tests/test1.txt" > deepthought/test1.log
			@[[ `diff deepthought/test1.log deepthought/test1output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 2]
			@./$(NAME1) "tests/test2.txt" > deepthought/test2.log
			@[[ `diff deepthought/test2.log deepthought/test2output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 3]
			@./$(NAME1) "tests/test3.txt" > deepthought/test3.log
			@[[ `diff deepthought/test3.log deepthought/test3output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 4]
			@./$(NAME1) "tests/test4.txt" > deepthought/test4.log
			@[[ `diff deepthought/test4.log deepthought/test4output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 5]
			@./$(NAME1) "tests/test5.txt" > deepthought/test5.log
			@[[ `diff deepthought/test5.log deepthought/test5output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 6]
			@./$(NAME1) "tests/test6.txt" > deepthought/test6.log
			@[[ `diff deepthought/test6.log deepthought/test6output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 7]
			@./$(NAME1) "tests/test7.txt" > deepthought/test7.log
			@[[ `diff deepthought/test7.log deepthought/test7output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 8]
			@./$(NAME1) "tests/test8.txt" > deepthought/test8.log
			@rm $(NAME1) $(OBJS)
			@[[ `diff deepthought/test8.log deepthought/test8output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)

m1M:		$(OBJTEST) $(SRCS) $(HEADER) $(LIB)
			@echo "$(LGREEN)[BUFFER_SIZE = 1000000]$(ENDC)"
			@$(CC) $(DEFFLAG) $(BUFF1M) $(CFLAGS) -c $(SRCS)
			@$(CC) $(CFLAGS) $(OBJS) $(OBJTEST) $(LIB) -o $(NAME1)
			@echo [TEST 1]
			@./$(NAME1) "tests/test1.txt" > deepthought/test1.log
			@[[ `diff deepthought/test1.log deepthought/test1output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 2]
			@./$(NAME1) "tests/test2.txt" > deepthought/test2.log
			@[[ `diff deepthought/test2.log deepthought/test2output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 3]
			@./$(NAME1) "tests/test3.txt" > deepthought/test3.log
			@[[ `diff deepthought/test3.log deepthought/test3output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 4]
			@./$(NAME1) "tests/test4.txt" > deepthought/test4.log
			@[[ `diff deepthought/test4.log deepthought/test4output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 5]
			@./$(NAME1) "tests/test5.txt" > deepthought/test5.log
			@[[ `diff deepthought/test5.log deepthought/test5output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 6]
			@./$(NAME1) "tests/test6.txt" > deepthought/test6.log
			@[[ `diff deepthought/test6.log deepthought/test6output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 7]
			@./$(NAME1) "tests/test7.txt" > deepthought/test7.log
			@[[ `diff deepthought/test7.log deepthought/test7output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)
			@echo [TEST 8]
			@./$(NAME1) "tests/test8.txt" > deepthought/test8.log
			@rm $(NAME1) $(OBJS)
			@[[ `diff deepthought/test8.log deepthought/test8output.log` ]] && (printf "$(RED)KO$(ENDC)\t" && echo ☠) || (printf "$(GREEN)OK$(ENDC)\t" && echo 😎)

end:
			@echo "If there were any $(RED)KO's$(ENDC), check the $(LPURP)deepthought$(ENDC) folder for the logs of the tests"
			@echo "$(YELLOW)YOUR RESULT:$(ENDC) test1.log, $(CYAN)INTENDED OUTPUT:$(ENDC) test1output.log"

.PHONY:		clean

clean:
	@rm -f ${LIB} ${LIBHEAD} ${OBJS} ${OBJTEST}

fclean:		clean
	@rm -f ${wildcard testgnl*} $(TESTLOG)

re:			fclean all