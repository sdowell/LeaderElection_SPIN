#define true 1
#define false 0
#define one_lead single_leader
#define elect_lead elected_leader
#define high_lead highest_leader
#define msg_max message_exceeded
#define num_iters iters_exceeded

int leader = -1;
int numleaders = 0;
int highest_id = 2;
int num_messages = 0;
int max_messages = 9;
bool iters_exceeded = false;
bool message_exceeded = false;
bool single_leader = true;
bool elected_leader = false;
bool highest_leader = true;
proctype process1(int id; chan L; chan R)
{
	int d = id; int e; int f;
	int active_iters = 0;
act:
	active_iters = active_iters + 1;
	if
	:: (active_iters > 2) -> iters_exceeded = true;
	:: else -> ;
	fi;
	R!d;
	num_messages = num_messages + 1;
	if
	:: (num_messages > max_messages && leader == -1) -> message_exceeded = true;
	:: else -> ;
	fi;
	L?e;
	if
	::(e == id) ->
		if
		:: (leader != id) -> numleaders = numleaders + 1; 
		:: else -> ;
		fi;
		leader = id; elected_leader = true;
		if
		:: (numleaders > 1) -> single_leader = false;
		:: else -> ;
		fi;
		if
		:: (id != highest_id) -> highest_leader = false;
		:: else -> ;
		fi;
	:: else -> ;
	fi;
	
	if
	:: (d > e) -> R!d; num_messages = num_messages + 1;
	:: else -> R!e; num_messages = num_messages + 1;
	fi;
	if
	:: (num_messages > max_messages && leader == -1) -> message_exceeded = true;
	:: else -> ;
	fi;
	L?f;
	
	if
	:: (f == id) -> 
		if
		:: (leader != id) -> numleaders = numleaders + 1; 
		:: else -> ;
		fi;
		leader = id; elected_leader = true;
		if
		:: (numleaders > 1) -> single_leader = false;
		:: else -> ;
		fi;
		if
		:: (id != highest_id) -> highest_leader = false;
		:: else -> ;
		fi;
	:: else -> ;
	fi;
	
	if 
	:: (e >= d && e >= f) -> d = e;
	:: else -> goto relay;
	fi;
/*	if
	:: (d > f) ->
		if
		:: (e >= d) -> d = e;
		:: else -> goto relay;
		fi;
	:: else ->
		if
		:: (e >= f) -> d = e;
		:: else -> goto relay;
		fi;
	fi;
*/
	goto act;
	
relay:
	L?d;
	
	if
	:: (d == id) -> 
		if
		:: (leader != id) -> numleaders = numleaders + 1; 
		:: else -> ;
		fi;
		leader = id; elected_leader = true;
		if
		:: (numleaders > 1) -> single_leader = false;
		:: else -> ;
		fi;
		if
		:: (id != highest_id) -> highest_leader = false;
		:: else -> ;
		fi;
	:: else -> ;
	fi;
	
	R!d;
	num_messages = num_messages + 1;
	if
	:: (num_messages > max_messages && leader == -1) -> message_exceeded = true;
	:: else -> ;
	fi;
	goto relay;
}

init {
	/* 3 processes */
	
	chan c01 = [16] of {int};
	chan c12 = [16] of {int};
	chan c20 = [16] of {int};

	run process1(0, c20, c01); run process1(1, c01, c12); run process1(2, c12, c20);
	
	
	/* 4 processes */
	/*
	chan c01 = [16] of {int};
	chan c12 = [16] of {int};
	chan c23 = [16] of {int};
	chan c30 = [16] of {int};
	run process1(0, c30, c01); run process1(1, c01, c12); run process1(2, c12, c23);run process1(3, c23, c30);
	*/
	/* 5 processes */
	/*
	chan c01 = [16] of {int};
	chan c12 = [16] of {int};
	chan c23 = [16] of {int};
	chan c34 = [16] of {int};
	chan c40 = [16] of {int};
	run process1(0, c40, c01); run process1(1, c01, c12); run process1(2, c12, c23); run process1(3, c23, c34); run process1(3, c34, c40);
	*/
	/* 6 processes */
	/*
	chan c01 = [16] of {int};
	chan c12 = [16] of {int};
	chan c23 = [16] of {int};
	chan c34 = [16] of {int};
	chan c45 = [16] of {int};
	chan c50 = [16] of {int};

	run process1(0, c50, c01); run process1(1, c01, c12); run process1(2, c12, c23);run process1(3, c23, c34); run process1(4, c34, c45); run process1(5, c45, c50);
	*/
	/* 7 processes */
	/*
	chan c01 = [16] of {int};
	chan c12 = [16] of {int};
	chan c23 = [16] of {int};
	chan c34 = [16] of {int};
	chan c45 = [16] of {int};
	chan c56 = [16] of {int};
	chan c60 = [16] of {int};

	run process1(0, c60, c01); run process1(1, c01, c12); run process1(2, c12, c23);run process1(3, c23, c34); run process1(4, c34, c45); run process1(5, c45, c56);
	run process1(6, c56, c60);
	*/
	
	/* 8 processes */
	/*
	chan c01 = [16] of {int};
	chan c12 = [16] of {int};
	chan c23 = [16] of {int};
	chan c34 = [16] of {int};
	chan c45 = [16] of {int};
	chan c56 = [16] of {int};
	chan c67 = [16] of {int};
	chan c70 = [16] of {int};

	run process1(0, c70, c01); run process1(1, c01, c12); run process1(2, c12, c23);run process1(3, c23, c34); run process1(4, c34, c45); run process1(5, c45, c56);
	run process1(6, c56, c67); run process1(7, c67, c70); 
	*/
}
/* ! [] (one_lead) */
/* at most one leader elected */
/*
never {
T0_init:
	if
	:: (! ((one_lead))) -> goto accept_all
	:: (1) -> goto T0_init
	fi;
accept_all:
	skip
}
*/
/* ! <> (elect_lead) */
/* a leader is eventually elected */
/*
never {
accept_init:
T0_init:
	if
	:: (! ((elect_lead))) -> goto T0_init
	fi;
}
*/
/* ! [] (high_lead) */
/* the elected leader will be the process with the highest process id */
/*
never { 
T0_init:
	if
	:: (! ((high_lead))) -> goto accept_all
	:: (1) -> goto T0_init
	fi;
accept_all:
	skip
}
*/
/* ! [] !(msg_max) */
/* The maximum total amount of messages sent in order to elect the leader is at most 2N log2(N) + N */
/*
never {    
T0_init:
	if
	:: ((msg_max)) -> goto accept_all
	:: (1) -> goto T0_init
	fi;
accept_all:
	skip
}
*/
/* ! [] (num_iters) */
/* Each process executes the loop in the active state at most twice */

never {
T0_init:
	if
	:: ((num_iters)) -> goto accept_all
	:: (1) -> goto T0_init
	fi;
accept_all:
	skip
}
