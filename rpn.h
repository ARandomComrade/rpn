/*
 * rpn - Mycroft <mycroft@datasphere.net>
 */

#include "linenoise.h"

#define VERSION		0.69

#define MAXSIZE		10
#define DEFBASE		10
#define BASECHAR	'#'

#define ERR_DIVBYZERO	"Division by zero."
#define ERR_DOMAIN	"Argument is outside of function domain."
#define ERR_UNKNOWNCMD	"Unknown command."
#define ERR_ARGC	"Too few arguments."

struct metastack {
	struct object *t;
	struct object *b;
	struct metastack *n;
	size_t d;
};

struct object {
	double num;
	struct object *prev;
	struct object *next;
};

struct command {
	char *name;
	long numargs;
	void (*function)(void);
};

struct macro {
	char *name;
	char *operation;
	struct macro *prev;
	struct macro *next;
};

void addcommand(struct command *c);
void completion(const char *, linenoiseCompletions *);
unsigned countstack(void);
void error(char *);
struct command *findcmd(char *);
char *findmacro(char *);
void init_macros(void);
double peeknthnum(unsigned off);
struct object *pop(void);
double popnum(void);
void popobj(struct object *);
void pushnum(double);
struct object *top(void);

