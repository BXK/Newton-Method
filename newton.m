%
% for example you want find the minimum of the function F=x^2+y^2-2.12
% we define the function :f=inline('p(:,1).^2+p(:,2).^2-2.12','p');
% 
% in the newton function 
% f:the function
% p0:the initial value
% tol: the tolerant
% MaxIter: the max iteration of the algorithm
% 
% we call newton(f,[1 1],0.4e-6,10) we out put each iteration result!!


function [s J] = newton(f,p0,tol,MaxIter)
format long
num = size(p0,2);

for i=1:num
    Variable(i)=sym(['x' num2str(i)]);
end
% x = sym('x'); 
% y = sym('y'); 

F = f(Variable);


% Compute the Jacobian matrix symbolically
H = hessian(F);
invH = inv(H);

G = gradient(F);

s = zeros(MaxIter,size(p0,2));
s(1,:) = p0;
dsnorm = inf;
iter = 1;

while dsnorm>tol && iter<MaxIter
    dh = subs(invH,Variable,s(iter,:));
    dj = subs(G,Variable,s(iter,:));
        
    [r,p]=chol(dh);
    if p~=0
        disp('the hessian matrix is not positive!!!!!!!!!!!!!!!!!!!!');
        pause
    end
    
    s(iter+1,:) = s(iter,:) - dj'*dh';
    dsnorm = norm(dj);
    iter = iter+1;
end

s = s(1:iter,:);

end

