#define Version	"Spin Version 4.2.6 -- 27 October 2005"
#define Source	"election.spin"

char *TrailFile = Source; /* default */
#if defined(BFS)
#ifndef SAFETY
#define SAFETY
#endif
#ifndef XUSAFE
#define XUSAFE
#endif
#endif
#ifndef uchar
#define uchar	unsigned char
#endif
#ifndef uint
#define uint	unsigned int
#endif
#define long	int
#define DELTA	500
#ifdef MA
#if MA==1
#undef MA
#define MA	100
#endif
#endif
#ifdef W_XPT
#if W_XPT==1
#undef W_XPT
#define W_XPT 1000000
#endif
#endif
#ifndef NFAIR
#define NFAIR	2	/* must be >= 2 */
#endif
#define HAS_CODE
#define MERGED	1
#ifdef NP	/* includes np_ demon */
#define HAS_NP	2
#define VERI	3
#define endclaim	3 /* none */
#endif
#if !defined(NOCLAIM) && !defined NP
#define VERI	2
#define endclaim	endstate2
#endif
typedef struct S_F_MAP {
	char *fnm; int from; int upto;
} S_F_MAP;

#define nstates2	9	/* :never: */
#define nstates_claim	nstates2
#define endstate2	8
short src_ln2 [] = {
	  0, 254, 254, 255, 255, 253, 257, 258, 
	259,   0, };
S_F_MAP src_file2 [] = {
	{ "-", 0, 0 },
	{ "election.spin", 1, 8 },
	{ "-", 9, 10 }
};
#define src_claim	src_ln2
uchar reached2 [] = {
	  0,   1,   1,   1,   1,   0,   1,   1, 
	  0,   0, };
#define reached_claim	reached2

#define nstates1	5	/* :init: */
#define endstate1	4
short src_ln1 [] = {
	  0, 138, 138, 138, 197,   0, };
S_F_MAP src_file1 [] = {
	{ "-", 0, 0 },
	{ "election.spin", 1, 4 },
	{ "-", 5, 6 }
};
uchar reached1 [] = {
	  0,   0,   0,   0,   0,   0, };

#define nstates0	109	/* process1 */
#define endstate0	108
short src_ln0 [] = {
	  0,  24,  26,  26,  27,  25,  29,  29, 
	 30,  32,  32,  33,  31,  35,  35,  37, 
	 39,  39,  40,  38,  42,  42,  42,  44, 
	 44,  45,  43,  47,  48,  48,  49,  47, 
	 51,  51,  36,  54,  55,  55,  55,  56, 
	 56,  56,  54,  58,  59,  59,  60,  58, 
	 62,  62,  65,  67,  67,  68,  66,  70, 
	 70,  70,  72,  72,  73,  71,  75,  76, 
	 76,  77,  75,  79,  79,  64,  82,  83, 
	 83,  84,  84,  82,  99,  99, 102, 105, 
	107, 107, 108, 106, 110, 110, 110, 112, 
	112, 113, 111, 115, 116, 116, 117, 115, 
	119, 119, 104, 122, 122, 123, 125, 125, 
	126, 124, 128, 128, 129,   0, };
S_F_MAP src_file0 [] = {
	{ "-", 0, 0 },
	{ "election.spin", 1, 108 },
	{ "-", 109, 110 }
};
uchar reached0 [] = {
	  0,   0,   1,   0,   1,   0,   1,   0, 
	  0,   1,   0,   1,   0,   1,   0,   1, 
	  1,   0,   1,   0,   1,   0,   0,   1, 
	  0,   1,   0,   1,   1,   0,   1,   0, 
	  1,   1,   0,   1,   1,   0,   0,   1, 
	  0,   0,   0,   1,   1,   0,   1,   0, 
	  1,   0,   1,   1,   0,   1,   0,   1, 
	  0,   0,   1,   0,   1,   0,   1,   1, 
	  0,   1,   0,   1,   1,   0,   1,   1, 
	  0,   1,   1,   0,   1,   1,   0,   1, 
	  1,   0,   1,   0,   1,   0,   0,   1, 
	  0,   1,   0,   1,   1,   0,   1,   0, 
	  1,   1,   0,   1,   0,   0,   1,   0, 
	  1,   0,   1,   1,   0,   0, };
struct {
	int tp; short *src;
} src_all[] = {
	{ 2, &src_ln2[0] },
	{ 1, &src_ln1[0] },
	{ 0, &src_ln0[0] },
	{ 0, (short *) 0 }
};
short *frm_st0;
struct {
	char *c; char *t;
} code_lookup[] = {
	{ (char *) 0, "" }
};
#define _T5	33
#define _T2	34
#define SYNC	0
#define ASYNC	3

char *procname[] = {
   "process1",
   ":init:",
   ":never:",
   ":np_:",
};

