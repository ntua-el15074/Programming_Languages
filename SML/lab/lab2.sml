fun factorial n = if n = 0 then 1 else n*factorial(n-1);

factorial(7);

factorial(it) handle Overflow => 0;
