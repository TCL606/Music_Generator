function varargout = music_gui(varargin)
% MUSIC_GUI MATLAB code for music_gui.fig
%      MUSIC_GUI, by itself, creates a new MUSIC_GUI or raises the existing
%      singleton*.
%
%      H = MUSIC_GUI returns the handle to a new MUSIC_GUI or the handle to
%      the existing singleton*.
%
%      MUSIC_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MUSIC_GUI.M with the given input arguments.
%
%      MUSIC_GUI('Property','Value',...) creates a new MUSIC_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before music_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to music_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help music_gui

% Last Modified by GUIDE v2.5 16-Jul-2022 20:40:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @music_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @music_gui_OutputFcn, ...
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


% --- Executes just before music_gui is made visible.
function music_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to music_gui (see VARARGIN)

% Choose default command line output for music_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes music_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = music_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function wavpath_Callback(hObject, eventdata, handles)
% hObject    handle to wavpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wavpath as text
%        str2double(get(hObject,'String')) returns contents of wavpath as a double


% --- Executes during object creation, after setting all properties.
function wavpath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wavpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function piece_Callback(hObject, eventdata, handles)
% hObject    handle to piece (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of piece as text
%        str2double(get(hObject,'String')) returns contents of piece as a double


% --- Executes during object creation, after setting all properties.
function piece_CreateFcn(hObject, eventdata, handles)
% hObject    handle to piece (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e3_Callback(hObject, eventdata, handles)
% hObject    handle to e3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e3 as text
%        str2double(get(hObject,'String')) returns contents of e3 as a double


% --- Executes during object creation, after setting all properties.
function e3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e4_Callback(hObject, eventdata, handles)
% hObject    handle to e4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e4 as text
%        str2double(get(hObject,'String')) returns contents of e4 as a double


% --- Executes during object creation, after setting all properties.
function e4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e5_Callback(hObject, eventdata, handles)
% hObject    handle to e5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e5 as text
%        str2double(get(hObject,'String')) returns contents of e5 as a double


% --- Executes during object creation, after setting all properties.
function e5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in analyse.
function analyse_Callback(hObject, eventdata, handles)
% hObject    handle to analyse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wavpath = get(handles.wavpath, 'string');
piece = str2double(get(handles.piece, 'string'));
base = [110, 220, 440, 880]';
interval = 4000;
maximum_harmonic = 7;
global tunes tunes_harmonic fs can_play
try
    [tunes, tunes_harmonic, fs] = analyse_tunes(wavpath, piece, base, interval, maximum_harmonic, 0);
    can_play = true;
catch error
    f = msgbox(error.message, 'ERROR');
    can_play = false;
end


function songpath_Callback(hObject, eventdata, handles)
% hObject    handle to songpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of songpath as text
%        str2double(get(hObject,'String')) returns contents of songpath as a double


% --- Executes during object creation, after setting all properties.
function songpath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to songpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function beat_Callback(hObject, eventdata, handles)
% hObject    handle to beat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of beat as text
%        str2double(get(hObject,'String')) returns contents of beat as a double


% --- Executes during object creation, after setting all properties.
function beat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to beat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tunes tunes_harmonic fs rect_bar can_play
try
    if ~can_play  
        msgbox("Cannot play the song now!", "ERROR");
        return
    end
    can_play = false; % other song cannot be played now
    songpath = get(handles.songpath, 'string');
    file = loadjson(songpath);
    song = file.song;
    beat = str2double(get(handles.beat, 'string'));
    melody = get_melody(tunes, tunes_harmonic, fs, song, beat);
catch error
    msgbox(error.message, 'ERROR');
    return 
end
axes(handles.wav);
plot([0 : length(melody) - 1] / fs, melody);
set(gca, 'XLim', [0  (length(melody) - 1) / fs]);

% plot progress bar
axes(handles.progress); 
line([0,1,1,0], [0,0,1,1], 'Color', 'k', 'EraseMode', 'none');
try
    set(rect_bar,'XData',[0 0 0 0]);
catch
end
rect_bar = patch([0,1,1,0], [0,0,1,1], 'b', 'EdgeColor', 'b', 'EraseMode','none');
TotalTime = length(melody) / fs;
time = 0;
set(handles.progress, 'XTick', [], 'YTick', []);
sound(melody, fs);
while time < TotalTime
    set(rect_bar, 'XData', [0 time / TotalTime time / TotalTime 0]);
    drawnow;
    pause(1);
    time = time + 1;
end
can_play = true;


% --- Executes during object creation, after setting all properties.
function play_CreateFcn(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global can_play
can_play = false;