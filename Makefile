SRC			= ft_putnbr_nodash.c ft_char_in_array.c ft_convert_csp.c			\
			  ft_convert_diuxX.c ft_exam_format.c ft_print_hex.c ft_morelen.c	\
			  ft_padding.c ft_update_tab.c ft_printf.c

DIR_OBJS	= objs/

LIBFT_PATH	= ./libft
LIBFT		= ${LIBFT_PATH}/libft.a

OBJS		= ${SRC:.c=.o}
PRE_OBJS	= $(addprefix ${DIR_OBJS}, ${OBJS})

NAME		= libftprintf.a

GCC			= gcc

CFLAGS		= -Wall -Wextra -Werror

AR			= ar

${DIR_OBJS}%.o:	%.c libftprintf.h
			@mkdir -p ${DIR_OBJS}
			@${GCC} ${CFLAGS} -c $< -o $@

${NAME}:	${LIBFT} ${PRE_OBJS} loading
			@cp ${LIBFT} ${NAME}
			@${AR} -crs ${NAME} ${PRE_OBJS}
			@echo -ne 'libftprintf.a CREATED            \r'
			@echo -ne '\n'

${LIBFT}:
			@make -s -C ${LIBFT_PATH} all

loading:
			@echo -ne 'LOADING...\r'
			@sleep 1
			@echo -ne '⦗❚❚❚❚❚❚                   ⦘(25%)\r'
			@sleep 0.2
			@echo -ne '⦗❚❚❚❚❚❚❚❚❚❚❚❚❚            ⦘(50%)\r'
			@sleep 0.2
			@echo -ne '⦗❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚     ⦘(75%)\r'
			@sleep 0.2
			@echo -ne '⦗❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚⦘(100%)\r'
			@sleep 0.2

all:		${NAME}

bonus:		all loading
			@echo -ne 'Bonus CREATED\r'
			@echo -ne '\n'

clean:
			@make -s -C ${LIBFT_PATH} clean
			@rm -rf ${DIR_OBJS}
			@echo -ne 'REMOVED OBJS\n'

fclean:		clean
			@make -s -C ${LIBFT_PATH} fclean
			@rm -f ${NAME}
			@echo -ne 'REMOVED libftprintf.a\n'

re:			fclean all

.PHONY:		all clean fclean re bonus
