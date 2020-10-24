import os

def getTestSuite(filename):
    test={}
    f=open(filename,'r')
    i=0
    for line in f.readlines():
        i+=1 
        test[str(i)]=line.strip().split()
    return test

def getKtestOutput(path):
    ktest={}
    files=os.listdir(path)
    for txt in files:
        f=open(path+txt,'r')
        testId=txt[4:]
        for l in f.readlines():
            if "int" in l:
                ktest[testId]=l.strip().split()[-1]
        if ktest.get(testId) is None:
            ktest[testId]="not executed"
    return ktest

test=getTestSuite("input_test.txt")
ktest=getKtestOutput("ktest_output/")

for k in range(1,len(test)+1):
    k=str(k)
    print("test"+k+" : expected output="+test[k][-1]+", bias=f(",end='')
    for v in test[k][:-2]:
        print(v+", ",end='')
    print(test[k][-2]+")="+ktest[k])





