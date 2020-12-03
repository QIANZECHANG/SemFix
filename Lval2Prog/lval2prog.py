Lval={  'l_inhibit':0,
	'l_up_sep':1,
	'l_down_sep':2,
	'l_c':3,
	'l_r':4,
	'l_x':3,
	'l_y':1  }
c=100
maxLine=5
inputNum=3
components={'r':'+','c':'c'}
inputAndCompLvar=['l_inhibit','l_up_sep','l_down_sep','l_c','l_r']
target='bias='

class component:
    def __init__(self,operand):
        self.operand=operand

class plus(component):
    def synthesis(self,dic):
        x=dic[Lval[self.operand[0]]]
        y=dic[Lval[self.operand[1]]]
        return x+'+'+y

L2Var={}
for l in inputAndCompLvar:
    if l[2:]=='c':
        L2Var[Lval[l]]=str(c)
        continue
    L2Var[Lval[l]]=l[2:]
#L2Var={0:'inhibit',1:'up_sep',2:'down_sep',3:'100',4:'r'}

def compSynthesis(comp):
    if comp=='+':
        p=plus(['l_x','l_y'])
        return p.synthesis(L2Var)

def Lval2Prog():
    res=[]
    for i in range(inputNum,maxLine):   
        if L2Var[i] in components:
            s=compSynthesis(components[L2Var[i]])
            res.append((L2Var[i],s))
    return res
   
prog=Lval2Prog()
if len(prog)==1:
    print(target+prog[-1][-1])
else:
    for p in prog:
        print(p[0]+'='+p[1])
    print(target+prog[-1][0])
	     



















