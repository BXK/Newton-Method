# Newton-Method
In the Convex optimization we use the Newton-Method to find the minimum of the function, so for function $f(x)$, we do newton-method in the following step:

$$x_{n+1}=x_{n}-(\Delta^2f(x_n))^{-1}\Delta f(x_n)$$

for example you want find the minimum of the function F=x^2+y^2-2.12
we define the function :f=inline('p(:,1).^2+p(:,2).^2-2.12','p');

in the newton function 
f:the function
p0:the initial value
tol: the tolerant
MaxIter: the max iteration of the algorithm

we call newton(f,[1 1],0.4e-6,10) it will output each iteration result!!


