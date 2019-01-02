function [ features ] = getFeatures( imagePath, N )

im = imread(imagePath);     % Input an image,
im = logical(im);           % Convert the original intensity values into logical 1s and 0s

c = chainCode(im);          % Get chain code of image


%% filter using the FT of the angles of the chaincode
angles = c(3,:)*(2*pi/8);
anglesFFT = fft(angles); %fast fourier transform

% Filter using a 'top hat' filter. The filter conists of the value one for 
% the lowest N-frequencies and zero elsewhere.
N = N + 1; %number of lowest frequencies to keep, add 1 so the zero frequency can be discarded
filter = zeros(size(angles)); 

%Both the positive and negative low frequencies must be kept
%filter(1) is the zero (DC) frequency, so there will be (N*2)-1 ones in total
filter(1:N) = 1; 
filter(end-N+2:end) = 1;

filteredFFT = anglesFFT .* filter;  % Apply the filter by scalar multipliacation
features = abs(filteredFFT);        % Take absolute value of FFT, to use as features

features = features(2:N);           % Discard lowest frequency

