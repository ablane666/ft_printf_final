/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strclr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: esnowpea <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/09/10 14:56:26 by esnowpea          #+#    #+#             */
/*   Updated: 2019/09/11 18:02:23 by esnowpea         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_strclr(char *s)
{
	size_t	i;
	size_t	len;

	i = 0;
	if (s)
	{
		len = ft_strlen(s);
		while (i < len)
			s[i++] = '\0';
	}
}