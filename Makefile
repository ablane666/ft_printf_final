# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: esnowpea <esnowpea@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/02 13:56:52 by esnowpea          #+#    #+#              #
#    Updated: 2020/02/17 17:23:42 by esnowpea         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = libftprintf.a

CC = gcc
FLAGS = -Wall -Werror -Wextra
LIBFT_FLAGS = -L./$(LIBFT_DIR) -lft

INCLUDES = -I$(HEADERS_DIR) -I$(LIBFT_HEADERS)

LIBFT = $(LIBFT_DIR)libft.a
LIBFT_DIR = libft/
LIBFT_HEADERS = $(LIBFT_DIR)inc/

HEADERS_LIST = ft_printf.h
HEADERS_DIR = ./inc/
HEADERS = $(addprefix $(HEADERS_DIR), $(HEADERS_LIST))

SRC_DIR = src/

SRC_LIST =	ft_printf.c \
			parsing.c \
			ft_c.c \
			ft_s.c \
			ft_d.c \
			ft_f.c \
			ft_e.c \
			ft_g.c \
			ft_itoa_long.c \
			itoa_double.c \
			mult_double.c \
			rounding.c \
			handler_flags.c

SRC = $(addprefix $(SRC_DIR), $(SRC_LIST))

OBJ_DIR = obj/
OBJ_LIST = $(patsubst %.c, %.o, $(SRC_LIST))
OBJ	= $(addprefix $(OBJ_DIR), $(OBJ_LIST))

# COLORS

GRN = \033[0;32m
RED = \033[0;31m
YEL = \033[1;33m
END = \033[0m

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(LIBFT) $(OBJ_DIR) $(OBJ)
	@cp $(LIBFT) ./$(NAME)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
#	@echo "\n$(NAME): $(GRN)*.o files created$(END)"
#	@echo "$(NAME): $(GRN)$(NAME) created$(END)"

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)
#	@echo "$(NAME): $(GRN)$(OBJ_DIR) created$(END)"

$(OBJ_DIR)%.o : $(SRC_DIR)%.c $(HEADERS)
	@$(CC) $(FLAGS) -c $(INCLUDES) $< -o $@
#	@echo "$(GRN).$(END)\c"

$(LIBFT):
#	@echo "$(NAME): $(GRN)Creating $(LIBFT)...$(END)"
	@$(MAKE) -C $(LIBFT_DIR)

clean:
	@$(MAKE) -C $(LIBFT_DIR) clean
	@rm -rf $(OBJ_DIR)
#   @echo "$(NAME): $(RED)$(OBJ_DIR) deleted$(END)"
#	@echo "$(NAME): $(RED)*.o files deleted$(END)"

fclean: clean
	@rm -f $(LIBFT)
#	@echo "$(NAME): $(RED)$(LIBFT) deleted$(END)"
	@rm -f $(NAME)
#	@echo "$(NAME): $(RED)$(NAME) deleted$(END)"

re: fclean all
