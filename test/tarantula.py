import os

def tarantula(exe_pass,exe_fail,total_pass,total_fail):
    if exe_fail+exe_pass==0:
        return 0
    return (exe_fail/total_fail)/((exe_fail/total_fail)+(exe_pass/total_pass))

# record expected output
def getExpectedOutput(filename):
    expected_output={}
    f=open(filename,'r')
    i=0
    for line in f.readlines():
        i+=1 
        expected_output[str(i)]=line.strip().split()[-1]
    return expected_output


# record real output and executed lines of every test
def getRealOutput(path):
    real_output={}
    files=os.listdir(path)
    for txt in files:
        f=open(path+txt,'r')
        testId=txt[1:]
        real_output[testId]={}
        lines=[]
        for l in f.readlines():
            if "line" not in l[:4]:
                result=l.strip()
            else:
                lineId=l.strip().split()[-1]
                if lineId in lines:
                    continue
                else:
                    lines.append(lineId)
        real_output[testId]["lines"]=lines
        real_output[testId]["output"]=result
    return real_output


# get total pass/fail and each line's pass/fail
def getResult(expectedOutput,realOutput):
    maxline=realOutput["1"]["lines"][-1]
    resultOfLines={str(i):{"pass":0,"fail":0} for i in range(1,int(maxline)+1)}
    totalPass=0
    totalFail=0
    for testId in realOutput.keys():
        result=realOutput[testId]["output"]==expectedOutput[testId]
        if result:
	    totalPass+=1
     	    for i in realOutput[testId]["lines"]:
                resultOfLines[i]["pass"]+=1
        else:
	    totalFail+=1
	    for i in realOutput[testId]["lines"]:
		resultOfLines[i]["fail"]+=1
            
    return resultOfLines,totalPass,totalFail


expectedOutput=getExpectedOutput("input_test.txt")
realOutput=getRealOutput("output/")
resultOfLines,totalPass,totalFail=getResult(expectedOutput,realOutput)

result=[]

if totalFail==0:
    print("no fail")
else:
    for line in resultOfLines.keys():
        score=tarantula(resultOfLines[line]["pass"],
                    resultOfLines[line]["fail"],
                    float(totalPass),
	            float(totalFail))   
        result.append((line,score))

    result.sort(key=lambda x:x[1],reverse=True)

    for i in range(5):
        print("line"+result[i][0]+" score: "+str(result[i][1]))


























