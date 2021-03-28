function generateInputPlots(t,inputSignal,outputSignal,chartTitle,savefile)
    f=figure('visible','off');
    p=plot(t,outputSignal,t,inputSignal,'--r');
    title(chartTitle)
    legend('output','input')
    ylim(ylim*1.04);
    saveas(f,savefile);
end
