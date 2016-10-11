% Rocket_Fourier_GUI
function termselector(Data, Coeffs)

% Create frame
frame = figure('Resize', 'Off');
set(frame,'MenuBar','none');
set(frame,'Name','Term Selector');
set(frame,'NumberTitle','off');
set(frame,'Position', [100,100,200,260])

% Create edit box to show number of terms
terms = uicontrol('Style', 'Edit', 'Units', 'Normalized', 'Position', [.4,.5,.2,.1], 'String', '10');

% Create button to plot fourier approximation
button = uicontrol('Style', 'Pushbutton', 'Units', 'Normalized', 'Position', [.3,.3,.4,.1], 'String', 'Plot Fourier');
set(button, 'Callback', {@forplotter, Data, Coeffs, terms})

% Create button to plot cosine approximation
button = uicontrol('Style', 'Pushbutton', 'Units', 'Normalized', 'Position', [.3,.1,.4,.1], 'String', 'Plot Cosine');
set(button, 'Callback', {@cosplotter, Data, Coeffs, terms})

end


% Callback for plot button
function forplotter(hObject, eventdata, Data, Coeffs, terms)

% Extract number of terms to plot
num = str2double(get(terms, 'String'));

% Calculate points to fit fourier approximation
ys = [];
for t = 850:.001:900
    y = Coeffs(1,1);
    for n = 2:num + 1;
        y = y + Coeffs(1,n) * cos(n*pi()*t/50) + Coeffs(2,n) * sin(n*pi()*t/50);
    end
    ys = [ys,y];
end
t = 850:.001:900;

% Create a new axes in a new frame
frame2 = figure('Resize', 'Off');
set(frame2,'MenuBar','none');
set(frame2,'Name','Plot');
set(frame2,'NumberTitle','off');
set(frame2,'Position', [300,300,400,300]);

% Plot fourier approximation and data
plot(Data(:,2),Data(:,1),t,ys)

end

% Callback for cosine plot button
function cosplotter(hObject, eventdata, Data, Coeffs, terms)

% Extract number of terms to plot
num = str2double(get(terms, 'String'));

% Calculate points to fit cosine approximation
ys = [];
for t = 850:.001:900
    y = Coeffs(3,1);
    for n = 2:num + 1;
        y = y + Coeffs(3,n) * cos(n*pi()*t/50);
    end
    ys = [ys,y];
end
t = 850:.001:900;

% Create a new axes in a new frame
frame2 = figure('Resize', 'Off');
set(frame2,'MenuBar','none');
set(frame2,'Name','Plot');
set(frame2,'NumberTitle','off');
set(frame2,'Position', [300,300,400,300]);

% Plot fourier approximation and data
plot(Data(:,2),Data(:,1),t,ys)

end