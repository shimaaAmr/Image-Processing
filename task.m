function varargout = task(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @task_OpeningFcn, ...
                   'gui_OutputFcn',  @task_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before task is made visible.
function task_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes task wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = task_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
set (handles.axes8,'visible','on')



% --- Executes on button press in pushbutton1.to import image1
function pushbutton1_Callback(hObject, eventdata, handles)

a=uigetfile({'*.jpg','*.png'})
filename=a;
setappdata(0,'filename',filename);
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)
setappdata(0,'filename',a);
plot(handles.axes1,'a')

% --- Executes on button press in pushbutton2.to import image2
function pushbutton80_Callback(hObject, eventdata, handles)
    
b=uigetfile({'*.jpg','*.png'})
filename=b;
setappdata(0,'filename',filename);
b=imread(b);
axes(handles.axes8);
imshow(b);
setappdata(0,'b',b)
setappdata(0,'filename',b);
plot(handles.axes8,'b')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_bw=im2bw(a,.57);
axes(handles.axes3);
imshow(a_bw)
setappdata(0,'filename',a_bw);

% --- Executes on button press in pushbutton3.for gray fun.1
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=getappdata(0,'a');
a_gray=GrayScaleLum(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.to reset
function pushbutton5_Callback(hObject, eventdata, handles)

a=imread('tt.jpg');
imshow(a);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.to exit the app
function pushbutton7_Callback(hObject, eventdata, handles)
msgbox('thanks for using image processing tool')
pause(1)
close();
close();


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes3)
imhist(input)



