#define nleads numleaders

int leader = -1;
int numleaders = 0;

proctype process1(int id; chan L; chan R)
{
	int d = id;
	int e;
	int f;
active:
	R!id
	L?e
	if
	::(e == id) -> numleaders = numleaders + 1; leader = id;
	fi
	if
	:: (d > e) -> r!d
	:: else -> r!e
	fi
	L?f
	if
	:: (f == id) -> numleaders = numleaders + 1; leader = id;
	fi
	if
	:: (d > f) ->
		if
		:: (e >= d) -> d = e
		:: else -> goto relay
		fi
	:: else ->
		if
		:: (e >= f) -> d = e
		:: else -> goto relay
	fi
	goto active
	
relay:
	L?d
	if
	:: (d == id) -> numleaders = numleaders + 1; leader = id;
	fi
	R!d
	goto relay
}

init {
	chan c01;
	chan c12;
	chan c23;
	chan c34;
	chan c45;
	chan c50;
	run process1(0; c50; c01); run process1(1; c01; c12); run process1(2; c12; c23); run process1(3; c23; c34); run process1(4; c34; c45); run process1(5; c45; c50);
}