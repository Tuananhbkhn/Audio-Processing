[y,Fs]= wavread('C:\Users\Administrator\Downloads\New folder\melody.wav');
win = 128 % window length in samples
% number of samples between overlapping windows:
hop = win/2            

nfft = win % width of each frequency bin 
spectrogram(y_rec,win,hop,nfft,Fs,'yaxis')

% change the tick labels of the graph from scientific notation to floating point: 
yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt))