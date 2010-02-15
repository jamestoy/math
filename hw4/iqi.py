"""
File   iqi.py
Author Ernesto P. Adorio,Ph.D.
email  ernesto.adorio@gmail.com
	   UPDEPP at Clark Field
	   Pampanga, the Philippines
desc   Performs inverse quadratic interpolation
	   to determine a root of f(x) without using
	   derivatives.
 
revisions
	   04.03.2009 first release.
"""
 
from math import *
 
def invqinterp(xnm2, xnm1, xn,
			   fnm2, fnm1, fn):
	"""
	Returns estimate of root xest given
	three points on a parabola such that
	(xest, 0).
	"""
	return xnm2 *fnm1 *fn/  ((fnm2-fnm1)* (fnm2-fn))+\
		   xnm1 *fnm2 *fn/  ((fnm1-fnm2)* (fnm1-fn))+\
		   xn   *fnm2 *fnm1/((fn - fnm2)* (fn - fnm1))
 
 
def iqi(f, a, b, ztol, maxiter):
	"""
	f - function whose root is desired.
	a,b - interval limits satisfying
		  f(a)and  fb) have opposite signs.
	ztol - comparison with zero tolerance.
	maxiter - maximum number of iterations
	"""
	xnm2 = a
	fnm2 = f(a)
	xnm1 = b
	fnm1 = f(b)
	xn   = a + (b-a)*0.5
	fn   = f(xn)
	fasign = (fnm2 < 0.0)
	if (fnm1< 0.0) == fasign:
	   return None
 
	switch = True
	for i in range(maxiter):
		print "i, xn, fn, a, b, fnm2, fnm1=", i, xn, fn,a, b, fnm2, fnm1
		#Check for near equal function values.
		if abs(fnm2-fnm1)< ztol or \
		   abs(fnm1-fn)  < ztol or\
		   abs(fn-fnm2)  < ztol:
 
		   #ensure bisection is used if this is the case
		   if switch:
			  print "switching to bisection",
			  switch = not switch
		if switch:
		   # perform quadratic interpolation
		   print "iqi:",
		   xest = invqinterp(xnm2, xnm1, xn,
							 fnm2, fnm1, fn)
		else:
		   print "biseciton:",
		   xest = a + (b-a) * 0.5
 
		switch = not switch
 
		fxest= f(xest)
		print "xest, fxest =", xest, fxest
		if abs(fxest) < ztol:
		   print "tolerance met."
		   return xest, fxest, i+1
 
		if (fxest < 0) == fasign:
		   xnm2 = xest
		   fnm2 = fxest
		   a = xest
		else:
		   xnm1 = xest
		   fnm1 = fxest
		   b = xest
 
		xn   = a + (b-a)*0.5
		fn   = f(xn)
		if abs(b-a) < ztol:
		   return (xn, fn,i+1)
	return xn, fn, maxiter
 
if __name__ == "__main__":
   def f(x):
	   return cos(x) -x
   a = .39
   b = 1.57
   print iqi(f, a, b, ztol=1.0e-8, maxiter= 10)