typedef struct P2 { /* :never: */
	unsigned _pid : 8;  /* 0..255 */
	unsigned _t   : 3; /* proctype */
	unsigned _p   : 8; /* state    */
} P2;
#define Air2	(sizeof(P2) - 3)
#define Pinit	((P1 *)this)
typedef struct P1 { /* :init: */
	unsigned _pid : 8;  /* 0..255 */
	unsigned _t   : 3; /* proctype */
	unsigned _p   : 8; /* state    */
	uchar c01;
	uchar c12;
	uchar c20;
} P1;
#define Air1	(sizeof(P1) - Offsetof(P1, c20) - 1*sizeof(uchar))
#define Pprocess1	((P0 *)this)
typedef struct P0 { /* process1 */
	unsigned _pid : 8;  /* 0..255 */
	unsigned _t   : 3; /* proctype */
	unsigned _p   : 8; /* state    */
	uchar L;
	uchar R;
	int id;
	int d;
	int e;
	int f;
	int active_iters;
} P0;
#define Air0	(sizeof(P0) - Offsetof(P0, active_iters) - 1*sizeof(int))
typedef struct P3 { /* np_ */
	unsigned _pid : 8;  /* 0..255 */
	unsigned _t   : 3; /* proctype */
	unsigned _p   : 8; /* state    */
} P3;
#define Air3	(sizeof(P3) - 3)
#if defined(BFS) && defined(REACH)
#undef REACH
#endif
#ifdef VERI
#define BASE	1
#else
#define BASE	0
#endif
typedef struct Trans {
	short atom;	/* if &2 = atomic trans; if &8 local */
#ifdef HAS_UNLESS
	short escp[HAS_UNLESS];	/* lists the escape states */
	short e_trans;	/* if set, this is an escp-trans */
#endif
	short tpe[2];	/* class of operation (for reduction) */
	short qu[6];	/* for conditional selections: qid's  */
	uchar ty[6];	/* ditto: type's */
#ifdef NIBIS
	short om;	/* completion status of preselects */
#endif
	char *tp;	/* src txt of statement */
	int st;		/* the nextstate */
	int t_id;	/* transition id, unique within proc */
	int forw;	/* index forward transition */
	int back;	/* index return  transition */
	struct Trans *nxt;
} Trans;

#define qptr(x)	(((uchar *)&now)+q_offset[x])
#define pptr(x)	(((uchar *)&now)+proc_offset[x])
extern uchar *Pptr(int);
#define q_sz(x)	(((Q0 *)qptr(x))->Qlen)

#ifndef VECTORSZ
#define VECTORSZ	1024           /* sv   size in bytes */
#endif

#ifdef VERBOSE
#ifndef CHECK
#define CHECK
#endif
#ifndef DEBUG
#define DEBUG
#endif
#endif
#ifdef SAFETY
#ifndef NOFAIR
#define NOFAIR
#endif
#endif
#ifdef NOREDUCE
#ifndef XUSAFE
#define XUSAFE
#endif
#if !defined(SAFETY) && !defined(MA)
#define FULLSTACK
#endif
#else
#ifdef BITSTATE
#ifdef SAFETY
#define CNTRSTACK
#else
#define FULLSTACK
#endif
#else
#define FULLSTACK
#endif
#endif
#ifdef BITSTATE
#ifndef NOCOMP
#define NOCOMP
#endif
#if !defined(LC) && defined(SC)
#define LC
#endif
#endif
#if defined(COLLAPSE2) || defined(COLLAPSE3) || defined(COLLAPSE4)
/* accept the above for backward compatibility */
#define COLLAPSE
#endif
#ifdef HC
#undef HC
#define HC4
#endif
#ifdef HC0
#define HC	0
#endif
#ifdef HC1
#define HC	1
#endif
#ifdef HC2
#define HC	2
#endif
#ifdef HC3
#define HC	3
#endif
#ifdef HC4
#define HC	4
#endif
#ifdef COLLAPSE
unsigned long ncomps[256+2];
#endif
#define MAXQ   	255
#define MAXPROC	255
#define WS		sizeof(long)   /* word size in bytes */
typedef struct Stack  {	 /* for queues and processes */
#if VECTORSZ>32000
	int o_delta;
	int o_offset;
	int o_skip;
	int o_delqs;
#else
	short o_delta;
	short o_offset;
	short o_skip;
	short o_delqs;
#endif
	short o_boq;
#ifndef XUSAFE
	char *o_name;
#endif
	char *body;
	struct Stack *nxt;
	struct Stack *lst;
} Stack;

typedef struct Svtack { /* for complete state vector */
#if VECTORSZ>32000
	int o_delta;
	int m_delta;
#else
	short o_delta;	 /* current size of frame */
	short m_delta;	 /* maximum size of frame */
#endif
#if SYNC
	short o_boq;
#endif
	char *body;
	struct Svtack *nxt;
	struct Svtack *lst;
} Svtack;

Trans ***trans;	/* 1 ptr per state per proctype */

#if defined(FULLSTACK) || defined(BFS)
struct H_el *Lstate;
#endif
int depthfound = -1;	/* loop detection */
int proc_offset[MAXPROC], proc_skip[MAXPROC];
int q_offset[MAXQ], q_skip[MAXQ];
#if VECTORSZ<65536
	unsigned short vsize;
#else
	unsigned long  vsize;	/* vector size in bytes */
