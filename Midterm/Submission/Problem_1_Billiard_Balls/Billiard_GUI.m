function varargout = Billiard_GUI(varargin)
% BILLIARD_GUI MATLAB code for Billiard_GUI.fig
%      BILLIARD_GUI, by itself, creates a new BILLIARD_GUI or raises the existing
%      singleton*.
%
%      H = BILLIARD_GUI returns the handle to a new BILLIARD_GUI or the handle to
%      the existing singleton*.
%
%      BILLIARD_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BILLIARD_GUI.M with the given input arguments.
%
%      BILLIARD_GUI('Property','Value',...) creates a new BILLIARD_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Billiard_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Billiard_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Billiard_GUI

% Last Modified by GUIDE v2.5 18-Mar-2016 22:57:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Billiard_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Billiard_GUI_OutputFcn, ...
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


% --- Executes just before Billiard_GUI is made visible.
function Billiard_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Billiard_GUI (see VARARGIN)

% Choose default command line output for Billiard_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Billiard_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Billiard_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function B1X_Callback(hObject, eventdata, handles)
% hObject    handle to B1X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B1X as text
%        str2double(get(hObject,'String')) returns contents of B1X as a double


% --- Executes during object creation, after setting all properties.
function B1X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B1X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B1Y_Callback(hObject, eventdata, handles)
% hObject    handle to B1Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B1Y as text
%        str2double(get(hObject,'String')) returns contents of B1Y as a double


% --- Executes during object creation, after setting all properties.
function B1Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B1Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B1VX_Callback(hObject, eventdata, handles)
% hObject    handle to B1VX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B1VX as text
%        str2double(get(hObject,'String')) returns contents of B1VX as a double


% --- Executes during object creation, after setting all properties.
function B1VX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B1VX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B1VY_Callback(hObject, eventdata, handles)
% hObject    handle to B1VY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B1VY as text
%        str2double(get(hObject,'String')) returns contents of B1VY as a double


% --- Executes during object creation, after setting all properties.
function B1VY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B1VY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r as text
%        str2double(get(hObject,'String')) returns contents of r as a double


% --- Executes during object creation, after setting all properties.
function r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function N_Callback(hObject, eventdata, handles)
% hObject    handle to N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N as text
%        str2double(get(hObject,'String')) returns contents of N as a double


% --- Executes during object creation, after setting all properties.
function N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B2X_Callback(hObject, eventdata, handles)
% hObject    handle to B2X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B2X as text
%        str2double(get(hObject,'String')) returns contents of B2X as a double


% --- Executes during object creation, after setting all properties.
function B2X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B2X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B2Y_Callback(hObject, eventdata, handles)
% hObject    handle to B2Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B2Y as text
%        str2double(get(hObject,'String')) returns contents of B2Y as a double


% --- Executes during object creation, after setting all properties.
function B2Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B2Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B2VX_Callback(hObject, eventdata, handles)
% hObject    handle to B2VX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B2VX as text
%        str2double(get(hObject,'String')) returns contents of B2VX as a double


% --- Executes during object creation, after setting all properties.
function B2VX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B2VX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B2VY_Callback(hObject, eventdata, handles)
% hObject    handle to B2VY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B2VY as text
%        str2double(get(hObject,'String')) returns contents of B2VY as a double


% --- Executes during object creation, after setting all properties.
function B2VY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B2VY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c_e_Callback(hObject, eventdata, handles)
% hObject    handle to c_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_e as text
%        str2double(get(hObject,'String')) returns contents of c_e as a double


% --- Executes during object creation, after setting all properties.
function c_e_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in drop.
function drop_Callback(hObject, eventdata, handles)
% hObject    handle to drop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns drop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from drop


% --- Executes during object creation, after setting all properties.
function drop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to drop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RUN.
function RUN_Callback(hObject, eventdata, handles)
% hObject    handle to RUN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






function plot1_Callback(hObject, eventdata, handles)
% hObject    handle to plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of plot1 as text
%        str2double(get(hObject,'String')) returns contents of plot1 as a double


function Plot2_Callback(hObject, eventdata, handles)
% hObject    handle to Plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Plot2 as text
%        str2double(get(hObject,'String')) returns contents of Plot2 as a double


% --- Executes during object creation, after setting all properties.
function Plot2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Plot3_Callback(hObject, eventdata, handles)
% hObject    handle to Plot3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Plot3 as text
%        str2double(get(hObject,'String')) returns contents of Plot3 as a double


% --- Executes during object creation, after setting all properties.
function Plot3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Plot3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plot_1.
function plot_1_Callback(hObject, eventdata, handles)
% hObject    handle to plot_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B1X = str2num(get(handles.B1X, 'String'));
B1Y = str2num(get(handles.B1Y, 'String'));
B1VX = str2num(get(handles.B1VX, 'String'));
B1VY = str2num(get(handles.B1VY, 'String'));
% Ball 2
B2X = str2num(get(handles.B2X, 'String'));
B2Y = str2num(get(handles.B2Y, 'String'));
B2VX = str2num(get(handles.B2VX, 'String'));
B2VY = str2num(get(handles.B2VY, 'String'));
% Other inputs
c_e = str2num(get(handles.c_e, 'String'));
r = str2num(get(handles.r, 'String'));
N = str2num(get(handles.N, 'String'));

