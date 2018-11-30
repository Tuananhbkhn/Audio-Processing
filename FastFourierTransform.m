[y,Fs]= wavread('C:\Users\Administrator\Downloads\New folder\melody.wav');
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