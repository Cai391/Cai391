function varargout = presentation(varargin)
% PRESENTATION MATLAB code for presentation.fig
%      PRESENTATION, by itself, creates a new PRESENTATION or raises the existing
%      singleton*.
%
%      H = PRESENTATION returns the handle to a new PRESENTATION or the handle to
%      the existing singleton*.
%
%      PRESENTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRESENTATION.M with the given input arguments.
%
%      PRESENTATION('Property','Value',...) creates a new PRESENTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before presentation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to presentation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help presentation

% Last Modified by GUIDE v2.5 13-Apr-2024 15:27:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @presentation_OpeningFcn, ...
                   'gui_OutputFcn',  @presentation_OutputFcn, ...
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


% --- Executes just before presentation is made visible.
function presentation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to presentation (see VARARGIN)
h1=[handles.axes1 handles.slider1 handles.pushbutton1 handles.listbox1...
    handles.edit2 handles.edit3 handles.edit6...
    handles.text2 handles.text4 handles.text6 handles.text7  handles.text8];
h2=[handles.axes2 handles.pushbutton2 handles.listbox2...
    handles.edit7 handles.edit8 handles.edit9 handles.edit10 handles.edit11...
    handles.text9 handles.text10 handles.text12 handles.text13  handles.text11];
set(h1,'visible','off')
set(h2,'visible','off')
% Choose default command line output for presentation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes presentation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = presentation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=get(handles.listbox1,'value');
a=str2double(get(handles.text8,'String'));%倾斜角度
v1=str2double(get(handles.edit2,'String'));%v1速度
v2=str2double(get(handles.edit3,'String'));%v2速度
d=str2double(get(handles.edit6,'String')); %激发点到交界面的垂直距离
switch n
    case 1
        x=0:0.01:100;
        t=x./v1;
    case 2
        %b=asin(v1/v2);
        x=0:0.01:100;
        t=sqrt(x.^2+4*d.^2+sin(a*pi/180)*4*d);
    case 3
        b=asin(v1/v2);
        if (b>0)
            x=2*d*v1/v2/cos(a+b):0.01:100;
            t=(x*sin(a*pi/180+b)+2*d*cos(b))/v1;
        end

end
plot(handles.axes1,x,t);
xlabel('Distance(km)');%X轴标签
ylabel('Time(s)');%Y轴标签

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(hObject,'Max',pi/4,'Min',-pi/4);
set(handles.text8,'string',get(hObject,'value')*90/pi)


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2double(get(handles.text8,'String'));%倾斜角度
v1=str2double(get(handles.edit2,'String'));%v1速度
v2=str2double(get(handles.edit3,'String'));%v2速度
d=str2double(get(handles.edit6,'String')); %激发点到交界面的垂距离
figure
x=0:0.01:100;
t=x./v1;
h1=plot(x,t,'r');
hold on
x=0:0.01:100;
t=sqrt(x.^2+4*d.^2+sin(a*pi/180)*4*d)./v1;
h2=plot(x,t,'b');
hold on
b=asin(v1/v2);
if (b>0)
    x=2*d*v1/v2/cos(a+b):0.01:100;
    t=(x*sin(a*pi/180+b)+2*d*cos(b))/v1;
end
h3=plot(x,t,'k');
hold off
legend([h1,h2,h3],'直达波','反射波','折射波')
xlabel('Distance(km)');%X轴标签
ylabel('Time(s)');%Y轴标签
title('地震波传播时距曲线');


% --------------------------------------------------------------------
function option_Callback(hObject, eventdata, handles)
% hObject    handle to option (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(presentation);

% --------------------------------------------------------------------
function type2_Callback(hObject, eventdata, handles)
% hObject    handle to type2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h1=[handles.axes1 handles.slider1 handles.pushbutton1 handles.listbox1...
    handles.edit2 handles.edit3 handles.edit6...
    handles.text2 handles.text4 handles.text6 handles.text7  handles.text8];
h2=[handles.axes2 handles.pushbutton2 handles.listbox2...
    handles.edit7 handles.edit8 handles.edit9 handles.edit10 handles.edit11...
    handles.text9 handles.text10 handles.text12 handles.text13  handles.text11];
set(h1,'visible','off')
set(h1,'visible','on')
set(h2,'visible','off')
% --------------------------------------------------------------------
function type3_Callback(hObject, eventdata, handles)
% hObject    handle to type3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h1=[handles.axes1 handles.slider1 handles.pushbutton1 handles.listbox1...
    handles.edit2 handles.edit3 handles.edit6...
    handles.text2 handles.text4 handles.text6 handles.text7  handles.text8];
h2=[handles.axes2 handles.pushbutton2 handles.listbox2...
    handles.edit7 handles.edit8 handles.edit9 handles.edit10 handles.edit11...
    handles.text9 handles.text10 handles.text12 handles.text13  handles.text11];
set(h1,'visible','off')
set(h2,'visible','on')
set(h1,'visible','off')


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


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
n=get(handles.listbox2,'value');
v1=str2double(get(handles.edit9,'String'));%v1速度
v2=str2double(get(handles.edit10,'String'));%v2速度
v3=str2double(get(handles.edit11,'String'));%v2速度
d=str2double(get(handles.edit7,'String')); %激发点到交界面的垂直距离
h=str2double(get(handles.edit8,'String')); %激发点到交界面的垂直距离
switch n
    case 1
        x=0:0.01:100;
        t=x./v1;
    case 2
        z=0:0.01:50;
        a=atan(z/d);
        b=asin(sin(a)*v1/v2);
        x=2*(z+h*tan(b));
        t=2*(sqrt(z.*z+d*d)/v1+h./cos(b)/v2);
    case 3
        b=asin(v2/v3);
        a=asin(v1/v2*sin(b));
        x=2*d*tan(a)+2*h*tan(b):0.01:100;
        t=x/v3+2*h*cos(b)/v2+2*d*cos(a)/v1;
end
plot(handles.axes2,x,t);
xlabel('Distance(km)');%X轴标签
ylabel('Time(s)');%Y轴标签

% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v1=str2double(get(handles.edit9,'String'));%v1速度
v2=str2double(get(handles.edit10,'String'));%v2速度
v3=str2double(get(handles.edit11,'String'));%v2速度
d=str2double(get(handles.edit7,'String')); %激发点到交界面的垂直距离
h=str2double(get(handles.edit8,'String')); %激发点到交界面的垂直距离
figure
x=0:0.01:100;
t=x./v1;
h1=plot(x,t,'r');
hold on
z=0:0.01:50;
a=atan(z/d);
b=asin(sin(a)*v1/v2);
x=2*(z+h*tan(b));
t=2*(sqrt(z.*z+d*d)/v1+h./cos(b)/v2);
h2=plot(x,t,'b');
hold on
b=asin(v2/v3);
a=asin(v1/v2*sin(b));
x=2*d*tan(a)+2*h*tan(b):0.01:100;
t=x/v3+2*h*cos(b)/v2+2*d*cos(a)/v1;
h3=plot(x,t,'k');
hold off
legend([h1,h2,h3],'直达波','反射波','折射波')
xlabel('Distance(km)');%X轴标签
ylabel('Time(s)');%Y轴标签
title('地震波传播时距曲线(V3>V2>V1)');
