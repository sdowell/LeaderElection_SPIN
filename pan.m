#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	printf("Pr: %d Tr: %d\n", II, t->forw);
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :never: */
	case 3: /* STATE 1 - line 254 "election.spin" - [(iters_exceeded)] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim reached state %d (line %d)\n",
					depth, frm_st0[t->forw], src_claim[1]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
		reached[2][1] = 1;
		if (!(((int)now.iters_exceeded)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 8 - line 259 "election.spin" - [-end-] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
		{	static int reported8 = 0;
			if (verbose && !reported8)
			{	printf("depth %d: Claim reached state %d (line %d)\n",
					depth, frm_st0[t->forw], src_claim[8]);
				reported8 = 1;
				fflush(stdout);
		}	}
#endif
		reached[2][8] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 5: /* STATE 1 - line 138 "election.spin" - [(run process1(0,c20,c01))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!(addproc(0, 0, ((P1 *)this)->c20, ((P1 *)this)->c01)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 2 - line 138 "election.spin" - [(run process1(1,c01,c12))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		if (!(addproc(0, 1, ((P1 *)this)->c01, ((P1 *)this)->c12)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 3 - line 138 "election.spin" - [(run process1(2,c12,c20))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][3] = 1;
		if (!(addproc(0, 2, ((P1 *)this)->c12, ((P1 *)this)->c20)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 4 - line 197 "election.spin" - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC process1 */
	case 9: /* STATE 1 - line 24 "election.spin" - [active_iters = (active_iters+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((P0 *)this)->active_iters;
		((P0 *)this)->active_iters = (((P0 *)this)->active_iters+1);
#ifdef VAR_RANGES
		logval("process1:active_iters", ((P0 *)this)->active_iters);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 2 - line 26 "election.spin" - [((active_iters>2))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		if (!((((P0 *)this)->active_iters>2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 3 - line 26 "election.spin" - [iters_exceeded = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)now.iters_exceeded);
		now.iters_exceeded = 1;
#ifdef VAR_RANGES
		logval("iters_exceeded", ((int)now.iters_exceeded));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 7 - line 29 "election.spin" - [R!d] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][7] = 1;
		if (q_full(((P0 *)this)->R))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d!", ((P0 *)this)->R);
		sprintf(simtmp, "%d", ((P0 *)this)->d); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->R, 0, ((P0 *)this)->d);
		_m = 2; goto P999; /* 0 */
	case 13: /* STATE 8 - line 30 "election.spin" - [num_messages = (num_messages+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = now.num_messages;
		now.num_messages = (now.num_messages+1);
#ifdef VAR_RANGES
		logval("num_messages", now.num_messages);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 9 - line 32 "election.spin" - [(((num_messages>max_messages)&&(leader==-(1))))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		if (!(((now.num_messages>now.max_messages)&&(now.leader== -(1)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 10 - line 32 "election.spin" - [message_exceeded = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((int)message_exceeded);
		message_exceeded = 1;
#ifdef VAR_RANGES
		logval("message_exceeded", ((int)message_exceeded));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 14 - line 35 "election.spin" - [L?e] (0:0:1 - 3) */
		reached[0][14] = 1;
		if (q_len(((P0 *)this)->L) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->e;
		;
		((P0 *)this)->e = qrecv(((P0 *)this)->L, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("process1:e", ((P0 *)this)->e);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->L);
		sprintf(simtmp, "%d", ((P0 *)this)->e); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 17: /* STATE 15 - line 37 "election.spin" - [((e==id))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][15] = 1;
		if (!((((P0 *)this)->e==((P0 *)this)->id)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 16 - line 39 "election.spin" - [((leader!=id))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][16] = 1;
		if (!((now.leader!=((P0 *)this)->id)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: /* STATE 17 - line 39 "election.spin" - [numleaders = (numleaders+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.oval = now.numleaders;
		now.numleaders = (now.numleaders+1);
#ifdef VAR_RANGES
		logval("numleaders", now.numleaders);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 21 - line 42 "election.spin" - [leader = id] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][21] = 1;
		(trpt+1)->bup.oval = now.leader;
		now.leader = ((P0 *)this)->id;
#ifdef VAR_RANGES
		logval("leader", now.leader);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 22 - line 42 "election.spin" - [elected_leader = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((int)elected_leader);
		elected_leader = 1;
#ifdef VAR_RANGES
		logval("elected_leader", ((int)elected_leader));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: /* STATE 23 - line 44 "election.spin" - [((numleaders>1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][23] = 1;
		if (!((now.numleaders>1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: /* STATE 24 - line 44 "election.spin" - [single_leader = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][24] = 1;
		(trpt+1)->bup.oval = ((int)single_leader);
		single_leader = 0;
#ifdef VAR_RANGES
		logval("single_leader", ((int)single_leader));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 28 - line 48 "election.spin" - [((id!=highest_id))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][28] = 1;
		if (!((((P0 *)this)->id!=now.highest_id)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 25: /* STATE 29 - line 48 "election.spin" - [highest_leader = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][29] = 1;
		(trpt+1)->bup.oval = ((int)highest_leader);
		highest_leader = 0;
#ifdef VAR_RANGES
		logval("highest_leader", ((int)highest_leader));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 36 - line 55 "election.spin" - [((d>e))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][36] = 1;
		if (!((((P0 *)this)->d>((P0 *)this)->e)))
			continue;
		_m = 3; goto P999; /* 0 */
/* STATE 37 - line 55 "election.spin" - [R!d] (0:0 - 1) same as 12 (0:0 - 3) */
/* STATE 38 - line 55 "election.spin" - [num_messages = (num_messages+1)] (0:0 - 1) same as 13 (0:0 - 1) */
	case 27: /* STATE 40 - line 56 "election.spin" - [R!e] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][40] = 1;
		if (q_full(((P0 *)this)->R))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d!", ((P0 *)this)->R);
		sprintf(simtmp, "%d", ((P0 *)this)->e); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)this)->R, 0, ((P0 *)this)->e);
		_m = 2; goto P999; /* 0 */
/* STATE 41 - line 56 "election.spin" - [num_messages = (num_messages+1)] (0:0 - 1) same as 13 (0:0 - 1) */
/* STATE 44 - line 59 "election.spin" - [(((num_messages>max_messages)&&(leader==-(1))))] (0:0 - 1) same as 14 (0:0 - 1) */
/* STATE 45 - line 59 "election.spin" - [message_exceeded = 1] (0:0 - 1) same as 15 (0:0 - 1) */
	case 28: /* STATE 49 - line 62 "election.spin" - [L?f] (0:0:1 - 3) */
		reached[0][49] = 1;
		if (q_len(((P0 *)this)->L) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->f;
		;
		((P0 *)this)->f = qrecv(((P0 *)this)->L, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("process1:f", ((P0 *)this)->f);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->L);
		sprintf(simtmp, "%d", ((P0 *)this)->f); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 29: /* STATE 50 - line 65 "election.spin" - [((f==id))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][50] = 1;
		if (!((((P0 *)this)->f==((P0 *)this)->id)))
			continue;
		_m = 3; goto P999; /* 0 */
/* STATE 51 - line 67 "election.spin" - [((leader!=id))] (0:0 - 1) same as 18 (0:0 - 1) */
/* STATE 52 - line 67 "election.spin" - [numleaders = (numleaders+1)] (0:0 - 1) same as 19 (0:0 - 1) */
/* STATE 56 - line 70 "election.spin" - [leader = id] (0:0 - 3) same as 20 (0:0 - 3) */
/* STATE 57 - line 70 "election.spin" - [elected_leader = 1] (0:0 - 1) same as 21 (0:0 - 1) */
/* STATE 58 - line 72 "election.spin" - [((numleaders>1))] (0:0 - 1) same as 22 (0:0 - 1) */
/* STATE 59 - line 72 "election.spin" - [single_leader = 0] (0:0 - 1) same as 23 (0:0 - 1) */
/* STATE 63 - line 76 "election.spin" - [((id!=highest_id))] (0:0 - 1) same as 24 (0:0 - 1) */
/* STATE 64 - line 76 "election.spin" - [highest_leader = 0] (0:0 - 1) same as 25 (0:0 - 1) */
	case 30: /* STATE 71 - line 83 "election.spin" - [(((e>=d)&&(e>=f)))] (1:0:3 - 1) */
		IfNotBlocked
		reached[0][71] = 1;
		if (!(((((P0 *)this)->e>=((P0 *)this)->d)&&(((P0 *)this)->e>=((P0 *)this)->f))))
			continue;
		/* dead 1: d */  (trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->d;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->d = 0;
		/* dead 1: f */  (trpt+1)->bup.ovals[1] = ((P0 *)this)->f;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->f = 0;
		/* merge: d = e(0, 72, 1) */
		reached[0][72] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->d;
		((P0 *)this)->d = ((P0 *)this)->e;
#ifdef VAR_RANGES
		logval("process1:d", ((P0 *)this)->d);
#endif
		;
		/* merge: .(goto)(0, 76, 1) */
		reached[0][76] = 1;
		;
		/* merge: goto act(0, 77, 1) */
		reached[0][77] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 31: /* STATE 78 - line 102 "election.spin" - [L?d] (0:0:1 - 6) */
		reached[0][78] = 1;
		if (q_len(((P0 *)this)->L) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P0 *)this)->d;
		;
		((P0 *)this)->d = qrecv(((P0 *)this)->L, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("process1:d", ((P0 *)this)->d);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)this)->L);
		sprintf(simtmp, "%d", ((P0 *)this)->d); strcat(simvals, simtmp);		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 32: /* STATE 79 - line 105 "election.spin" - [((d==id))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][79] = 1;
		if (!((((P0 *)this)->d==((P0 *)this)->id)))
			continue;
		_m = 3; goto P999; /* 0 */
