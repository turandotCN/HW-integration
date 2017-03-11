
module HW_int


#Q1.A:
global plotb = Gadfly.plot(layer(demand,0,5),Guide.xlabel("Prices"), Guide.ylabel("Quantities"), Guide.Title("Demand function"))

#Change in surplus is
# /int_1^inf(q(p))-/int_4^inf(q(p))
# = /int_1^inf(q(p))+/int_inf^4(q(p))
# = /int_1^4(q(p))
# = (4*sqrt(p))_1^4
# = 4
	

# question 1 b) 
# here are the packages I used

	using FastGaussQuadrature
	using Roots
	using Sobol
	using PyPlot
	using Distributions

# here are some functions I defined for useage 
# in several sub questions

#demand function
	
p1 = 4
p2 = 1

function demand(p)
return 2*(p)^(-0.5)
end

	 
#Q1.B(1)
n=10 #test with 100 and 1000
nodes_start = gausslegendre(n)[:1]
weights = gausslegendre(n)[:2]
nodes = nodes_start*(p1-p2)/2 + (p1+p2)/2
GL = (p1 - p2)/2 * dot(weights, demand.(nodes)) ##finds 4 here again

#Q1.B(2)
a=1
b=4
q(p) = 2/sqrt(p)
xnodes = rand(Uniform(a,b),n)
ynodes = map(q, xnodes)
MC = ((b-a)/n)*sum(ynodes) #approx. 4 here.

#Q1.B(3)
sobol = SobolSeq(1,a,b)
skip(sobol, n)
xnodes = hcat([next(sobol) for i = 1:n]...)
ynodes = map(q,xnodes)
PseudoMC = ((b-a)/n)*sum(ynodes) #finds 4 here too. 

#Part 2
couldnt' do it



	function question_1b(n)

	end


	function question_1c(n)

	end


	function question_1d(n)

	end


	function question_2a(n)

	end


	function question_2b(n)

	end	


	# function to run all questions
	function runall(n=10)
		println("running all questions of HW-integration:")
		println("results of question 1:")
		question_1b(n)	# make sure your function prints some kind of result!
		question_1c(n)
		question_1d(n)
		println("")
		println("results of question 2:")
		q2 = question_2a(n)
		println(q2)
		q2b = question_2b(n)
		println(q2b)
		println("end of HW-integration")
	end

end