x1_0 = [B1X B1Y];
x2_0 = [B2X B2Y];
v1_0 = [B1VX B1VY];
v2_0 = [B2VX B2VY];

[t,x1,x2]=billiards(x1_0, x2_0, v1_0,v2_0, r, c_e, N);
      
axes(handles.axes1)
        % plot1
        
        plot(x1(:,1), x1(:,2), 'b--o',...
            'LineWidth' ,2,...
            'MarkerSize',360*r,...
            'MarkerEdgeColor','b')
            
        set(gca, 'XLim', [0 ,1], 'YLim', [0,1]);
        title(' Ball 1 ');
        xlabel(' X - Position');
        ylabel(' Y - Position');
guidata(hObject, handles);
% --- Executes on button press in Plot_2.
function Plot_2_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B1X = str2num(get(handles.B1X, 'String'));
B1Y = str2num(get(handles.B1Y, 'String'));
B1VX = str2num(get(handles.B1VX, 'String'));
B1VY = str2num(get(handles.B1VY, 'String'));
% Ball 2
B2X = str2num(get(handles.B2X, 'String'));
B2Y = str2num(get(handles.B2Y, 'String'));
B2VX = str2num(get(handles.B2VX, 'String'));
B2VY = str2num(get(handles.B2VY, 'String'));
% Other inputs
c_e = str2num(get(handles.c_e, 'String'));
r = str2num(get(handles.r, 'String'));
N = str2num(get(handles.N, 'String'));

x1_0 = [B1X B1Y];
x2_0 = [B2X B2Y];
v1_0 = [B1VX B1VY];
v2_0 = [B2VX B2VY];

[t,x1,x2]=billiards(x1_0, x2_0, v1_0,v2_0, r, c_e, N);
      
axes(handles.axes2)
        % plot1
        
         
        plot(x2(:,1), x2(:,2), 'g--o',...
            'LineWidth' ,2,...
            'MarkerSize',360*r,...
            'MarkerEdgeColor','g')
        set(gca, 'XLim', [0 ,1], 'YLim', [0,1]);
        title(' Ball 2 ');
        xlabel(' X - Position');
        ylabel(' Y - Position');
guidata(hObject, handles);

  
% --- Executes on button press in Plot_3.
function Plot_3_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B1X = str2num(get(handles.B1X, 'String'));
B1Y = str2num(get(handles.B1Y, 'String'));
B1VX = str2num(get(handles.B1VX, 'String'));
B1VY = str2num(get(handles.B1VY, 'String'));
% Ball 2
B2X = str2num(get(handles.B2X, 'String'));
B2Y = str2num(get(handles.B2Y, 'String'));
B2VX = str2num(get(handles.B2VX, 'String'));
B2VY = str2num(get(handles.B2VY, 'String'));
% Other inputs
c_e = str2num(get(handles.c_e, 'String'));
r = str2num(get(handles.r, 'String'));
N = str2num(get(handles.N, 'String'));

x1_0 = [B1X B1Y];
x2_0 = [B2X B2Y];
v1_0 = [B1VX B1VY];
v2_0 = [B2VX B2VY];

[t,x1,x2]=billiards(x1_0, x2_0, v1_0,v2_0, r, c_e, N);
      
axes(handles.axes3)
        % plot'LineWidth' ,2,'MarkerSize',150*r,'MarkerEdgeColor','g','LineWidth' ,2,'MarkerSize',150*r,'MarkerEdgeColor','b'
        
        plot(x2(:,1), x2(:,2), 'g--o',x1(:,1), x1(:,2), 'b--o', 'LineWidth' ,2,'MarkerSize',360*r)%
        %plot(x1(:,1), x1(:,2), 'b--o','LineWidth' ,2,'MarkerSize',150*r,'MarkerEdgeColor','b')
        set(gca, 'XLim', [0 ,1], 'YLim', [0,1]);
        title(' Ball 1 and 2 ');
        xlabel(' X - Position');
        ylabel(' Y - Position');
        guidata(hObject, handles);


% --- Executes on button press in Animate.
function Animate_Callback(hObject, eventdata, handles)
% hObject    handle to Animate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B1X = str2num(get(handles.B1X, 'String'));
B1Y = str2num(get(handles.B1Y, 'String'));
B1VX = str2num(get(handles.B1VX, 'String'));
B1VY = str2num(get(handles.B1VY, 'String'));
% Ball 2
B2X = str2num(get(handles.B2X, 'String'));
B2Y = str2num(get(handles.B2Y, 'String'));
B2VX = str2num(get(handles.B2VX, 'String'));
B2VY = str2num(get(handles.B2VY, 'String'));
% Other inputs
c_e = str2num(get(handles.c_e, 'String'));
r = str2num(get(handles.r, 'String'));
N = str2num(get(handles.N, 'String'));

x1_0 = [B1X B1Y];
x2_0 = [B2X B2Y];
v1_0 = [B1VX B1VY];
v2_0 = [B2VX B2VY];

[t,x1,x2]=billiards(x1_0, x2_0, v1_0,v2_0, r, c_e, N);
figure
for i = 1:size(x1)
    if t(i) ~= t(end)
        p =.7*(t(i+1)-t(i));
    end  
  pause(p)  
  circle(x2(i,1),x2(i,2),r)
  hold on
  circle(x1(i,1),x1(i,2),r)
  hold off
end
