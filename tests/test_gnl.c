/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_gnl.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bcosters <bcosters@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/22 12:16:57 by bcosters          #+#    #+#             */
/*   Updated: 2021/03/05 17:25:25 by bcosters         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include "../get_next_line.h"
#include "../simple_debug/simple_debugs.h"

void	doprint(int out, char **str, int line)
{
	printf("(LINE %i) [RET %i] |%s|\n", line, out, *str);
}

void	test(char *filename)
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

int main(void)
{
	test("test.txt");
	test("test2.txt");
	test("test3.txt");
	test("test4.txt");
	test("test5.txt");
	test("test6.txt");
	test("test8.txt");
	test("test7.txt");
	check_leaks();
	return 0;
}
