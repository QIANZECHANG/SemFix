from z3 import *

s=Solver()

l_inhibit=0
l_up=1
l_down=2
l_c=3
l_x,l_y=Ints('l_x l_y')

inhibit=[1,1,1]
up=[0,11,-20]
down=[100,110,60]
c=Int('c')
x=[]
y=[]
r=[]
for i in range(3):
    x.append(If(l_x==l_inhibit,inhibit[i],If(l_x==l_up,up[i],If(l_x==l_down,down[i],c))))
    y.append(If(l_y==l_inhibit,inhibit[i],If(l_y==l_up,up[i],If(l_y==l_down,down[i],c))))
    r.append(x[i]+y[i])

s.add(l_x>=0,l_x<4,l_y>=0,l_y<4)
s.add(r[0]<=100,r[1]>110,r[2]>60)
print(s.check())
print(s.model())


