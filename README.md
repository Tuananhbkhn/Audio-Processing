x=audiorecorder;
disp('Start talking');
recordblocking(x,10);
disp('Stop talking');
y=getaudiodata(x,'double');
sound(y)
filename = 'orig_input.wav';
audiowrite(filename,y,8000);
fs = 44100; % signal frequence
t = 0 : 1/fs : .25; % time play the sound wave
f1 = 987.77;  %B5 node
f2 = 1046.50; %C5 node
f3 = 659.25;  %E5 node
f4 = 880;     %A5 node
f5 = 587.33;  %D5 node
f6 = 783.99;  %G5 node
f7 = 689.46;  %F5 node
f8 = 739.99;  %F5# node
f9 = 440;     %A4 node
w = 0; %phase
A=.25; %amplitude
%make sound wave
y1 = A * sin( 2 * pi * f1 * t + w );
y2 = A * sin( 2 * pi * f2 * t + w );
y3 = A * sin( 2 * pi * f3 * t + w );
y4 = A * sin( 2 * pi * f4 * t + w );
y5 = A * sin( 2 * pi * f5 * t + w );
y6 = A * sin( 2 * pi * f6 * t + w );
y7 = A * sin( 2 * pi * f7 * t + w );
y8 = A * sin( 2 * pi * f8 * t + w );
y9 = A * sin( 2 * pi * f9 * t + w );
%Intro bài "Let it go"
yMel1 = [ y1 y2 y3 y1 y1 y1 y2 y2];
yMel2 = [ y1 y2 y3 y1 y1 y1 y2 y2];
yMel3 = [ y4 y1 y5 y4 y4 y4 y1 y1];
yMel4 = [ y6 y6 y6 y6 y7 y7 y7 y7];
yMel5 = [ y6 y6 y6 y6 y8 y8 y9 y9];
 
yMel = [yMel1 yMel2 yMel3 yMel4 yMel1 yMel2 yMel3 yMel5];
%play the melody
sound( yMel, fs, 16 )
%get audio
[yRec,fs]= audioread('orig_input.wav');
%equal the size of two sound matrixs
yRec = yRec';
yRec = [yRec yRec];
yRec = imresize(yRec,[1,705664]);
%mix two sound
yMix = 2 * yRec + yMel/2;
%play it
sound(yMix,44100)
%make .wav file
filename = 'melody.wav';
audiowrite(filename,yMix,44100)
YMix=fft(yMix);
plot(YMix);
%take data
[y,fs]=audioread('melody.wav');
%make window
win = 128; 
hop = win/2;            
nfft = win;
%draw spectogram
spectrogram(y,win,hop,nfft,fs,'yaxis')



