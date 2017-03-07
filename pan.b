	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :never: */
;
		;
		
	case 4: /* STATE 8 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 5: /* STATE 1 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: /* STATE 2 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: /* STATE 3 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: /* STATE 4 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC process1 */

	case 9: /* STATE 1 */
		;
		((P0 *)this)->active_iters = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 11: /* STATE 3 */
		;
		now.iters_exceeded = trpt->bup.oval;
		;
		goto R999;

	case 12: /* STATE 7 */
		;
		_m = unsend(((P0 *)this)->R);
		;
		goto R999;

	case 13: /* STATE 8 */
		;
		now.num_messages = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: /* STATE 10 */
		;
		message_exceeded = trpt->bup.oval;
		;
		goto R999;

	case 16: /* STATE 14 */
		;
		XX = 1;
		unrecv(((P0 *)this)->L, XX-1, 0, ((P0 *)this)->e, 1);
		((P0 *)this)->e = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		;
		;
		
	case 19: /* STATE 17 */
		;
		now.numleaders = trpt->bup.oval;
		;
		goto R999;

	case 20: /* STATE 21 */
		;
		now.leader = trpt->bup.oval;
		;
		goto R999;

	case 21: /* STATE 22 */
		;
		elected_leader = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 23: /* STATE 24 */
		;
		single_leader = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 25: /* STATE 29 */
		;
		highest_leader = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 27: /* STATE 40 */
		;
		_m = unsend(((P0 *)this)->R);
		;
		goto R999;

	case 28: /* STATE 49 */
		;
		XX = 1;
		unrecv(((P0 *)this)->L, XX-1, 0, ((P0 *)this)->f, 1);
		((P0 *)this)->f = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 30: /* STATE 72 */
		;
		((P0 *)this)->d = trpt->bup.ovals[2];
	/* 1 */	((P0 *)this)->f = trpt->bup.ovals[1];
	/* 0 */	((P0 *)this)->d = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 31: /* STATE 78 */
		;
		XX = 1;
		unrecv(((P0 *)this)->L, XX-1, 0, ((P0 *)this)->d, 1);
		((P0 *)this)->d = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
			}

