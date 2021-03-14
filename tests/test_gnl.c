/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_gnl.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bcosters <bcosters@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/22 12:16:57 by bcosters          #+#    #+#             */
/*   Updated: 2021/03/14 11:54:56 by bcosters         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include "../../get_next_line.h"
#include "../simple_debugs.h"

void	doprint(int out, char **str, int line)
{
	printf("(LINE %i) [RET %i] |%s|\n", line, out, *str);
}

void	testfile(char *filename)
{
	int 	fd;
	int		retval;
	int		linecount;
	char	*line = NULL;

	linecount = 1;
	if ((fd = open(filename,  O_RDONLY)) == -1)
	{
		printf("File opening FAILED");
		exit(0);
	}
	else
	{
		printf("\nFile: %s\n", filename);
		retval = 1;
		while (retval == 1)
		{
			retval = get_next_line(fd, &line);
			doprint(retval, &line, linecount++);
			if (line)
			{
				free(line);
				line = NULL;
			}
		}
		if (retval == 0)
			printf("EOF reached!\n");
		if (retval < 0 )
			printf("An error occured!\n");
	}
	close(fd);
}

//void	teststdin(char *filename)

int main(int argc, char **argv)
{
	if (argc == 2)
		testfile(argv[1]);
	//testfile("test2.txt");
	//testfile("test3.txt");
	//testfile("test4.txt");
	//testfile("test5.txt");
	//testfile("test6.txt");
	//testfile("test8.txt");
	//testfile("test7.txt");
	check_leaks();
	return 0;
}
