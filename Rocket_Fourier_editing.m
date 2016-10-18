% Rocket Fourier
% Creates and plots a fourier sine series with variable number of terms for
% MA 441 rocket data

clear;
clc;


% Load data
Data = xlsread('Rocket_Data');

% Calculate first 100 coefficients
%Coeffs = zeros(3,101);
Coeffs=[];

for n = 0:10
    
    % Treat term 0 differently
    if n == 0
        
        % Take the average of the data as a0
        a = sum(Data(:,1)) / length(Data);
        ac = a;
        
        % Set b0 as 0
        b = 0;
        
    else
        a = 0;
        b = 0;

        for t = 2:length(Data)
            
            % Take the integral of the data's periodic extension multiplied
            % by cos(n*pi*x/L) from 850 to 900
             a = a + Data(t,1) * cos(n*pi()*Data(t,2)/50) * (Data(t,2) - Data(t-1,2));
             a = a + Data(t,1) * cos(n*pi()*(Data(t,2)-50)/50) * (Data(t,2) - Data(t-1,2));
            
            
            % Take the integral of the data's periodic extension multiplied
            % by sin(n*pi*x/L) from 850 to 900
             b = b + Data(t,1) * sin(n*pi()*Data(t,2)/50) * (Data(t,2) - Data(t-1,2));
             b = b + Data(t,1) * sin(n*pi()*(Data(t,2)-50)/50) * (Data(t,2) - Data(t-1,2));
            
                       
            % Take the integral of the data multiplied by cos(n*pi*x/L)
            ac = ac + Data(t,1) * cos(n*pi()*Data(t,2)/50) * (Data(t,2) - Data(t-1,2));
            
            
            
        end
        
        % Multiply by 2/L for the cosine series coefficients and 1/L for
        % the Fourier series
        ac = ac*2/50;
        a = a/50;
        b = b/50;

    end
    
    % Store coefficients in a matrix
    Coeffs(n+1, 1) = a;
    Coeffs(n+1, 2) = b;
    Coeffs(n+1, 3) = ac;
   

end
 Coeffs
 %Coeffs=[Coeffs(1,1:2),Coeffs(1,3);Coeffs(3,1:2),Coeffs(3,3);Coeffs(5,1:2),Coeffs(5,3);Coeffs(7,1:2),Coeffs(7,3);Coeffs(9,1:2),Coeffs(9,3);Coeffs(11,1:2),Coeffs(11,3);Coeffs(13,1:2),Coeffs(13,3);Coeffs(15,1:2),Coeffs(15,3);Coeffs(17,1:2),Coeffs(17,3);Coeffs(19,1:2),Coeffs(19,3)];
 Coeffs=Coeffs'

% Call simple GUI to select number of terms to plot
termselectorediting(Data, Coeffs)