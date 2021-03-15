clear all; close all; clc;
EEG_test = importdata("C:\Users\Carl\Documents\Year3\Dis\Network_model\EEG_L.csv");
EEG_ref = importdata("C:\Users\Carl\Documents\Year3\Dis\Network_model\EEG_R.csv");
time_test = EEG_test.data(:,1);
time_ref = EEG_ref.data(:,1);
EEG_test = EEG_test.data(:,2);
EEG_ref = EEG_ref.data(:,2);

%plotting time domain signal
figure(1);
plot(time_test, EEG_test, 'r');
hold on
plot(time_ref, EEG_ref, 'k');
hold off;
xlabel('Time'), ylabel('Mean AMPA Current'), title('EEG reading after varying model parameters');
legend('Test','Reference');

%FFT
N_test = length(time_test);
N_ref = length(time_ref);

dt_test = (time_test(2)-time_test(1))*10^-1.5;
dt_ref = (time_ref(2)-time_ref(1))*10^-1.5;

EEG_test_hat = fft(EEG_test,N_test);
EEG_ref_hat = fft(EEG_ref,N_ref);

PSD_test = ((EEG_test_hat.*conj(EEG_test_hat)).^0.5); %Power spectrum
PSD_ref = ((EEG_ref_hat.*conj(EEG_ref_hat)).^0.5); %Power spectrum

freq_test = 1/(dt_test*N_test)*(0:N_test);
freq_ref = 1/(dt_ref*N_ref)*(0:N_ref);

L_test = 1:floor(N_test/2);
L_ref = 1:floor(N_ref/2);

%figure(2);
%plot(freq_NP(L_NP), PSD_NP(L_NP), 'r');
%hold on
%plot(freq_P(L_P), PSD_P(L_P), 'k');
%hold off;
%xlabel('Frequency'), ylabel('Amplitude'), title('Power Spectral Density of EEG');
%legend('No Propofol','Propofol');
%axis([0 500 0 10^4]);

%use PSD to filter out noise
indices_test = PSD_test>500;
indices_ref = PSD_ref>500;

PSD_test = PSD_test.*indices_test/N_test;
PSD_ref = PSD_ref.*indices_ref/N_ref;

figure (2);
plot(freq_test(L_test), PSD_test(L_test), 'r');
%hold on
%plot(freq_ref(L_ref), PSD_ref(L_ref), 'k');
%hold on
%cutoff = 2 + zeros( 1, size(freq_ref(L_ref),2));
%plot(freq_ref(L_ref), cutoff, 'b');
hold off;
xlabel('Frequency (Hz)'), ylabel('Amplitude'), title('Power Spectral Density of EEG');
legend('Reference');
%legend('Test','Reference'); %, 'Cut-off');
axis([0 70 0 5]);

mse = (1/length(PSD_test))*dot(PSD_test-PSD_ref,PSD_test-PSD_ref)