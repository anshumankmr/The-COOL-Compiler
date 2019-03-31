# The COOL Compiler

Compiler that performs Lexical and Syntactical Analysis for the language COOL, used at Stanford's course on Compiler.
More about it can be found in the Cool Manual and [here](https://lagunita.stanford.edu/courses/Engineering/Compilers/Fall2014/about).
This is part of our VIth semester CSE Project.

## Getting Started

Clone the repo and then in the directory of the repo, do chmod +x exec.sh

### Prerequisites

Need Bison and Flex PreInstalled

## Running the tests

Follow these steps
```
chmod + exec.sh
./exec.sh
```
### Read the Output on the Terminal. If it says Sucess, then it is sucessfully compiled

```
./out
class A {

   var : Int <- 0;

   value() : Int { var };

   set_var(num : Int) : SELF_TYPE {
      {
         var <- num;
         self;
      }
   };

   method1(num : Int) : SELF_TYPE {  
      self
   };

   method2(num1 : Int, num2 : Int) : B {  
      (let x : Int in
	 {
            x <- num1 + num2;
	    (new B).set_var(x);
	 }
      )
   };

   method3(num : Int) : C {  
      (let x : Int in
	 {
            x <- ~num;
	    (new C).set_var(x);
	 }
      )
   };

   method4(num1 : Int, num2 : Int) : D {  
            if num2 < num1 then
               (let x : Int in
		  {
                     x <- num1 - num2;
	             (new D).set_var(x);
	          }
               )
            else
               (let x : Int in
		  {
	             x <- num2 - num1;
	             (new D).set_var(x);
		  }
               )
            fi
   };

   method5(num : Int) : E {  
      (let x : Int <- 1 in
	 {
	    (let y : Int <- 1 in
	       while y <= num loop
	          {
                     x <- x * y;
	             y <- y + 1;
	          }
	       pool
	    );
	    (new E).set_var(x);
	 }
      )
   };

};

class B inherits A {  

   method5(num : Int) : E { 
      (let x : Int in
	 {
            x <- num * num;
	    (new E).set_var(x);
	 }
      )
   };

};

class C inherits B {

   method6(num : Int) : A { 
      (let x : Int in
         {
            x <- ~num;
	    (new A).set_var(x);
         }
      )
   };

   method5(num : Int) : E {  
      (let x : Int in
	 {
            x <- num * num * num;
	    (new E).set_var(x);
	 }
      )
   };

};

class D inherits B {  
		
   method7(num : Int) : Bool {  
      (let x : Int <- num in
            if x < 0 then method7(~x) else
            if 0 = x then true else
            if 1 = x then false else
	    if 2 = x then false else
	       method7(x - 3)
	    fi fi fi fi
      )
   };

};

class E inherits D {

   method6(num : Int) : A {  
      (let x : Int in
         {
            x <- num / 8;
	    (new A).set_var(x);
         }
      )
   };

};
class A2I {

     c2i(char : String) : Int {
	if char = "0" then 0 else
	if char = "1" then 1 else
	if char = "2" then 2 else
        if char = "3" then 3 else
        if char = "4" then 4 else
        if char = "5" then 5 else
        if char = "6" then 6 else
        if char = "7" then 7 else
        if char = "8" then 8 else
        if char = "9" then 9 else
        { abort(); 0; }  

        fi fi fi fi fi fi fi fi fi fi
     };




     i2c(i : Int) : String {
	if i = 0 then "0" else
	if i = 1 then "1" else
	if i = 2 then "2" else
	if i = 3 then "3" else
	if i = 4 then "4" else
	if i = 5 then "5" else
	if i = 6 then "6" else
	if i = 7 then "7" else
	if i = 8 then "8" else
	if i = 9 then "9" else
	{ abort(); ""; }  
        fi fi fi fi fi fi fi fi fi fi
     };









     a2i(s : String) : Int {
        if s.length() = 0 then 0 else
	if s.substr(0,1) = "-" then ~a2i_aux(s.substr(1,s.length()-1)) else
        if s.substr(0,1) = "+" then a2i_aux(s.substr(1,s.length()-1)) else
           a2i_aux(s)
        fi fi fi
     };





     a2i_aux(s : String) : Int {
	(let int : Int <- 0 in	
           {	
               (let j : Int <- s.length() in
	          (let i : Int <- 0 in
		    while i < j loop
			{
			    int <- int * 10 + c2i(s.substr(i,1));
			    i <- i + 1;
			}
		    pool
		  )
	       );
              int;
	    }
        )
     };




    i2a(i : Int) : String {
	if i = 0 then "0" else 
        if 0 < i then i2a_aux(i) else
          "-".concat(i2a_aux(i * ~1)) 
        fi fi
    };
	
		

    i2a_aux(i : Int) : String {
        if i = 0 then "" else 
	    (let next : Int <- i / 10 in
		i2a_aux(next).concat(i2c(i - next * 10))
	    )
        fi
    };

};

class Main inherits IO {
   
   char : String;
   avar : A; 
   a_var : A;
   flag : Bool <- true;


   menu() : String {
      {
         out_string("\n\tTo add a number to ");
         print(avar);
         out_string("...enter a:\n");
         out_string("\tTo negate ");
         print(avar);
         out_string("...enter b:\n");
         out_string("\tTo find the difference between ");
         print(avar);
         out_string("and another number...enter c:\n");
         out_string("\tTo find the factorial of ");
         print(avar);
         out_string("...enter d:\n");
         out_string("\tTo square ");
         print(avar);
         out_string("...enter e:\n");
         out_string("\tTo cube ");
         print(avar);
         out_string("...enter f:\n");
         out_string("\tTo find out if ");
         print(avar);
         out_string("is a multiple of 3...enter g:\n");
         out_string("\tTo divide ");
         print(avar);
         out_string("by 8...enter h:\n");
	 out_string("\tTo get a new number...enter j:\n");
	 out_string("\tTo quit...enter q:\n\n");
         in_string();
      }
   };

   prompt() : String {
      {
         out_string("\n");
         out_string("Please enter a number...  ");
         in_string();
      }
   };

   get_int() : Int {
      {
	 (let z : A2I <- new A2I in
	    (let s : String <- prompt() in
	       z.a2i(s)
	    )
         );
      }
   };

   is_even(num : Int) : Bool {
      (let x : Int <- num in
            if x < 0 then is_even(~x) else
            if 0 = x then true else
	    if 1 = x then false else
	          is_even(x - 2)
	    fi fi fi
      )
   };

   class_type(var : A) : SELF_TYPE {
      case var of
	 a : A => out_string("Class type is now A\n");
	 b : B => out_string("Class type is now B\n");
	 c : C => out_string("Class type is now C\n");
	 d : D => out_string("Class type is now D\n");
	 e : E => out_string("Class type is now E\n");
	 o : Object => out_string("Oooops\n");
      esac
   };
 
   print(var : A) : SELF_TYPE {
     (let z : A2I <- new A2I in
	{
	   out_string(z.i2a(var.value()));
	   out_string(" ");
	}
     )
   };

   main() : Object {
      {
         avar <- (new A);
         while flag loop
            {
	       
	       out_string("number ");
	       print(avar);
	       if is_even(avar.value()) then
	          out_string("is even!\n")
	       else
	          out_string("is odd!\n")
	       fi;
	       
	       class_type(avar);
	       char <- menu();
                  if char = "a" then 
                     {
                        a_var <- (new A).set_var(get_int());
	                avar <- (new B).method2(avar.value(), a_var.value());
	             } else
                  if char = "b" then 
                     case avar of
	                   c : C => avar <- c.method6(c.value());
	                   a : A => avar <- a.method3(a.value());
	                   o : Object => {
		                  out_string("Oooops\n");
		                  abort(); 0;
		               };
                     esac else
                  if char = "c" then 
                     {
                        a_var <- (new A).set_var(get_int());
	                avar <- (new D).method4(avar.value(), a_var.value());
	             } else
                  if char = "d" then avar <- (new C)@A.method5(avar.value()) else
		          
                  if char = "e" then avar <- (new C)@B.method5(avar.value()) else
			  
                  if char = "f" then avar <- (new C)@C.method5(avar.value()) else
			  
                  if char = "g" then 
		      if ((new D).method7(avar.value()))
		                       then 
			 {
	                    out_string("number ");
	                    print(avar);
	                    out_string("is divisible by 3.\n");
			 }
			 else  
			 {
	                    out_string("number ");
	                    print(avar);
	                    out_string("is not divisible by 3.\n");
			 }
		      fi else
                  if char = "h" then 
		      (let x : A in
			 {
		            x <- (new E).method6(avar.value());
			    (let r : Int <- (avar.value() - (x.value() * 8)) in
			       {
			          out_string("number ");
			          print(avar);
			          out_string("is equal to ");
			          print(x);
			          out_string("times 8 with a remainder of ");
				  (let a : A2I <- new A2I in
				     {
			                out_string(a.i2a(r));
			                out_string("\n");
				     }
				  ); 
			       }
                            ); 
			    avar <- x;
		         } 
		      )  
		      else
                  if char = "j" then avar <- (new A)
		      else
                  if char = "q" then flag <- false
		      else
                      avar <- (new A).method1(avar.value()) 
                  fi fi fi fi fi fi fi fi fi fi;
            }
         pool;
       }
   };

};

Success
```

### Modify The Input to rmvcmts.l to try different test cases, which can be found in the examples directory.
#### Please Note That This Project Has Not Generated an Abstract Syntax Tree for the PA3 Assignment of the aforementioned course at Lagunita and thus cannot be considered as a solution for the same.

### Contributors 
[Anmol Nanchahal](https://github.com/Anmol156) 


[Aditya Bharadwaj]( https://github.com/adityabharadwaj198)