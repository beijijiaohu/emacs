#include <stdio.h>
#include <string.h>
#include <malloc.h>

static inline const char *find_char(const char *str, char p) {
	while (*str != '\0' && *str != p) {
		str++;
	}
	return *str == '\0' ? NULL : str;
}

static inline const char* find_char_end(const char *str, const char ch) {
	const char *p = NULL;

	do {
		if (*str == ch)
			p = str;
	}while (*str++ != '\0') ;

	return p == str ? NULL : p;
}

static inline const char *find_file_name(const char *str) { 
	const char *p = find_char_end(str, '/');
	return p == NULL ? str: p + 1;
}

static inline const char *find_file_suffix(const char *str) {
	const char *p = find_char_end(str, '.');
	return p == NULL ? NULL : p + 1;
}

static inline int check_suffixs_or(const char *str, const char *arr[]) {
	const char *p;

	p  = find_file_suffix(str);

	if (!p)
		return -1;

	for ( ; *arr != NULL; ++arr) {
		if (!strcmp(p, *arr))
			return 0;
	}
	return 1;
}

static inline const check_suffixs_and(const char *str, const char *arr[]) {
	const char *p;

	p  = find_file_suffix(str);
	if (!p)
		return -1;

	for ( ; *arr != NULL; ++arr) {
		if (strcmp(p, *arr))
			return 1;
	}
	return 0;
}

static inline const check_file_names(const char *str, const char *arr[]) {
	const char *p;

	p = find_file_name(str);
	for (; *arr != NULL; ++arr) {
		if (!strcmp(p, *arr))
			return 0;
	}
	return -1;
}

typedef int (*check_func)(const char *str);

const char *suffixs[] = {"h", "H", "c", "C", "cc", "CC", "Cpp", "cpp", "CPP", "s", "S", "txt", "lds", "ld",  "mk", NULL};
const char *file_names[] = {"Makefile", "Kconfig", "README", "Kbuild", NULL};

static int my_check_suffixs(const char *str) {
	return check_suffixs_or(str, suffixs);
}

static int my_check_file_names(const char *str) {
	return check_file_names(str, file_names);
}

check_func check_arr[] = {
	my_check_suffixs,
	my_check_file_names,
	NULL
};

static inline int check_rules(const char *str) {
	check_func *func  = check_arr;

	for (; *func != NULL; ++func) {
		if (!(*func)(str))
			return 0;
	}
	return -1;
}

#define MAX_WORD_LENGTH 4096
int main (int argc, char *argv[]) {
	int i;
	char buf[MAX_WORD_LENGTH];

	while (scanf("%s", buf) == 1) {
		if (!check_rules(buf)) {
			printf ("%s\n",buf);
		}
	}

#if 0
	check_suffixs_or(argv[1], suffixs);
#endif
	return 0;
}
