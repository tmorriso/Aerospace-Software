function varargout = Assignment3GUI(varargin)
% ASSIGNMENT3GUI MATLAB code for Assignment3GUI.fig
%      ASSIGNMENT3GUI, by itself, creates a new ASSIGNMENT3GUI or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT3GUI returns the handle to a new ASSIGNMENT3GUI or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT3GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT3GUI.M with the given input arguments.
%
%      ASSIGNMENT3GUI('Property','Value',...) creates a new ASSIGNMENT3GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment3GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment3GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment3GUI

% Last Modified by GUIDE v2.5 12-Feb-2016 22:03:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment3GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment3GUI_OutputFcn, ...
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


% --- Executes just before Assignment3GUI is made visible.
function Assignment3GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment3GUI (see VARARGIN)

% Choose default command line output for Assignment3GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment3GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment3GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function PRN_Callback(hObject, eventdata, handles)
% hObject    handle to PRN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PRN as text
%        str2double(get(hObject,'String')) returns contents of PRN as a double


% --- Executes during object creation, after setting all properties.
function PRN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PRN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Sampling_Freq_Callback(hObject, eventdata, handles)
% hObject    handle to Sampling_Freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Sampling_Freq as text
%        str2double(get(hObject,'String')) returns contents of Sampling_Freq as a double


% --- Executes during object creation, after setting all properties.
function Sampling_Freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Sampling_Freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Intermediate_Freq_Callback(hObject, eventdata, handles)
% hObject    handle to Intermediate_Freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Intermediate_Freq as text
%        str2double(get(hObject,'String')) returns contents of Intermediate_Freq as a double


% --- Executes during object creation, after setting all properties.
function Intermediate_Freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Intermediate_Freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function msec_of_data_Callback(hObject, eventdata, handles)
% hObject    handle to msec_of_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of msec_of_data as text
%        str2double(get(hObject,'String')) returns contents of msec_of_data as a double


% --- Executes during object creation, after setting all properties.
function msec_of_data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msec_of_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Start_Processing.
function Start_Processing_Callback(hObject, eventdata, handles)
% hObject    handle to Start_Processing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PRN = str2num(get(handles.PRN, 'String'));
Sampling_Freq = str2num(get(handles.Sampling_Freq, 'String'));
Intermediate_Freq = str2num(get(handles.Intermediate_Freq, 'String'));
msec_of_data = str2num(get(handles.msec_of_data, 'String'));

%%first open the direct data file and get first block of data to work with
fid=fopen('GPSantennaUp.sim','rb');             %open binary file containing direct data
rawdat=(fread(fid,2000000,'schar'))';           %read in 2M samples
rawdat=rawdat(1:2:end)+ i .* rawdat(2:2:end);   %convert to complex IQ pairs
fclose(fid);                                    %close the file

%%first do satellite acqusition and get approx code phase/freq estimate
disp('Initiating GPS satellite acquisition...')

[handles.fq_est,handles.cp_est,handles.c_meas,handles.testmat]=acq4(PRN,Intermediate_Freq,9000,rawdat,Sampling_Freq,4,0);
disp(['  Acquisition Metric is: ',num2str(handles.c_meas(1)),' (should be >2.0)']); 
%refine the acqusition estimate to get better code phase/frequency
[handles.fq_est,handles.cp_est,handles.c_meas,handles.testmat]=acq4(PRN,handles.fq_est,400,rawdat,Sampling_Freq,10,0);
disp(['  Refined Acq Metric is: ',num2str(handles.c_meas(1)),' (should be >2.0)']); 

%%now do the main bistatic tracking/processing
handles.corrspacing=-28.1:0.05:1.1;
disp('Initiating GPS satellite signal tracking...')
[handles.e_i,handles.e_q,handles.p_i,handles.p_q,handles.l_i,handles.l_q,handles.carrierfq,handles.codefq] = ...
    gpstrackcorr(PRN, handles.cp_est, handles.fq_est, Sampling_Freq, handles.corrspacing, msec_of_data);

axes(handles.axes17)

plot(handles.p_i .^2 + handles.p_q .^ 2, 'g.-')
hold on
grid
plot(handles.e_i .^2 + handles.e_q .^ 2, 'bx-')
plot(handles.l_i .^2 + handles.l_q .^ 2, 'r+-')
hold off
xlabel('milliseconds')
ylabel('amplitude')
title('Correlation Results')
legend('prompt','early','late')

axes(handles.axes18)

plot(handles.p_i)
grid
xlabel('milliseconds')
ylabel('amplitude')
title('Prompt I Channel')

axes(handles.axes19)

plot(handles.p_q)
grid
xlabel('milliseconds')
ylabel('amplitude')
title('Prompt Q Channel')

