begin();

dt=1e-3;

[t1,input1,output1] = getData('./Dados para identificacao/est_01.txt',dt);
[t2,input2,output2] = getData('./Dados para identificacao/est_02.txt',dt);
[t3,input3,output3] = getData('./Dados para identificacao/est_03.txt',dt);
[t4,input4,output4] = getData('./Dados para identificacao/est_04.txt',dt);

generateInputPlots(t1,input1,output1,'est\_01.txt','./data/01.png')
generateInputPlots(t2,input2,output2,'est\_02.txt','./data/02.png')
generateInputPlots(t3,input3,output3,'est\_03.txt','./data/03.png')
generateInputPlots(t4,input4,output4,'est\_04.txt','./data/04.png')