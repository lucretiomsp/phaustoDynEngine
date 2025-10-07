import("stdfaust.lib");
speed = hslider("speed", 1, 0, 4, 0.01);
level = hslider("level", 0.5, 0, 1, 0.01);
process = so.loop_speed_level(soundfile("files [url: {/Users/domenicocipriani/Downloads/dissemination_16bit.wav}]",2), 0 , speed, level);'
