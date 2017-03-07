# LeaderElection_SPIN
Leader election protocol verified using SPIN

Author: Sam Dowell
CS267: Automated Verification
Homework #3

Verification scalability results (for condition 1):

3 processes: 0.302 seconds
4 processes: 1.062 seconds
5 processes: 25.128 seconds
6 processes: 31.547 seconds
7 processes: non-termination

Falsification scalability results (for condition 5):

3 processes: .007 seconds
4 processes: .014 seconds
5 processes: .005 seconds
6 processes: .015 seconds
7 processes: .005 seconds
8 processes: .017 seconds


Properties to check:

1) There is always at most one leader.

This condition is satisfied.

2) Eventually always a leader will be elected.

This condition is satisfied.

3)  The elected leader will be the process with the highest process id.

This condition is satisfied.

4) The maximum total amount of messages sent in order to elect the leader is at most 2Nblog2 Nc + N.

This condition is satisfied.

5) Each process executes the loop in the active state at most twice.

This condition is not satisfied.

Explanation of counter example:

// Snippet of pseudo-code which is the cause of this behavior
if (e >= max(d,f)) then
	d := e;
else
	goto relay;

The process to the right of the highest ranking process replaces its d value (local low id) with the value of e (the highest id from its left process) during
the first iteration of the active loop. Afterwards, all subsequent iterations are guarunteed to satisfy (e >= max(d, f)), since all future received values (e)
will be the value of the highest id and equal to (d). Thus, it never reaches the else statement which sends it to the relay state.




Spin-generated counter example:

Starting :init: with pid 0
Starting :never: with pid 1
Never claim moves to line 195	[(1)]
Starting process1 with pid 2
  2:	proc  0 (:init:) line 136 "election.pml" (state 1)	[(run process1(0,c20,c01))]
  4:	proc  1 (process1) line  24 "election.pml" (state 1)	[active_iters = (active_iters+1)]
  6:	proc  1 (process1) line  27 "election.pml" (state 4)	[else]
Starting process1 with pid 3
  8:	proc  0 (:init:) line 136 "election.pml" (state 2)	[(run process1(1,c01,c12))]
 10:	proc  2 (process1) line  24 "election.pml" (state 1)	[active_iters = (active_iters+1)]
 12:	proc  2 (process1) line  27 "election.pml" (state 4)	[else]
Starting process1 with pid 4
 14:	proc  0 (:init:) line 136 "election.pml" (state 3)	[(run process1(2,c12,c20))]
 16:	proc  3 (process1) line  24 "election.pml" (state 1)	[active_iters = (active_iters+1)]
 18:	proc  3 (process1) line  27 "election.pml" (state 4)	[else]
 20:	proc  3 (process1) line  29 "election.pml" (state 7)	[R!d]
 22:	proc  3 (process1) line  30 "election.pml" (state 8)	[num_messages = (num_messages+1)]
 24:	proc  3 (process1) line  33 "election.pml" (state 11)	[else]
 26:	proc  2 (process1) line  29 "election.pml" (state 7)	[R!d]
 28:	proc  3 (process1) line  35 "election.pml" (state 14)	[L?e]
 30:	proc  3 (process1) line  51 "election.pml" (state 33)	[else]
 32:	proc  3 (process1) line  55 "election.pml" (state 36)	[((d>e))]
 34:	proc  3 (process1) line  55 "election.pml" (state 37)	[R!d]
 36:	proc  3 (process1) line  55 "election.pml" (state 38)	[num_messages = (num_messages+1)]
 38:	proc  3 (process1) line  60 "election.pml" (state 46)	[else]
 40:	proc  2 (process1) line  30 "election.pml" (state 8)	[num_messages = (num_messages+1)]
 42:	proc  2 (process1) line  33 "election.pml" (state 11)	[else]
 44:	proc  1 (process1) line  29 "election.pml" (state 7)	[R!d]
 46:	proc  2 (process1) line  35 "election.pml" (state 14)	[L?e]
 48:	proc  2 (process1) line  51 "election.pml" (state 33)	[else]
 50:	proc  2 (process1) line  55 "election.pml" (state 36)	[((d>e))]
 52:	proc  2 (process1) line  55 "election.pml" (state 37)	[R!d]
 54:	proc  3 (process1) line  62 "election.pml" (state 49)	[L?f]
 56:	proc  3 (process1) line  79 "election.pml" (state 68)	[else]
 58:	proc  3 (process1) line  84 "election.pml" (state 73)	[else]
 60:	proc  2 (process1) line  55 "election.pml" (state 38)	[num_messages = (num_messages+1)]
 62:	proc  2 (process1) line  60 "election.pml" (state 46)	[else]
 64:	proc  1 (process1) line  30 "election.pml" (state 8)	[num_messages = (num_messages+1)]
 66:	proc  1 (process1) line  33 "election.pml" (state 11)	[else]
 68:	proc  1 (process1) line  35 "election.pml" (state 14)	[L?e]
 70:	proc  1 (process1) line  51 "election.pml" (state 33)	[else]
 72:	proc  1 (process1) line  56 "election.pml" (state 39)	[else]
 74:	proc  1 (process1) line  56 "election.pml" (state 40)	[R!e]
 76:	proc  2 (process1) line  62 "election.pml" (state 49)	[L?f]
 78:	proc  2 (process1) line  79 "election.pml" (state 68)	[else]
 80:	proc  2 (process1) line  84 "election.pml" (state 73)	[else]
 82:	proc  1 (process1) line  56 "election.pml" (state 41)	[num_messages = (num_messages+1)]
 84:	proc  1 (process1) line  60 "election.pml" (state 46)	[else]
 86:	proc  1 (process1) line  62 "election.pml" (state 49)	[L?f]
 88:	proc  1 (process1) line  79 "election.pml" (state 68)	[else]
 90:	proc  1 (process1) line  83 "election.pml" (state 71)	[(((e>=d)&&(e>=f)))]
 90:	proc  1 (process1) line  83 "election.pml" (state 72)	[d = e]
 92:	proc  1 (process1) line  24 "election.pml" (state 1)	[active_iters = (active_iters+1)]
 94:	proc  1 (process1) line  27 "election.pml" (state 4)	[else]
 96:	proc  1 (process1) line  29 "election.pml" (state 7)	[R!d]
 98:	proc  2 (process1) line 102 "election.pml" (state 78)	[L?d]
