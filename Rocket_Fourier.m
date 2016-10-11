% Rocket Fourier
% Creates and plots a fourier sine series with variable number of terms for
% MA 441 rocket data

% Load data
Data = xlsread('Rocket_Data');

% Calculate first 10 coefficients
Coeffs = zeros(2,11);
for n = 0:10
    
    % Treat term 0 differently
    if n == 0
        
        % Take the average of the data as a0
        a = sum(Data(:,1)) / length(Data);
        
        % Set b0 as 0
        b = 0;
        
    else
        a = 0;
        b = 0;
        time = 850;
        for t = 1:length(Data)
            
            % Take the integral of the data multiplied by sin(n*pi*x/L)
            a = a + Data(t,1) * cos(n*pi()*Data(t,2)/50) * (Data(t,2) - time);
            
            % Take the integral of the data multiplied by cos(n*pi*x/L)
            b = b + Data(t,1) * sin(n*pi()*Data(t,2)/50) * (Data(t,2) - time);
            
            time = Data(t,2);
            
        end
        
        % Multiply by 2/L
        a = a*2/50;
        b = b*2/50;
        
    end
    
    % Store coefficient in a matrix
    Coeffs(1, n+1) = a;
    Coeffs(2, n+1) = b;
    
end

% ys = [];
% for t = 850:.001:900
%     y = Coeffs(1,1);
%     for n = 2:11;
%         y = y + Coeffs(1,n) * cos(n*pi()*t/50); % + Coeffs(2,n) * sin(n*pi()*t/50);
%     end
%     ys = [ys,y];
% end
% t = 850:.001:900;
% 
% plot(Data(:,2),Data(:,1),t,ys)

% Call simple GUI to select number of terms to plot
termselector(Data, Coeffs)