% --- Executes on button press in pushbutton41.hsitogram
function pushbutton41_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=Histogram(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
bar(a_gray);



% --- Executes on button press in pushbutton42.Contrast
function pushbutton42_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
prompt={'newmin','newmax'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray=Contrast_Gray(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)



% --- Executes on button press in pushbutton45.HistoMatching
function pushbutton45_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
b=getappdata(0,'b');
[a_gray,col1]=HistoMatch(a);
[b_gray,col2]=HistoMatch(b);
a_gray2=HistoMatch(a,col1,col2);
setappdata(0,'filename',a_gray2);
axes(handles.axes3); 
imshow(a_gray2);


% --- Executes on button press in pushbutton46.HistoEqualization
function pushbutton46_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
[a_gray,colr]=HistoEqualization(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in pushbutton47.Power_Law
function pushbutton47_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter gama'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=Power_Law(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)

% --- Executes on button press in pushbutton48.add_Images
function pushbutton48_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
b=getappdata(0,'b');
a_gray=add_Images(a,b);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)



% --- Executes on button press in pushbutton49.sub_Images
function pushbutton49_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
b=getappdata(0,'b');
a_gray=sub_Images(a,b);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton50.ImageNegative
function pushbutton50_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=ImageNegative(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)

% --- Executes on button press in pushbutton51.Quentzation
function pushbutton51_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter k'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=Quentzation(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)
% --- Executes on button press in pushbutton52.filter_mean
function pushbutton52_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter nunmask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_mean(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)

% --- Executes on button press in pushbutton53.weighted_Gaussian_filterbysegma
function pushbutton53_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter segma'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_Weighted_Guassian1(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in pushbutton54.filter_min
function pushbutton54_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter nunmask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_min(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton56.filter_max
function pushbutton56_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter nunmask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_max(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton57.filter_median
function pushbutton57_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter nunmask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=filter_median(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)

% --- Executes on button press in pushbutton58.Mid_point_Filter
function pushbutton58_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=Mid_point_Filter(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton59.sobel
function pushbutton59_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
a_gray=avrg_sobel(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);

% --- Executes on button press in pushbutton61.revers1D
function pushbutton61_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter multiple of width','enter multiple of heigth'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray=revers1D(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)



% --- Executes on button press in pushbutton62.GrayScaleDes
function pushbutton62_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=GrayScaleDes(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton63.GrayScaleAvr
function pushbutton63_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=GrayScaleAvr(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton64.GrayScaleDeco
function pushbutton64_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=GrayScaleDeco(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)

% --- Executes on button press in pushbutton65.EdgeDectectionCanny
function pushbutton65_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=EdgeDectectionCanny(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton66.edge_detect
function pushbutton66_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=edge_detect(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton67.sharp_detect
function pushbutton67_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=sharp_detect(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)



% --- Executes on button press in pushbutton68.
function pushbutton68_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=UnSharpen(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton69.ideal_LPF
function pushbutton69_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter D0'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=ideal_LPF(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton70.ideal_HPF
function pushbutton70_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter D0'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=ideal_HPF(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton71.butterworth_LPF
function pushbutton71_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter D0','enter n'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray=butterworth_LPF(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);

% --- Executes on button press in pushbutton72.butterworth_HPF
function pushbutton72_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter D0','enter n'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray=butterworth_HPF(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in pushbutton73.gaussian_HPF
function pushbutton73_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter D0'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=gaussian_HPF(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);

% --- Executes on button press in pushbutton74.gaussian_LPF
function pushbutton74_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter D0'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=gaussian_LPF(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in pushbutton75.salt & pepper
function pushbutton75_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
a_gray=imnoise(a,'salt & pepper',0.02);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% --- Executes on button press in pushbutton76.gaussian
function pushbutton76_Callback(hObject, eventdata, handles)
hh=getappdata(0,'a');
a_gray=imnoise(hh,'gaussian',0.07);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)




% --- Executes on button press in pushbutton79.Brightness
function pushbutton79_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter offsent'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=Brightness(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)




% --- Executes on button press in pushbutton81.direct_resize
function pushbutton81_Callback(hObject, eventdata, handles)
a=getappdata(0,'a');
prompt={'enter numsize'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=DM_0L(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text3.
function text3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DM1.
function DM1_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
prompt={'enter factor'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=DM_1Order(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% hObject    handle to DM1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton84.
function pushbutton84_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pushbutton84

a = getappdata(0,'a');
prompt={'enter numsize'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray = DM_0L(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);

% --- Executes on button press in pushbutton85.
function pushbutton85_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = getappdata(0,'a');
prompt={'enter multiple of height','enter multiple of width'};
dlg_title='input';
num_lines=1;
def={'',''};
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray = RM_0_order(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)





% --- Executes on button press in pushbutton86.
function pushbutton86_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0,'a');
prompt={'enter numsize'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray = DM_1Order(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);




% --- Executes on button press in pushbutton87.
function pushbutton87_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
a_gray=convert_to_gray(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


% hObject    handle to pushbutton87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton88.
function pushbutton88_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton88 (see GCBO)

% Prompt the user to enter the number of color channels
prompt = {'Enter the number of color channels (1 for red, 2 for green, 3 for blue)'};
dlgtitle = 'Color Channel Selection';
dims = [1 35];
definput = {'2'}; % Default value is 2 (green channel)
answer = inputdlg(prompt,dlgtitle,dims,definput);

if isempty(answer)
    % User clicked cancel or closed the dialog
    return;
end

% Convert the input to a number
color_channel = str2double(answer{1});

% Check if the input is valid (1, 2, or 3)
if isnan(color_channel) || ~ismember(color_channel, [1, 2, 3])
    errordlg('Invalid input! Please enter 1, 2, or 3.', 'Error', 'modal');
    return;
end

% Get the image data
a = getappdata(0, 'a');

% Convert the image to grayscale using the specified color channel
a_gray = grayy(a, color_channel);

% Set the grayscale image as the filename
setappdata(0, 'filename', a_gray);

% Display the grayscale image in axes3
axes(handles.axes3); 
imshow(a_gray);


% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the selected option from the popup menu
%selected_option = get(hObject, 'Value');




% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

 function popupmenu4_Callback(hObject, eventdata, handles)




% Callback function for popupmenu4 during creation
function popupmenu4_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to popupmenu4 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: popupmenu controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    
end



function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on selection change in popupmenu7
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



    function pushbutton89_Callback(hObject, eventdata, handles)
    % Get the window size from the user
 a=getappdata(0,'a');
a_gray= weightedFilter(a);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)



function pushbutton90_Callback(hObject, eventdata, handles)
  a=getappdata(0,'a');
prompt={'enter mask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=weightedFilter(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);








% --- Executes on button press in pushbutton91.
function pushbutton91_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
prompt={'enter mask'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
a_gray=geometric_mean_filter(a,x);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in pushbutton92.
function pushbutton92_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get the selected option from the popup menu
selected_option = get(handles.popupmenu7, 'Value');

% Retrieve image 'a' from the app data
a = getappdata(0, 'a');

% Perform actions based on the selected option
switch selected_option
    case 1 % Quentzation
        prompt = {'Enter k:'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {''};
        answer = inputdlg(prompt, dlg_title, num_lines, def);
        x = str2double(answer{1});
        a_gray = Quentzation(a, x);
    case 2 % Unsharp mask
        a_gray = UnSharpen(a);
    case 3 % Sharpness detection
        a_gray = sharp_detect(a);
    case 4 % Edge detection
        a_gray = edge_detect(a);
   
    otherwise
        % Handle other cases if needed
        return;
end

% Set the processed image as the filename in the app data
setappdata(0, 'filename', a_gray);

% Display the processed image in axes3
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in pushbutton94.
function pushbutton94_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the selected option from the popup menu
selected_option = get(handles.popupmenu2, 'Value');

% Get the image data
a = getappdata(0, 'a');

% Perform actions based on the selected option
switch selected_option
    case 1 % Single color channel
        % Prompt the user to enter the number of color channels
        prompt = {'Enter the number of color channels (1 for red, 2 for green, 3 for blue)'};
        dlgtitle = 'Color Channel Selection';
        dims = [1 35];
        definput = {'2'}; % Default value is 2 (green channel)
        answer = inputdlg(prompt, dlgtitle, dims, definput);

        if isempty(answer)
            % User clicked cancel or closed the dialog
            return;
        end

        % Convert the input to a number
        color_channel = str2double(answer{1});

        % Check if the input is valid (1, 2, or 3)
        if isnan(color_channel) || ~ismember(color_channel, [1, 2, 3])
            errordlg('Invalid input! Please enter 1, 2, or 3.', 'Error', 'modal');
            return;
        end

        % Convert the image to grayscale using the specified color channel
        a_gray = grayy(a, color_channel);

    case 2 % Averaging
        a_gray = GrayScaleAvr(a);

    case 3 % Desaturation
        a_gray = GrayScaleDes(a);

    case 4 % Decomposing
        a_gray = GrayScaleDeco(a);

    otherwise
        % Handle other cases if needed
        return;
end

% Set the grayscale image as the filename
setappdata(0, 'filename', a_gray);

% Display the grayscale image in axes3
axes(handles.axes3); 
imshow(a_gray);


% --- Executes on button press in pushbutton93.
function pushbutton93_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selected_option = get(handles.popupmenu3, 'Value');

a = getappdata(0, 'a');

% Perform actions based on the selected option
switch selected_option
    case 1 % Direct Mapping Zero Order
        % Prompt the user to enter the numsize
        prompt = {'Enter numsize:'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {''};
        answer = inputdlg(prompt, dlg_title, num_lines, def);

        if isempty(answer)
            % User clicked cancel or closed the dialog
            return;
        end

        % Convert the input to a number
        numsize = str2double(answer{1});

        % Call the DM_0L function
        a_gray = DM_0L(a, numsize);

    case 2 % Direct Mapping One Order
        % Prompt the user to enter the numsize
        prompt = {'Enter numsize:'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {''};
        answer = inputdlg(prompt, dlg_title, num_lines, def);

        if isempty(answer)
            % User clicked cancel or closed the dialog
            return;
        end

        % Convert the input to a number
        numsize = str2double(answer{1});

        % Call the DM_1Order function
        a_gray = DM_1Order(a, numsize);

    case 3 % Reverse Mapping Zero Order
        % Prompt the user to enter the multiples of width and height
        prompt={'enter multiple of height','enter multiple of width'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {'', ''};
        answer = inputdlg(prompt, dlg_title, num_lines, def);

        if isempty(answer)
            % User clicked cancel or closed the dialog
            return;
        end

        % Convert the inputs to numbers
        width_multiple = str2double(answer{1});
        height_multiple = str2double(answer{2});

        % Call the RM_0_order function
        a_gray = RM_0_order(a, width_multiple, height_multiple);

    case 4 % Reverse Mapping One Order
        % Prompt the user to enter the multiples of width and height
        prompt={'enter multiple of height','enter multiple of width'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {'', ''};
        answer = inputdlg(prompt, dlg_title, num_lines, def);

        if isempty(answer)
            % User clicked cancel or closed the dialog
            return;
        end

        % Convert the inputs to numbers
        width_multiple = str2double(answer{1});
        height_multiple = str2double(answer{2});

        % Call the revers1D function
        a_gray = revers1D(a, width_multiple, height_multiple);

    otherwise
        % Handle other cases if needed
        return;
end

% Set the grayscale image as the filename
setappdata(0, 'filename', a_gray);

% Display the grayscale image in axes3
axes(handles.axes3); 
imshow(a_gray);

% --- Executes on button press in pushbutton96.
function pushbutton96_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get the selected option from the popup menu
selected_option = get(handles.popupmenu5, 'Value');

% Retrieve images from the app data
a = getappdata(0, 'a');
b = getappdata(0, 'b');

% Perform actions based on the selected option
switch selected_option
    case 1 % Add images
        a_gray = add_Images(a, b);
    case 2 % Subtract images
        a_gray = sub_Images(a, b);
    case 3 % Image negative
        a_gray = ImageNegative(a);
    otherwise
        % Handle other cases if needed
        return;
end

% Set the processed image as the filename in the app data
setappdata(0, 'filename', a_gray);

% Display the processed image in axes3
axes(handles.axes3); 
imshow(a_gray);
% --- Executes on button press in pushbutton95.
function pushbutton95_Callback(hObject, eventdata, handles)
    % hObject    handle to popupmenu4 (see GCBO)
selected_option = get(handles.popupmenu4, 'Value');

% Get the image data
a = getappdata(0, 'a');

% Perform actions based on the selected option
switch selected_option
    case 1 % Draw Histogram
        a_gray = Histogram(a);
        setappdata(0, 'filename', a_gray);
        axes(handles.axes3); 
        bar(a_gray);

    case 2 % Adjust Brightness and Contrast
   
a=getappdata(0,'a');
prompt={'newmin','newmax'};
dlg_title='input';
num_lines=1;
def={'',''}
answer=inputdlg(prompt,dlg_title,num_lines,def);
x=str2num(answer{1});
y=str2num(answer{2});
a_gray=Contrast(a,x,y);
setappdata(0,'filename',a_gray);
axes(handles.axes3); 
imshow(a_gray)


        case 3 % Power-law transformation
            prompt = {'Enter gamma value:'};
            dlg_title = 'Input';
            num_lines = 1;
            def = {''};
            answer = inputdlg(prompt, dlg_title, num_lines, def);
            gamma = str2double(answer{1});
            a_gray = Power_Law(a, gamma);
            setappdata(0, 'filename', a_gray);
            axes(handles.axes3); 
            imshow(a_gray);

        case 4 % Histogram equalization
            [a_gray, ~] = HistoEqualization(a);
            setappdata(0, 'filename', a_gray);
            axes(handles.axes3); 
            imshow(a_gray);
case 5 % Histogram matching
    % Assuming 'a' and 'b' are the images you want to match histograms
    a = getappdata(0, 'a');
    b = getappdata(0, 'b');

    % Call histogram matching function
    matched_image = histogram_match(a, b);

    % Display the matched image in axes3
    axes(handles.axes3);
    imshow(matched_image);

end

% hObject    handle to pushbutton95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton97.
function pushbutton97_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get the selected option from the popup menu
selected_option = get(handles.popupmenu6, 'Value');

% Retrieve image 'a' from the app data
a = getappdata(0, 'a');

% Perform actions based on the selected option
switch selected_option
    case 1 % Median filter
        prompt = {'Enter mask size:'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {''};
        answer = inputdlg(prompt, dlg_title, num_lines, def);
        x = str2double(answer{1});
        a_gray = filter_median(a, x);
    case 2 % Mid-point filter
        a_gray = Mid_point_Filter(a);
    case 3 % Mean filter
        prompt = {'Enter mask size:'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {''};
        answer = inputdlg(prompt, dlg_title, num_lines, def);
        x = str2double(answer{1});
        a_gray = filter_mean(a, x);
    case 4 % Maximum filter
        prompt = {'Enter mask size:'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {''};
        answer = inputdlg(prompt, dlg_title, num_lines, def);
        x = str2double(answer{1});
        a_gray = filter_max(a, x);
    case 5 % Minimum filter
        prompt = {'Enter mask size:'};
        dlg_title = 'Input';
        num_lines = 1;
        def = {''};
        answer = inputdlg(prompt, dlg_title, num_lines, def);
        x = str2double(answer{1});
        a_gray = filter_min(a, x);
        
        case 6 %  filter
      a_gray=weightedFilter(a);
      axes (handles.axes3); 
      imshow (a_gray);
        
    otherwise
        % Handle other cases if needed
        return;
end

% Set the processed image as the filename in the app data
setappdata(0, 'filename', a_gray);

% Display the processed image in axes3
axes(handles.axes3); 
imshow(a_gray);


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