#endif
#ifdef SVDUMP
int vprefix=0, svfd;		/* runtime option -pN */
#endif
char *tprefix = "trail";	/* runtime option -tsuffix */
short boq = -1;		/* blocked_on_queue status */
typedef struct State {
	uchar _nr_pr;
	uchar _nr_qs;
	uchar   _a_t;	/* cycle detection */
#ifndef NOFAIR
	uchar   _cnt[NFAIR];	/* counters, weak fairness */
#endif
#ifndef NOVSZ
#if VECTORSZ<65536
	unsigned short _vsz;
#else
	unsigned long  _vsz;
#endif
#endif
#ifdef HAS_LAST
	uchar  _last;	/* pid executed in last step */
#endif
#ifdef EVENT_TRACE
#if nstates_event<256
	uchar _event;
#else
	unsigned short _event;
#endif
#endif
	unsigned iters_exceeded : 1;
	int leader;
	int numleaders;
	int highest_id;
	int num_messages;
	int max_messages;
	uchar sv[VECTORSZ];
} State;

#define HAS_TRACK	0
/* hidden variable: */	uchar message_exceeded;
/* hidden variable: */	uchar single_leader;
/* hidden variable: */	uchar elected_leader;
/* hidden variable: */	uchar highest_leader;
int _; /* a predefined write-only variable */

#define FORWARD_MOVES	"pan.m"
#define REVERSE_MOVES	"pan.b"
#define TRANSITIONS	"pan.t"
#define _NP_	3
uchar reached3[3];  /* np_ */
#define nstates3	3 /* np_ */
#define endstate3	2 /* np_ */

#define start3	0 /* np_ */
#define start2	5
#define start_claim	5
#define start1	1
#define start0	1
#ifdef NP
#define ACCEPT_LAB	1 /* at least 1 in np_ */
#else
#define ACCEPT_LAB	1 /* user-defined accept labels */
#endif
#define PROG_LAB	0 /* progress labels */
uchar *accpstate[4];
uchar *progstate[4];
uchar *reached[4];
uchar *stopstate[4];
uchar *visstate[4];
short *mapstate[4];
#ifdef HAS_CODE
int NrStates[4];
#endif
#define NQS	3
short q_flds[4];
short q_max[4];
typedef struct Q3 {
	uchar Qlen;	/* q_size */
	uchar _t;	/* q_type */
	struct {
		int fld0;
	} contents[16];
} Q3;
typedef struct Q2 {
	uchar Qlen;	/* q_size */
	uchar _t;	/* q_type */
	struct {
		int fld0;
	} contents[16];
} Q2;
typedef struct Q1 {
	uchar Qlen;	/* q_size */
	uchar _t;	/* q_type */
	struct {
		int fld0;
	} contents[16];
} Q1;
typedef struct Q0 {	/* generic q */
	uchar Qlen;	/* q_size */
	uchar _t;
} Q0;

/** function prototypes **/
char *emalloc(unsigned long);
char *Malloc(unsigned long);
int Boundcheck(int, int, int, int, Trans *);
int addqueue(int, int);
/* int atoi(char *); */
/* int abort(void); */
int close(int);
int delproc(int, int);
int endstate(void);
int hstore(char *, int);
#ifdef MA
int gstore(char *, int, uchar);
#endif
int q_cond(short, Trans *);
int q_full(int);
int q_len(int);
int q_zero(int);
int qrecv(int, int, int, int);
int unsend(int);
/* void *sbrk(int); */
void Uerror(char *);
void assert(int, char *, int, int, Trans *);
void c_chandump(int);
void c_globals(void);
void c_locals(int, int);
void checkcycles(void);
void crack(int, int, Trans *, short *);
void d_hash(uchar *, int);
void s_hash(uchar *, int);
void r_hash(uchar *, int);
void delq(int);
void do_reach(void);
void pan_exit(int);
void exit(int);
void hinit(void);
void imed(Trans *, int, int, int);
void new_state(void);
void p_restor(int);
void putpeg(int, int);
void putrail(void);
void q_restor(void);
void retrans(int, int, int, short *, uchar *);
void settable(void);
void setq_claim(int, int, char *, int, char *);
void sv_restor(void);
void sv_save(void);
void tagtable(int, int, int, short *, uchar *);
void uerror(char *);
void unrecv(int, int, int, int, int);
void usage(FILE *);
void wrap_stats(void);
#if defined(FULLSTACK) && defined(BITSTATE)
int  onstack_now(void);
void onstack_init(void);
void onstack_put(void);
void onstack_zap(void);
#endif
#ifndef XUSAFE
int q_S_check(int, int);
int q_R_check(int, int);
uchar q_claim[MAXQ+1];
char *q_name[MAXQ+1];
char *p_name[MAXPROC+1];
#endif
void qsend(int, int, int);
#define Addproc(x)	addproc(x, 0, 0, 0)
#define LOCAL	1
#define Q_FULL_F	2
#define Q_EMPT_F	3
#define Q_EMPT_T	4
#define Q_FULL_T	5
#define TIMEOUT_F	6
#define GLOBAL	7
#define BAD	8
#define ALPHA_F	9
#define NTRANS	35
#ifdef PEG
long peg[NTRANS];
#endif
