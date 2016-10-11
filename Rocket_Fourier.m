% Rocket Fourier
% Creates and plots a fourier sine series with variable number of terms for
% MA 441 rocket data

% Load data
Data = xlsread('Rocket_Data');

% Calculate first 100 coefficients
Coeffs = zeros(3,101);
for n = 0:100
    
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
        time = 850;
        for t = 1:length(Data)
            
            % Take the integral of the data's periodic extension multiplied
            % by cos(n*pi*x/L) from 800 to 900
            a = a + Data(t,1) * cos(n*pi()*Data(t,2)/50) * (Data(t,2) - time);
            a = a + Data(t,1) * cos(n*pi()*(Data(t,2)-50)/50) * (Data(t,2) - time);
            
            % Take the integral of the data's periodic extension multiplied
            % by sin(n*pi*x/L) from 800 to 900
            b = b + Data(t,1) * sin(n*pi()*Data(t,2)/50) * (Data(t,2) - time);
            b = b + Data(t,1) * sin(n*pi()*(Data(t,2)-50)/50) * (Data(t,2) - time);
            
            time = Data(t,2);
            
        end
        
        time = 850;
        for t = 1:length(Data)
            
            % Take the integral of the data multiplied by cos(n*pi*x/L)
            ac = ac + Data(t,1) * cos(n*pi()*Data(t,2)/50) * (Data(t,2) - time);
            
            time = Data(t,2);
        end
        
        % Multiply by 2/L for the cosine series coefficients and 1/L for
        % the Fourier series
        ac = ac*2/50;
        a = a/50;
        b = b/50;
        
    end
    
    % Store coefficients in a matrix
    Coeffs(1, n+1) = a;
    Coeffs(2, n+1) = b;
    Coeffs(3, n+1) = ac;
    
end

% Call simple GUI to select number of terms to plot
termselector(Data, Coeffs)