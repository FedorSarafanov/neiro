function [t,u,v,x,y] = vdp_berstreeally()
t=[0 400];
y0=[-0.2553    0.0656    0.0743    0.0301];
y0=[-0.3605    0.4672   -0.3217    0.6580];
% y0=[ -0.0069    0.0891   -0.1039   -0.1398];
y0=[ -0.2839    0.0853    0.0969    0.0000];
% y0=[0.0937    0.0786   -0.0516   -0.0138];y0=[1.0036    0.0847   -0.1002   -0.0117];
[T,Y]=ode15s(@myfun, t, y0)
plot(T,Y(:,1));
[T Y]
% t=T;
u=Y(:,1);
v=Y(:,2);
x=Y(:,2);
y=Y(:,2);


function dy = myfun(t,A)
a=0.2;
epsilon1=0.002;
epsilon2=1.5*0.024;
gamma=0.12;
omega=0.5;
alpha=5;
beta=10;
I=-0.16;
d=0.94;

dy = zeros(4,1);   
dy(1) = 1/epsilon1*(A(1)*(1-A(1))*(A(1)-a)-A(2)-d*A(3));
dy(2) = epsilon2*(A(1)-I);
dy(3) = A(4);
dy(4) = (gamma*(1-alpha*I+beta*A(1))-A(3)^2)*A(4)-omega^2*A(3);




