//state_machine(st_default);

//Call this in the step event to handle the Finite State Machine (FSM).

//[Introduction]
// Finite State Machines are a handy way to program game objects because
// each state is, in essence, a moment in time for the object. It is HOW
// exists, so to speak, (or behaves) at that moment while in that state.
// Since it can only be in one state at a time, each state's independent
// the others, thus only the transiton between them matters. It gives an
// enormous amount of flexibility in programming object behaviors simply
// because, no matter how they behave, a state maintains a specific flow.
// As long as you control that flow, it doesn't matter what they contain.
// You only need to know what they're doing now, and where they might be
// going next when they're done (if anywhere at all).


//[Notes]
// A st_script should detail how an object is behaving at a given point in
// time, so program freely while in one. Use input_check() to help with
// checking how long buttons are pressed during a state to check if the
// state should be changed. Also, use the "state_time" variable to check
// the length of time (the number of steps) an object has been in a state.

// Use "next_state = st_script" to indicate what the next state is. ALWAYS
// return() a value to indicate HOW to transition to the next state (or if
// we just want to repeat one). Change the state by returning "state_next"
// OR, to enter a state during the same step, we return "state_nextnow".
// The return actions and args are the core of any FSM, so use them lots!!!


//[Also]
// Credit Ace and the Zero Engine if you use (or modify) this! :)



//Initialize
if (state_machine_initialized == 0) 
{
  state_index = argument0 //default state to execute (try NOT to change directly!)
  next_state = argument0 //next state to be executed (use THIS to change states)
  prev_state = state_index
  state_time = 0 //time we've been in the current state
  //Arguments
  state_machine_initialized = 1
  arg0 = 0 //Use these variables if you want to pass arguments to your scripts,
  argument_clear = 0 //Set this to 1 before changing states to clear the args to 0

  //Return Actions (These are defined as constants already in this example)
  state_nextnow  = 3 //execute the next state during this step
  state_next     = 0 //execute the next state in the next step
  state_continue = 1 //continues a state again next step
  state_repeat   = 2 //go back to the last state
  state_previous = 4
  arg0 = 0
   arg1 = 0
   arg2 = 0
   arg3 = 0
   arg4 = 0
   arg5 = 0
   arg6 = 0
   arg7 = 0
}

//We're going to clear the arguments
if (argument_clear == 1)
{
   arg0 = 0
   arg1 = 0
   arg2 = 0
   arg3 = 0
   arg4 = 0
   arg5 = 0
   arg6 = 0
   arg7 = 0
   argument_clear = 0
}

//Process State Transitions
var nxt;
nxt = script_execute(state_index, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)

while(nxt == state_nextnow) 
{ //continue going to next state during this step
   prev_state = state_index;
   state_index = next_state;
   state_time = 0;
   nxt = script_execute(state_index, arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
   //if nxt = state_nextnow
   //nxt = script_execute(state_index,arg0,arg1,arg2,arg3,arg4,arg5,arg6,arg7)
   if (nxt == state_repeat)
   {break;}
   //We'll clear the arguments if necessary
   if (argument_clear == 1) 
   {
     arg0 = 0
     arg1 = 0
     arg2 = 0
     arg3 = 0
     arg4 = 0
     arg5 = 0
     arg6 = 0
     arg7 = 0
     argument_clear = 0
   }
}

while(nxt == state_repeat) 
{ //repeat state but don't go to next step
   //We'll clear the arguments if necessary
   if (argument_clear == 1)
   {
     arg0 = 0
     arg1 = 0
     arg2 = 0
     arg3 = 0
     arg4 = 0
     arg5 = 0
     arg6 = 0
     arg7 = 0
     argument_clear = 0
   }
   nxt = script_execute(state_index,arg0,arg1,arg2,arg3,arg4,arg5,arg6,arg7);
   if nxt = state_nextnow //if state_nextnow is returned, execute the state machine
   {
      state_index = next_state;
      state_time = 0;
      //We'll clear the arguments if necessary
      if (argument_clear == 1) 
      {
       arg0 = 0
       arg1 = 0
       arg2 = 0
       arg3 = 0
       arg4 = 0
       arg5 = 0
       arg6 = 0
       arg7 = 0
       argument_clear = 0
       }
      script_execute(state_machine);
      exit;
   }
   state_time += 1;
}

if(nxt == state_next) { //change state in the next step
   prev_state = state_index;
   state_index = next_state;
   state_time = 0;
   //We'll clear the arguments if necessary
   if (argument_clear == 1)
   {
     arg0 = 0
     arg1 = 0
     arg2 = 0
     arg3 = 0
     arg4 = 0
     arg5 = 0
     arg6 = 0
     arg7 = 0
     argument_clear = 0
   }
}
if(nxt == state_continue) 
{ //continue state in the next step
   state_time += 1;
}

if (nxt == state_previous)
{
  state_index = prev_state;
  state_time = 0;
  if (argument_clear == 1)
   {
     arg0 = 0
     arg1 = 0
     arg2 = 0
     arg3 = 0
     arg4 = 0
     arg5 = 0
     arg6 = 0
     arg7 = 0
     argument_clear = 0
  }
}