/* STATE 80 - line 107 "election.spin" - [((leader!=id))] (0:0 - 1) same as 18 (0:0 - 1) */
/* STATE 81 - line 107 "election.spin" - [numleaders = (numleaders+1)] (0:0 - 1) same as 19 (0:0 - 1) */
/* STATE 85 - line 110 "election.spin" - [leader = id] (0:0 - 3) same as 20 (0:0 - 3) */
/* STATE 86 - line 110 "election.spin" - [elected_leader = 1] (0:0 - 1) same as 21 (0:0 - 1) */
/* STATE 87 - line 112 "election.spin" - [((numleaders>1))] (0:0 - 1) same as 22 (0:0 - 1) */
/* STATE 88 - line 112 "election.spin" - [single_leader = 0] (0:0 - 1) same as 23 (0:0 - 1) */
/* STATE 92 - line 116 "election.spin" - [((id!=highest_id))] (0:0 - 1) same as 24 (0:0 - 1) */
/* STATE 93 - line 116 "election.spin" - [highest_leader = 0] (0:0 - 1) same as 25 (0:0 - 1) */
/* STATE 100 - line 122 "election.spin" - [R!d] (0:0 - 5) same as 12 (0:0 - 3) */
/* STATE 101 - line 123 "election.spin" - [num_messages = (num_messages+1)] (0:0 - 1) same as 13 (0:0 - 1) */
/* STATE 102 - line 125 "election.spin" - [(((num_messages>max_messages)&&(leader==-(1))))] (0:0 - 1) same as 14 (0:0 - 1) */
/* STATE 103 - line 125 "election.spin" - [message_exceeded = 1] (0:0 - 1) same as 15 (0:0 - 1) */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

