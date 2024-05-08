#!/bin/bash

#defining out1
Out1() {
	echo "Outer function #1"
     
     #define in1
     IN(){
	    echo "Inner function #1"
	  }
     #call function IN
     IN
 	}
#defining out2
Out2() {
	echo "Outer function #2"
     
     #define in
     IN(){
	    echo "Inner function #2"
	  }
     #call function IN
     IN
 	}
#CALLING OUTER AND NESTED FUNCTIONS
Out1
Out2
IN
#calling IN function again
IN