100:	proc  2 (process1) line 119 "election.pml" (state 97)	[else]
102:	proc  2 (process1) line 122 "election.pml" (state 100)	[R!d]
104:	proc  3 (process1) line 102 "election.pml" (state 78)	[L?d]
106:	proc  3 (process1) line 105 "election.pml" (state 79)	[((d==id))]
108:	proc  3 (process1) line 107 "election.pml" (state 80)	[((leader!=id))]
110:	proc  3 (process1) line 107 "election.pml" (state 81)	[numleaders = (numleaders+1)]
112:	proc  3 (process1) line 110 "election.pml" (state 85)	[leader = id]
114:	proc  3 (process1) line 110 "election.pml" (state 86)	[elected_leader = 1]
116:	proc  3 (process1) line 113 "election.pml" (state 89)	[else]
118:	proc  3 (process1) line 117 "election.pml" (state 94)	[else]
120:	proc  3 (process1) line 122 "election.pml" (state 100)	[R!d]
122:	proc  3 (process1) line 123 "election.pml" (state 101)	[num_messages = (num_messages+1)]
124:	proc  3 (process1) line 126 "election.pml" (state 104)	[else]
126:	proc  2 (process1) line 123 "election.pml" (state 101)	[num_messages = (num_messages+1)]
128:	proc  2 (process1) line 126 "election.pml" (state 104)	[else]
130:	proc  1 (process1) line  30 "election.pml" (state 8)	[num_messages = (num_messages+1)]
132:	proc  1 (process1) line  33 "election.pml" (state 11)	[else]
134:	proc  1 (process1) line  35 "election.pml" (state 14)	[L?e]
136:	proc  1 (process1) line  51 "election.pml" (state 33)	[else]
138:	proc  1 (process1) line  56 "election.pml" (state 39)	[else]
140:	proc  1 (process1) line  56 "election.pml" (state 40)	[R!e]
142:	proc  2 (process1) line 102 "election.pml" (state 78)	[L?d]
144:	proc  2 (process1) line 119 "election.pml" (state 97)	[else]
146:	proc  2 (process1) line 122 "election.pml" (state 100)	[R!d]
148:	proc  3 (process1) line 102 "election.pml" (state 78)	[L?d]
150:	proc  3 (process1) line 105 "election.pml" (state 79)	[((d==id))]
152:	proc  3 (process1) line 108 "election.pml" (state 82)	[else]
154:	proc  3 (process1) line 110 "election.pml" (state 85)	[leader = id]
156:	proc  3 (process1) line 110 "election.pml" (state 86)	[elected_leader = 1]
158:	proc  3 (process1) line 113 "election.pml" (state 89)	[else]
160:	proc  3 (process1) line 117 "election.pml" (state 94)	[else]
162:	proc  3 (process1) line 122 "election.pml" (state 100)	[R!d]
164:	proc  3 (process1) line 123 "election.pml" (state 101)	[num_messages = (num_messages+1)]
166:	proc  3 (process1) line 126 "election.pml" (state 104)	[else]
168:	proc  2 (process1) line 123 "election.pml" (state 101)	[num_messages = (num_messages+1)]
170:	proc  2 (process1) line 126 "election.pml" (state 104)	[else]
172:	proc  1 (process1) line  56 "election.pml" (state 41)	[num_messages = (num_messages+1)]
174:	proc  1 (process1) line  60 "election.pml" (state 46)	[else]
176:	proc  1 (process1) line  62 "election.pml" (state 49)	[L?f]
178:	proc  1 (process1) line  79 "election.pml" (state 68)	[else]
180:	proc  1 (process1) line  83 "election.pml" (state 71)	[(((e>=d)&&(e>=f)))]
180:	proc  1 (process1) line  83 "election.pml" (state 72)	[d = e]
182:	proc  1 (process1) line  24 "election.pml" (state 1)	[active_iters = (active_iters+1)]
184:	proc  1 (process1) line  26 "election.pml" (state 2)	[((active_iters>2))]
186:	proc  1 (process1) line  26 "election.pml" (state 3)	[iters_exceeded = 1]
Never claim moves to line 194	[(iters_exceeded)]
188:	proc  1 (process1) line  29 "election.pml" (state 7)	[R!d]
Never claim moves to line 198	[(1)]
spin: trail ends after 189 steps
#processes: 4
		leader = 2
		numleaders = 1
		highest_id = 2
		num_messages = 12
		max_messages = 9
		iters_exceeded = 1
		message_exceeded = 0
		single_leader = 1
		elected_leader = 1
		highest_leader = 1
189:	proc  3 (process1) line 102 "election.pml" (state 78)
189:	proc  2 (process1) line 102 "election.pml" (state 78)
189:	proc  1 (process1) line  30 "election.pml" (state 8)
189:	proc  0 (:init:) line 137 "election.pml" (state 4) <valid end state>
189:	proc  - (:never:) line 199 "election.pml" (state 8) <valid end state>
4 processes created
