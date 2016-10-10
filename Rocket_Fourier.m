% Rocket Fourier
% Creates and plots a fourier sine series with variable number of terms for
% MA 441 rocket data

% Load data
Data = xlsread(Rocket_Data);

% Calculate first 10 coefficients
Coeffs = zeros(2,10);
for n = 0:10
    
    % Treat term 0 differently
    if n == 0
        
        % Take the average of the data as a0
        a = sum(Data(:,1) / length(Data);
        
        % Set b0 as 0
        b = 0;
        
    else
        
        for t = 1:length(data)
            
            % Take the integral of the data multiplied by sin(n*pi*x/L)
            
            
            % Take the integral of the data multiplied by cos(n*pi*x/L)
            
        end
        
        % Multiply by 2/L
        
    end
    
    % Store coefficient in a matrix
    
end

% Call simple GUI to select number of terms to plot