axes(handles.axes20)

plot(1.023e6 - handles.codefq)
grid
xlabel('milliseconds')
ylabel('Hz')
title('Tracked Code Frequency (Deviation from 1.023MHz)')

axes(handles.axes21)

plot(handles.carrierfq)
grid
xlabel('milliseconds')
ylabel('Hz')
title('Tracked Intermediate Frequency')
guidata(hObject, handles);

function msec_to_Average_Callback(hObject, eventdata, handles)
% hObject    handle to msec_to_Average (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of msec_to_Average as text
%        str2double(get(hObject,'String')) returns contents of msec_to_Average as a double


% --- Executes during object creation, after setting all properties.
function msec_to_Average_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msec_to_Average (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Start_Animation.
function Start_Animation_Callback(hObject, eventdata, handles)
% hObject    handle to Start_Animation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% <<<<<<<<<<<<<<<<<<<><><><><><><><><><><><><><><><><><><><><><><><><><><><
%set avging - typical value is 200msec


avgnum = str2num(get(handles.msec_to_Average, 'String'));
%This script plots the important values in the GPS Bistatic processing 
%for the direct and reflected channels

%reflected spacings  (same as those used in processing)
spacing=-28.1:0.05:1.1; %recognize these spacings are reversed
[a,b]=size(spacing);
spacing2=spacing(find(spacing==(-spacing(end))):end);
[aa,bb]=size(spacing2);

%set filenames
fid1=fopen('OutDI.bin','rb');
fid2=fopen('OutDQ.bin','rb');
fid3=fopen('OutRI.bin','rb');
fid4=fopen('OutRQ.bin','rb');

%set avging - typical value is 200msec

%get the first set of data to initiate loop
contloop=1;
[corri,cnt]=fread(fid1,avgnum*bb,'float');
if (cnt ~= avgnum*bb)
    fclose all
    disp('got all the data possible corr_dir_in')
    contloop=0;
end
[corrq,cnt]=fread(fid2,avgnum*bb,'float');
if (cnt ~= avgnum*bb)
    fclose all
    disp('got all the data possible corr_dir_qd')
    contloop=0;
end
[corrii,cnt]=fread(fid3,avgnum*b,'float');
if (cnt ~= avgnum*b)
    fclose all
    disp('got all the data possible corr_rfct_in')
    contloop=0;
end
[corrqq,cnt]=fread(fid4,avgnum*b,'float');
if (cnt ~= avgnum*b)
    fclose all
    disp('got all the data possible corr_rfct_in')
    contloop=0;
end

loopcnt=1;
while (contloop==1) %infinite loop to continue while data in the files
    
    corri=reshape(corri,bb,avgnum);
    corrq=reshape(corrq,bb,avgnum);
    corrii=reshape(corrii,b,avgnum);
    corrqq=reshape(corrqq,b,avgnum);
    
    %----------------------------------------------------------------------
    
    coherent=0;  %set equal to 1 for coherent, or 0 for noncoherent
    if (coherent)
        for inda = 1:avgnum
            [signmax,signind]=max(abs(corri(:,inda)));
            if (corri(signind,inda) >= 0)
                %no need to do anything as already post
            else
                %flip sign to make it pos
                corri(:,inda) = -1 .* corri(:,inda);
                corrq(:,inda) = -1 .* corrq(:,inda);
                corrii(:,inda) = -1 .* corrii(:,inda);
                corrqq(:,inda) = -1 .* corrqq(:,inda);
            end
        end
        di2=sum((corri'));
        dq2=sum((corrq'));
        ri2=sum((corrii'));
        rq2=sum((corrqq'));
    else
        di2=sum(abs(corri'));
        dq2=sum(abs(corrq'));
        ri2=sum(abs(corrii'));
        rq2=sum(abs(corrqq'));
    end
    %----------------------------------------------------------------------
    
    %do the averaging
    %reorder
    di2=di2(bb:-1:1);
    dq2=dq2(bb:-1:1);
    d3=sqrt(di2 .* di2 + dq2 .* dq2);
    d3save(loopcnt,:)=d3;
    
    %find max and normalize
    ddmax=max(d3);
    di2=di2 ./ ddmax;
    dq2 = dq2 ./ ddmax;
    d3 = d3 ./ ddmax;
    
    %do avg
    %reorder
    ri2=ri2(b:-1:1);
    rq2=rq2(b:-1:1);
    r3=sqrt(ri2 .* ri2 + rq2 .* rq2);
    r3save(loopcnt,:)=r3;
    
    %find max and normalize
    rrmax=max(r3); %use for normalization
    [rrmaxrat,jj]=max(r3(66:b)); %use for max ratio
    ii=jj+55;
    ri2=ri2 ./ rrmax;
    rq2 = rq2 ./ rrmax;
    r3 = r3 ./ rrmax;
    
    %plot correlation results
    %figure(100)
    
    %direct signal
    dmin=min([di2 dq2]);
    d3min=min([d3]);
    
    axes(handles.axes22)
    
    plot(spacing2,di2,'r.');hold on
    plot(spacing2,di2,'c');hold off
    axis([(spacing2(1)-0.1) (spacing2(end)+0.1) (dmin-0.05) 1.05])
    title('direct (I)')
    
    axes(handles.axes23)
    
    plot(spacing2,dq2,'g.');hold on
    plot(spacing2,dq2,'c');hold off
    axis([(spacing2(1)-0.1) (spacing2(end)+0.1) (dmin-0.05) 1.05])
    title('direct (Q)')
    
    axes(handles.axes26)
    
    plot(spacing2,d3,'b.');hold on
    plot(spacing2,d3,'m');hold off
    axis([(spacing2(1)-0.1) (spacing2(end)+0.1) (d3min-0.05) 1.05])
    powerrat(loopcnt) = rrmaxrat / ddmax;
    
    %reflected signal
    title(['reflected/direct ratio: ',num2str(powerrat(loopcnt))])
    rmin=min([ri2 rq2]);
    r3min=min([r3]);
    
    axes(handles.axes24)
    
    plot(-spacing(end:-1:1),ri2,'r.');hold on
    plot(-spacing(end:-1:1),ri2,'c');hold off
    axis([(-spacing(end)-0.1) (-spacing(1)+0.1) (rmin-0.05) 1.05])
    title('reflect (I)')
    
    axes(handles.axes25)
    
    plot(-spacing(end:-1:1),rq2,'g.');hold on
    plot(-spacing(end:-1:1),rq2,'c');hold off
    axis([(-spacing(end)-0.1) (-spacing(1)+0.1)  (rmin-0.05) 1.05])
    title('reflect (Q)')
    
    axes(handles.axes27)
    
    plot(-spacing(end:-1:1),r3,'b.');hold on
    plot(-spacing(end:-1:1),r3,'m');hold off
    axis([(-spacing(end)-0.1) (-spacing(1)+0.1)  (r3min-0.05) 1.05])
    
    %set lower bound on where max can be, in case of direct creeping in
    spthresh=find(spacing > 0.75);
    lwbnd=spthresh(1);
    upbnd=b;
    pathdelay(loopcnt)=293*ii*0.05;
    title(['reflected composite; path delay of ',num2str(pathdelay(loopcnt),6),'m '])
    xlabel(['time elapsed : ',num2str(loopcnt*avgnum/(60*1000),4),' min; Int#:',int2str(loopcnt)])
    
    [corri,cnt]=fread(fid1,avgnum*bb,'float');
    if (cnt ~= avgnum*bb)
        disp('  got all the data possible corr_dir_in')
        contloop=0;
    end
    [corrq,cnt]=fread(fid2,avgnum*bb,'float');
    if (cnt ~= avgnum*bb)
        disp('  got all the data possible corr_dir_qd')
        contloop=0;
    end
    [corrii,cnt]=fread(fid3,avgnum*b,'float');
    if (cnt ~= avgnum*b)
        disp('  got all the data possible corr_rfct_in')
        contloop=0;
    end
    [corrqq,cnt]=fread(fid4,avgnum*b,'float');
    if (cnt ~= avgnum*b)
        disp('  got all the data possible corr_rfct_in')
        contloop=0;
    end
    loopcnt = loopcnt +1 ;
    
    pause(0.001)
end
loopcnt=loopcnt-1;  %adjust for not doing one last iteration


%draw fig of path delay as function of time
figure(200)
subplot(2,1,1),plot((1:loopcnt)*(avgnum/1000),pathdelay,'c');hold on
subplot(2,1,1),plot((1:loopcnt)*(avgnum/1000),pathdelay,'c.');
title(['Estimated Path Delay for Reflected Signal (',int2str(avgnum),' msec avg)'])
ylabel('meters')
xlabel('seconds')
grid
subplot(2,1,2),plot((1:loopcnt)*(avgnum/1000),powerrat,'b.');hold on
subplot(2,1,2),plot((1:loopcnt)*(avgnum/1000),powerrat,'g');hold off
title(['Amplitude Ratio ((reflected max)/(direct max))'])
ylabel('ratio')
xlabel('seconds')
grid
fclose all;


% --- Executes during object creation, after setting all properties.
function axes34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes34
axes(hObject)
imshow('Texas.jpg')


% --- Executes during object creation, after setting all properties.
function axes35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes35
axes(hObject)
imshow('Texas.jpg')
