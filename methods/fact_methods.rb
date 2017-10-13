def recursively(n)
	if n==1
		return 1
	else 
		n * fact(n-1) 
	end
end

def by_inject(n)
  (1..n).inject(:*)
end


