/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_gnl.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bcosters <bcosters@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/22 12:16:57 by bcosters          #+#    #+#             */
/*   Updated: 2021/11/12 10:53:02 by bcosters         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include "../../get_next_line.h"
#include "../simple_debugs.h"

void	doprint(char **str, int line)
{
	printf("(LINE %i) %s\n", line, *str);
}

void	testfile(char *filename)
{
	int 	fd;
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
		while ((line = get_next_line(fd)) != NULL)
		{
			doprint(&line, linecount++);
			if (line)
			{
				free(line);
				line = NULL;
			}
		}
	}
	close(fd);
}

//void	teststdin(char *filename)

int main(int argc, char **argv)
{
	if (argc == 2)
		testfile(argv[1]);
	check_leaks();
	return 0;
}
