-- Szymon Cogiel zad 7b

-- Napisz procedurę wypisującą do konsoli ciąg Fibonacciego. Procedura musi przyjmować jako argument wejściowy liczbę n. Generowanie ciągu Fibonacciego musi zostać.
create or replace function FibonacciSequence(upTo int) returns void as $$
declare
	num1 integer := 0;
	num2 integer := 1;
	numCount integer := 0;
	numNext integer := 0;

begin
	raise notice 'Fibonacci sequence up to % numbers', upTo;
	if upTo = 0 then
		raise notice 'Enter number higher than 0.';
	elsif upTo = 1 then
		raise notice '%', num1;
	else
		while numCount < upTo loop
			raise notice '%', num1;
			numNext := num1 + num2;
			num1 := num2;
			num2 := numNext;
			numCount := numCount + 1;
		end loop;
	end if;
end
$$ language plpgsql;

create procedure WriteFibonacci(upTo int)
language SQL
	as $$
		-- Perform executes function and discards the result.
		select FibonacciSequence(20);
	$$;

CALL WriteFibonacci(20);
