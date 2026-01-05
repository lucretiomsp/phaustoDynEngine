import("stdfaust.lib");

sampleLength = 0,9:soundfile("son[url:{''/Users/domenicocipriani/Downloads/dissemination_16bit.wav''}]",2): _ , ! , ! , !;
slen = vslider("sampLen", 10000, 100, 59000, 10);
speed = vslider("speed", 1, 0.2, 3, 0.01);
rst = button("reset");
resetter = _ , 0 : select2(rst);
reader = resetter~+(speed) ;
process = 0,reader:soundfile("son[url:{''/Users/domenicocipriani/Downloads/dissemination_16bit.wav''}]",2): ! , ! , _ ,_ :> re.jcrev;'.

