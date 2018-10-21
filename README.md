# Multimedia-Assignment
[y,Fs]= audioread('D:\matlab\melody.wav');
%sound(y,Fs)
%plot(y);
Y = fft(y);
plot(abs(Y))
N = Fs % number of FFT points
transform = fft(y,N)/N;
magTransform = abs(transform);

faxis = linspace(-Fs/2,Fs/2,N);
plot(faxis,fftshift(magTransform));
xlabel('Frequency (Hz)')

% view frequency content up to half the sampling rate:
axis([0 length(faxis)/2, 0 max(magTransform)]) 

% change the tick labels of the graph from scientific notation to floating point: 
xt = get(gca,'XTick');  
set(gca,'XTickLabel', sprintf('%.0f|',xt))
[y,Fs]= audioread('D:\Matlab\melody.wav');
win = 128 % window length in samples
% number of samples between overlapping windows:
hop = win/2            

nfft = win % width of each frequency bin 
spectrogram(y_rec,win,hop,nfft,Fs,'yaxis')

% change the tick labels of the graph from scientific notation to floating point: 
yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt))
