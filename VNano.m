function varargout = VNano(varargin)
% VNANO MATLAB code for VNano.fig
%      VNANO, by itself, creates a new VNANO or raises the existing
%      singleton*.
%
%      H = VNANO returns the handle to a new VNANO or the handle to
%      the existing singleton*.
%
%      VNANO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VNANO.M with the given input arguments.
%
%      VNANO('Property','Value',...) creates a new VNANO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before nano_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to nano_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VNano

% Last Modified by GUIDE v2.5 24-Apr-2016 17:47:39

% Begin initialization code - DO NOT EDIT
  gui_Singleton = 1;
  gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VNano_OpeningFcn, ...
                   'gui_OutputFcn',  @VNano_OutputFcn, ...
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
end

% --- Executes just before Vnano is made visible.
function VNano_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VNano (see VARARGIN)


  % TABS Processing

  % TAB group for r2 and [Fe]
  handles.tgroupMain = uitabgroup('Parent', handles.figure1, 'TabLocation', 'top');
  handles.tabR2 = uitab('Parent', handles.tgroupMain, 'Title', 'r2 calculation');
  handles.tabFe = uitab('Parent', handles.tgroupMain, 'Title', '[Fe] calculation');
  %Place image plot element inside r2 tab group
  set(handles.axes1, 'Parent', handles.tabR2)
  set(handles.slider1, 'Parent', handles.tabR2)
  set(handles.text1, 'Parent', handles.tabR2)
  %Reposition image plot element inside r2 tab group 
  set(handles.axes1, 'position', [0 .05 .5 .95]);
  set(handles.slider1, 'position', [0 .05 .5 .025]);
  set(handles.text1, 'position', [0 0 .5 .025]);
  % TAB group for r2
  handles.tgroupR2 = uitabgroup('Parent', handles.tabR2, 'TabLocation', 'top', 'Position', [.5 .0 .5 1]);
  handles.tabR2TableT2  = uitab('Parent', handles.tgroupR2, 'Title', 'Table T2');
  handles.tabR2PlotT2   = uitab('Parent', handles.tgroupR2, 'Title', 'Plot T2');
  handles.tabR2AdjustT2 = uitab('Parent', handles.tgroupR2, 'Title', 'Adjust T2');
  handles.tabR2AdjustR2 = uitab('Parent', handles.tgroupR2, 'Title', 'Adjust r2');
  handles.tabR2PlotR2   = uitab('Parent', handles.tgroupR2, 'Title', 'Plot r2');
  %Place ui elements into each tab
  % Table T2
  set(handles.textStats, 'Parent', handles.tabR2TableT2)
  set(handles.popupmenu1, 'Parent', handles.tabR2TableT2)
  set(handles.textTEO, 'Parent', handles.tabR2TableT2)
  set(handles.editTEO, 'Parent', handles.tabR2TableT2)
  set(handles.textDelta, 'Parent', handles.tabR2TableT2)
  set(handles.editDelta, 'Parent', handles.tabR2TableT2)
  set(handles.pushbuttonSaveTableT2, 'Parent', handles.tabR2TableT2)
  set(handles.pushbuttonTableT2, 'Parent', handles.tabR2TableT2)
  set(handles.uitable1, 'Parent', handles.tabR2TableT2)
  % Plot T2
  set(handles.textFitPlotT2, 'Parent', handles.tabR2PlotT2)
  set(handles.popupmenu2, 'Parent', handles.tabR2PlotT2)
  set(handles.pushbuttonSavePlotT2, 'Parent', handles.tabR2PlotT2)
  set(handles.pushbuttonPlotT2, 'Parent',handles.tabR2PlotT2)
  set(handles.axes2, 'Parent', handles.tabR2PlotT2)
  % Adjust T2
  set(handles.pushbuttonSaveAdjustT2, 'Parent', handles.tabR2AdjustT2)
  set(handles.pushbuttonAdjustT2, 'Parent',handles.tabR2AdjustT2)
  set(handles.uitable2, 'Parent', handles.tabR2AdjustT2)
  % Adjust r2
  set(handles.pushbuttonSaveAdjustR2, 'Parent', handles.tabR2AdjustR2)
  set(handles.pushbuttonAdjustR2, 'Parent',handles.tabR2AdjustR2)
  set(handles.uitable3, 'Parent', handles.tabR2AdjustR2)
  % Plot r2
  set(handles.textFitPlotR2, 'Parent', handles.tabR2PlotR2)
  set(handles.popupmenu3, 'Parent', handles.tabR2PlotR2)
  set(handles.pushbuttonPlotR2, 'Parent',handles.tabR2PlotR2)
  set(handles.axes3, 'Parent', handles.tabR2PlotR2)
  %Reposition each ui element inside r2 internal tab group 
  % Table T2
  set(handles.textTEO, 'position', [.0 0.012 .1 .025]);
  set(handles.editTEO, 'position', [.1 0 .1 .05]);
  set(handles.textDelta, 'position', [.2 0.012 .1 .025]);
  set(handles.editDelta, 'position', [.3 0 .1 .05]);
  set(handles.textStats, 'position', [.45 0.025 .1 .025]);
  set(handles.popupmenu1, 'position', [.55 0 .2 .05]);
  set(handles.pushbuttonSaveTableT2, 'position', [.8 0 .2 .05]);
  set(handles.pushbuttonTableT2, 'position', [.3 0 .2 .05]);
  set(handles.uitable1, 'position', [0 0.05 1 0.95]);
  % Plot T2
  set(handles.textFitPlotT2, 'position', [0 0.025 .1 .025]);
  set(handles.popupmenu2, 'position', [.1 .0 .2 .05]);
  set(handles.pushbuttonSavePlotT2, 'position', [.8 0 .2 .05]);
  set(handles.pushbuttonPlotT2, 'position', [.3 0 .2 .05]);
  set(handles.axes2, 'position', [.15 0.15 .8 .8]);
  % Adjust T2
  set(handles.pushbuttonSaveAdjustT2, 'position', [.8 0 .2 .05]);
  set(handles.pushbuttonAdjustT2, 'position', [0 0 .2 .05]);
  set(handles.uitable2, 'position', [0 0.05 1 0.95]);
  % Adjust r2
  set(handles.pushbuttonSaveAdjustR2, 'position', [.8 0 .2 .05]);
  set(handles.pushbuttonAdjustR2, 'position', [0 0 .2 .05]);
  set(handles.uitable3, 'position', [0 0.05 1 .95]);
  % Plot r2
  set(handles.textFitPlotR2, 'position', [0 0.025 .1 .025]);
  set(handles.popupmenu3, 'position', [.1 0 .2 .05]);
  set(handles.pushbuttonPlotR2, 'position', [.3 0 .2 .05]);
  set(handles.axes3, 'position', [.15 .15 .8 .8]);
  % Fe
  %Place image plot element inside Fe tab group
  set(handles.axes4, 'Parent', handles.tabFe)
  set(handles.slider2, 'Parent', handles.tabFe)
  set(handles.text2, 'Parent', handles.tabFe)
  %Reposition image plot element inside Fe tab group 
  set(handles.axes4, 'position', [0 .05 .5 .95]);
  set(handles.slider2, 'position', [0 .05 .5 .025]);
  set(handles.text2, 'position', [0 0 .5 .025]);
  % TAB group for r2
  % TAB group for [Fe]
  handles.tgroupFe = uitabgroup('Parent', handles.tabFe, 'TabLocation', 'top', 'Position', [.5 .0 .5 1]);
  handles.tabFeTableT2  = uitab('Parent', handles.tgroupFe, 'Title', 'Intensity');
  handles.tabFePlotT2   = uitab('Parent', handles.tgroupFe, 'Title', 'Plot T2');
  handles.tabFeAdjustT2 = uitab('Parent', handles.tgroupFe, 'Title', 'Adjust T2');
%  handles.tabFeT2Data   = uitab('Parent', handles.tgroupFe, 'Title', 'T2 Data');
  handles.tabFeParameters = uitab('Parent', handles.tgroupFe, 'Title', 'Parameters');
  handles.tabFeQuantification  = uitab('Parent', handles.tgroupFe, 'Title', '[Fe] Quantification');
  %Place ui elements into each tab
  % Table T2
  set(handles.textStatsFe, 'Parent', handles.tabFeTableT2)
  set(handles.popupmenu4, 'Parent', handles.tabFeTableT2)
  set(handles.textTEOFe, 'Parent', handles.tabFeTableT2)
  set(handles.editTEOFe, 'Parent', handles.tabFeTableT2)
  set(handles.textDeltaFe, 'Parent', handles.tabFeTableT2)
  set(handles.editDeltaFe, 'Parent', handles.tabFeTableT2)
  set(handles.pushbuttonSaveTableT2Fe, 'Parent', handles.tabFeTableT2)
%  set(handles.pushbuttonTableT2, 'Parent', handles.tabR2TableT2)
  set(handles.uitable4, 'Parent', handles.tabFeTableT2)
  % Plot T2
  set(handles.textFitPlotT2Fe, 'Parent', handles.tabFePlotT2)
  set(handles.popupmenu5, 'Parent', handles.tabFePlotT2)
  set(handles.pushbuttonSavePlotT2Fe, 'Parent', handles.tabFePlotT2)  
  set(handles.pushbuttonPlotT2Fe, 'Parent', handles.tabFePlotT2)
  set(handles.axes5, 'Parent', handles.tabFePlotT2)
  % Adjust T2
  set(handles.pushbuttonSaveAdjustT2Fe, 'Parent', handles.tabFeAdjustT2)
%  set(handles.pushbuttonAdjustT2, 'Parent', handles.tabFeAdjustT2)
  set(handles.uitable5, 'Parent', handles.tabFeAdjustT2)
  % Parameters
%  set(handles.pushbuttonAdjustT2Fe, 'Parent',handles.tabFeAdjustT2)
  set(handles.uipanel1, 'Parent', handles.tabFeParameters)
  % [Fe] Quantification
%  set(handles.popupmenu3, 'Parent', handles.tabR2PlotR2)
  set(handles.pushbuttonSaveQuantification, 'Parent', handles.tabFeQuantification)
  set(handles.textQuantificationOfIronContent, 'Parent', handles.tabFeQuantification)
  set(handles.uitable6, 'Parent', handles.tabFeQuantification)
%  % Adjust r2
%  set(handles.pushbuttonAdjustR2, 'position', [0 0 .2 .05]);
%  set(handles.uitable3, 'position', [0 0.05 1 .95]);
  %Reposition each ui element inside r2 internal tab group 
  % Table T2
  set(handles.textTEOFe, 'position', [.0 0.012 .1 .025]);
  set(handles.editTEOFe, 'position', [.1 0 .1 .05]);
  set(handles.textDeltaFe, 'position', [.2 0.012 .1 .025]);
  set(handles.editDeltaFe, 'position', [.3 0 .1 .05]);
  set(handles.textStatsFe, 'position', [.45 0.025 .1 .025]);
  set(handles.popupmenu4, 'position', [.55 0 .2 .05]);
  set(handles.pushbuttonSaveTableT2Fe, 'position', [.8 0 .2 .05]);
%  set(handles.pushbuttonTableT2, 'position', [.3 0 .2 .05]);
  set(handles.uitable4, 'position', [0 0.05 1 0.95]);
  % Plot T2
  set(handles.textFitPlotT2Fe, 'position', [0 0.025 .1 .025]);
  set(handles.popupmenu5, 'position', [.1 .0 .2 .05]);
  set(handles.pushbuttonSavePlotT2Fe, 'position', [.8 0 .2 .05]);
  set(handles.pushbuttonPlotT2Fe, 'position', [.3 0 .2 .05]);
  set(handles.axes5, 'position', [.15 0.15 .8 .8]);
  % Adjust T2
  set(handles.pushbuttonSaveAdjustT2Fe, 'position', [.8 0 .2 .05]);
  set(handles.pushbuttonAdjustT2Fe, 'position', [0 0 .2 .05]);
  set(handles.uitable5, 'position', [0 0.05 1 0.95]);
  % Adjust T2
%  set(handles.pushbuttonAdjustT2, 'position', [0 0 .2 .05]);
%  set(handles.uitable5, 'position', [0 0.05 1 0.95]);
  % Parameters
%  set(handles.pushbuttonAdjustR2, 'position', [0 0 .2 .05]);
  set(handles.uipanel1, 'position', [0 0 1 1]);
  % [Fe] Quantification
  set(handles.pushbuttonSaveQuantification, 'position', [.8 0 .2 .05]);
  set(handles.textQuantificationOfIronContent, 'position', [0 0.90 1 .1]);
  set(handles.uitable6, 'position', [0 .05 1 .9]);



  %handles.dicomDirectory = '../dados-patente_lionel/INPUT/SE_MC(2)_TE8-256_0003/';

  %  handles.roiColorsName = {[1 1 0], 'r', 'g', 'b', 'y', 'm', 'c'}; 
  %  handles.roiColorsName = {[1.,1.,0.], [0.6,0.8,0.196078], [0.196078,0.803922,0.6], [0.,0.,1.], [0.419608,0.137255,0.556863], [0.196078,0.6,0.8], [0.372549,0.623529,0.623529], [0.258824,0.258824,0.435294], [0.301961,0.301961,1.], [0.34902,0.34902,0.670588], [0.623529,0.372549,0.623529], [0.360784,0.2,0.090196], [0.85098,0.85098,0.098039], [0.54902,0.505882,0.32549], [0.623529,0.372549,0.623529], [0.85098,0.529412,0.098039], [0.721569,0.45098,0.2], [0.,0.882353,1.], [0.54902,0.090196,0.090196], [0.917647,0.917647,0.682353], [0.858824,0.858824,0.439216], [1.,0.647059,0.], [0.560784,0.560784,0.741176], [0.913725,0.760784,0.65098], [1.,0.,1.], [0.556863,0.137255,0.419608], [0.498039,0.,1.], [0.6,0.196078,0.803922], [0.576471,0.439216,0.858824], [0.803922,0.498039,0.196078], [0.811765,0.709804,0.231373], [0.917647,0.678431,0.917647], [0.,0.,0.], [0.529412,0.121569,0.470588], [0.85098,0.85098,0.952941], [0.435294,0.258824,0.258824], [0.419608,0.258824,0.14902], [0.901961,0.909804,0.980392], [0.137255,0.419608,0.556863], [0.219608,0.690196,0.870588], [0.592157,0.411765,0.309804], [0.847059,0.74902,0.847059], [0.678431,0.917647,0.917647], [0.439216,0.576471,0.858824], [0.439216,0.858824,0.858824], [0.,1.,0.], [0.576471,0.858824,0.439216], [0.184314,0.309804,0.184314], [0.137255,0.556863,0.137255], [0.419608,0.556863,0.137255], [0.129412,0.368627,0.129412], [1.,0.,0.]};
  handles.roiColorsName = {[1,	0,	0], [0,	0,	1], [0,	1,	0], [1,	0.647058824,	0], [0.137254902,	0.556862745,	0.137254902], [1,	0,	1], [1,	1,	0], [0.498039216,	0,	1], [0.6,	0.8,	0.196078431], [0.219607843,	0.690196078,	0.870588235], [0.592156863,	0.411764706,	0.309803922], [0.850980392,	0.850980392,	0.098039216], [0.6,	0.196078431,	0.803921569], [0.419607843,	0.556862745,	0.137254902], [0.549019608,	0.090196078,	0.090196078], [0.4,	0.8,	1], [1,	0,	0.4], [0.988235294,	0.835294118,	0.705882353], [0.8,	0.6,	0], [0.882352941,	0.4,	0.8]}; 

  handles.dicomDirectory = '';
  handles.dicomStruct = {};
  handles.dicomStructSize = 0;
  handles.dicomImgSlice = 0;
  handles.Rois = {};
  handles.RoisMasks = zeros(1, 1, 1);

  handles.dicomDirectoryFe = '';
  handles.dicomStructFe = {};
  handles.dicomStructSizeFe = 0;
  handles.dicomImgSliceFe = 0;
  handles.RoisFe = {};
  handles.RoisMasksFe = zeros(1, 1, 1);
  
  handles.textQuantificationOfIronContent.String = 'Quantification Of Iron Content Of Substance';
  handles.SliceThickness = 1.0;

  handles.r2Linear = .0;
  handles.r2Exp1 = .0;
  handles.r2Manual = 1.;

  % Default
  handles.defaultMa = .0;  % atomic mass
  handles.defaultMx = .0;  % Molecular weight oxide= Mx
  handles.defaultDo = .0;  % Density oxide= Do
  handles.defaultD = .0;   % Diameter= D
  handles.defaultMFe = .0; % Molecular weight Fe = MFe
  handles.defaultH = .0;   % Well height = H
  handles.defaultNc = .0;  % Number of cells = Nc
  handles.defaultVa = .0;  % Sample volume =Va
  handles.defaultEf = .0;  % slice thickness =EF

  % Magnetite
  handles.magnetiteMa = 55.84;   % atomic mass
  handles.magnetiteMx = 231.516; % Molecular weight oxide= Mx
  handles.magnetiteDo = 4.9E6;   % Density oxide= Do
  handles.magnetiteD = 50.;      % Diameter= D
  handles.magnetiteMFe = 176.52; % Molecular weight Fe = MFe
  handles.magnetiteH = 5.;       % Well height = H
  handles.magnetiteNc = 1.E6;    % Number of cells = Nc
  handles.magnetiteVa = .5;      % Sample volume =Va
  handles.magnetiteEf = 3.;      % slice thickness =EF

  % Maghemite
  handles.maghemiteMa = 55.84;   % atomic mass
  handles.maghemiteMx = 199.677; % Molecular weight oxide= Mx
  handles.maghemiteDo = 4.87E6;  % Density oxide= Do
  handles.maghemiteD = 50.;      % Diameter= D
  handles.maghemiteMFe = 111.68; % Molecular weight Fe = MFe
  handles.maghemiteH = 5.;       % Well height = H
  handles.maghemiteNc = 1.E6;    % Number of cells = Nc
  handles.maghemiteVa = .5;      % Sample volume =Va
  handles.maghemiteEf = 3.;      % slice thickness =EF
  
  handles.editAtomicMass.String = num2str(handles.magnetiteMa);
  handles.editOxideMolecularWeight.String = num2str(handles.magnetiteMx);
  handles.editOxideDensity.String = num2str(handles.magnetiteDo);
  handles.editDiameter.String = num2str(handles.magnetiteD);
  handles.editFeMolecularMass.String = num2str(handles.magnetiteMFe);
  handles.editCellQuantity.String = num2str(handles.magnetiteNc);
  handles.editWellWeight.String = num2str(handles.magnetiteH);
  handles.editVolumeAgarose.String = num2str(handles.magnetiteVa);
  handles.editSliceThickness.String = num2str(handles.SliceThickness);
  handles.editR2.String = num2str(handles.r2Manual);
  
  
  handles.columnConcentrationAdjustR2 = {10, 20 , 30};
  %  handles.roiListenerHandles = {};
  
  % Choose default command line output for VNano
  handles.output = hObject;  
  
  % Update handles structure
  guidata(hObject, handles);

  % UIWAIT makes VNano wait for user response (see UIRESUME)
  % uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = VNano_OutputFcn(hObject, eventdata, handles) 
  % varargout  cell array for returning output args (see VARARGOUT);
  % hObject    handle to figure
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)
  
  % http://www.mathworks.com/matlabcentral/answers/51992-how-can-i-make-window-to-be-fullscreen-and-resizable-in-matlab-gui
  % set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
  
  % Get default command line output from handles structure
  varargout{1} = handles.output;
end

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
  % hObject    handle to slider1 (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)

  % Hints: get(hObject,'Value') returns position of slider
  %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

  handles.dicomImgSlice = round(get(hObject, 'Value'));
  %set(hObject,'TooltipString', int2str(round(get(hObject,'Value'))));
  handles.text1.String = strcat('Slice Number: ', int2str(handles.dicomImgSlice));
  dicomShow(handles.axes1, handles.dicomStruct, handles.dicomImgSlice, true);

  guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
  % hObject    handle to slider1 (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    empty - handles not created until after all CreateFcns called

  % Hint: slider controls usually have a light gray background.
  if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
      set(hObject,'BackgroundColor',[.9 .9 .9]);
  end
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

  handles.dicomImgSliceFe = round(get(hObject, 'Value'));
  %set(hObject,'TooltipString', int2str(round(get(hObject,'Value'))));
  handles.text2.String = strcat('Slice Number: ', int2str(handles.dicomImgSliceFe));
  dicomShow(handles.axes4, handles.dicomStructFe, handles.dicomImgSliceFe, true);

  guidata(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
  % hObject    handle to File (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)
end

% --------------------------------------------------------------------
function Open_Callback(hObject, eventdata, handles)
  % hObject    handle to Open (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)
  
  disp(handles.tgroupMain.SelectedTab.Title);

  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation');  
    handles.dicomDirectory = uigetdir;
    handles.dicomImgSlice = 1;
    handles.dicomStruct = dicomRead(handles.dicomDirectory);
    dicomShow(handles.axes1, handles.dicomStruct, handles.dicomImgSlice, false);
    handles.dicomStructSize = size(handles.dicomStruct, 2);
    handles.slider1.Min = 1;
    handles.slider1.Max = handles.dicomStructSize;
    sliderStep = inv(handles.slider1.Max - handles.slider1.Min);

    handles.slider1.SliderStep = [sliderStep sliderStep];
    handles.slider1.Value = 1;

    handles.text1.String = strcat('Slice number: ', int2str(handles.dicomImgSlice));

    handles.slider1.Visible = 'on';
    handles.text1.Visible = 'on';
%    handles.text2.Visible = 'on';
  %   handles.pushbutton1.Visible = 'on';
  %   handles.pushbutton2.Visible = 'on';
  %   handles.pushbutton3.Visible = 'on';
  %   handles.pushbutton4.Visible = 'on';
  %   handles.pushbutton5.Visible = 'on';
  %   handles.pushbutton6.Visible = 'on';
    handles.pushbutton7.Visible = 'off';

    handles.roiColorsCount = 0;

    handles.fitPoly1Gofs = {};
    handles.fitPoly1Outputs = {};
    handles.fitPoly1Fs = {};

    handles.fitExp1Gofs = {};
    handles.fitExp1Outputs = {};
    handles.fitExp1Fs = {};

    handles.poly1InvT2 = {};
    handles.exp1InvT2 = {};

  %   handles.fitR2Poly1Gofs = {};
  %   handles.fitR2Poly1Outputs = {};
  %   handles.fitR2Poly1Fs = {};
  % 
  %   handles.fitR2Exp1Gofs = {};
  %   handles.fitR2Exp1Outputs = {};
  %   handles.fitR2Exp1Fs = {};

    handles.fitPoly1Poly1Fs = {};
    handles.fitPoly1Poly1Gofs = {};
    handles.fitPoly1Poly1Outputs = {};
    handles.fitPoly1Exp1Fs = {};
    handles.fitPoly1Exp1Gofs = {};
    handles.fitPoly1Exp1Outputs = {};

    handles.feRoi = {};
  else
    handles.dicomDirectoryFe = uigetdir;
    handles.dicomImgSliceFe = 1;
    handles.dicomStructFe = dicomRead(handles.dicomDirectoryFe);
    dicomShow(handles.axes4, handles.dicomStructFe, handles.dicomImgSliceFe, false);
    handles.dicomStructSizeFe = size(handles.dicomStructFe, 2);
    handles.slider2.Min = 1;
    handles.slider2.Max = handles.dicomStructSizeFe;
    sliderStep = inv(handles.slider2.Max - handles.slider2.Min);

    handles.slider2.SliderStep = [sliderStep sliderStep];
    handles.slider2.Value = 1;

    handles.text2.String = strcat('Slice number: ', int2str(handles.dicomImgSliceFe));

    handles.slider2.Visible = 'on';
    handles.text2.Visible = 'on';
    handles.pushbutton7.Visible = 'off';

    handles.roiColorsCountFe = 0;

    handles.fitPoly1GofsFe = {};
    handles.fitPoly1OutputsFe = {};
    handles.fitPoly1FsFe = {};

    handles.fitExp1GofsFe = {};
    handles.fitExp1OutputsFe = {};
    handles.fitExp1FsFe = {};

    handles.poly1InvT2Fe = {};
    handles.exp1InvT2Fe = {};

    handles.fitPoly1Poly1FsFe = {};
    handles.fitPoly1Poly1GofsFe = {};
    handles.fitPoly1Poly1OutputsFe = {};
    handles.fitPoly1Exp1FsFe = {};
    handles.fitPoly1Exp1GofsFe = {};
    handles.fitPoly1Exp1OutputsFe = {};

    handles.feRoi = {};
    
  end
  
  guidata(hObject, handles);
end

% DO MASK
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
  % hObject    handle to pushbutton7 (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)

  imshow(getMask(handles.axes1, handles.Rois), 'Parent', handles.axes2);
end

function tableT2(hObject, handles)

  delta = 1 + realmin('double');

  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    handles.RoisMasks = getMasks(handles.axes1, handles.Rois);
    szMasks = size(handles.RoisMasks, 3);
    roiStats = zeros(handles.dicomStructSize, szMasks + 1);
    cnames = {'TE'};
    rnames = {};
    for i = 1 : szMasks
      roiColor = getColor(handles.Rois{i}) * 255;
      cnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
    end

    doubleTEO   = str2double(handles.editTEO.String);
    doubleDelta = str2double(handles.editDelta.String);
    
    for i = 1 : handles.dicomStructSize
      rnames{end + 1} = strcat('Slice_',num2str(i));
%      roiStats(i, 1) = i * 8;
      roiStats(i, 1) = doubleTEO + (i - 1) * doubleDelta;
    end

    % Determine the selected data set.
    str = handles.popupmenu1.String;
    val = handles.popupmenu1.Value;
    % Set current data to the selected data set.

    for i = 1 : handles.dicomStructSize
      for j = 1 : szMasks
        roiStats(i, j + 1) = applyRoiFunc(str{val}, handles.dicomStruct{i}{2}, handles.RoisMasks(:, :, j)) + delta;
      end
    end

    handles.uitable1.ColumnName = cnames;
    handles.uitable1.RowName = rnames;
    handles.uitable1.Data = roiStats;
%    jscroll=findjobj(handles.uitable1);

  else
    handles.RoisMasksFe = getMasks(handles.axes4, handles.RoisFe);
    szMasks = size(handles.RoisMasksFe, 3);
    roiStats = zeros(handles.dicomStructSizeFe, szMasks + 1);
    cnames = {'TE'};
    rnames = {};
    for i = 1 : szMasks
      roiColor = getColor(handles.RoisFe{i}) * 255;
      cnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
    end
    
    doubleTEO   = str2double(handles.editTEOFe.String);
    doubleDelta = str2double(handles.editDeltaFe.String);

    for i = 1 : handles.dicomStructSizeFe
      rnames{end + 1} = strcat('Slice_',num2str(i));
%      roiStats(i, 1) = i * 8;
      roiStats(i, 1) = doubleTEO + (i - 1) * doubleDelta;
    end

    % Determine the selected data set.
    str = handles.popupmenu4.String;
    val = handles.popupmenu4.Value;
    % Set current data to the selected data set.

    for i = 1 : handles.dicomStructSizeFe
      for j = 1 : szMasks
        roiStats(i, j + 1) = applyRoiFunc(str{val}, handles.dicomStructFe{i}{2}, handles.RoisMasksFe(:, :, j)) + delta;
      end
    end

    handles.uitable4.ColumnName = cnames;
    handles.uitable4.RowName = rnames;
    handles.uitable4.Data = roiStats;
%    jscroll=findjobj(handles.uitable4);
  end
  
%   % http://www.mathworks.com/matlabcentral/newsreader/view_thread/298335#802680
%   rowHeaderViewport=jscroll.getComponent(4);
%   rowHeader=rowHeaderViewport.getComponent(0);
%   %height=rowHeader.getSize
%   %rowHeader.setSize(80,360)
%   newWidth=100; %100 pixels
%   rowHeaderViewport.setPreferredSize(java.awt.Dimension(newWidth,0));
%   height=rowHeader.getHeight;
% %  height=numRois * height;
%   rowHeader.setPreferredSize(java.awt.Dimension(newWidth,height));
%   rowHeader.setSize(newWidth,height);
  
  guidata(hObject, handles);
  plotT2(hObject, handles);
end

function plotT2(hObject, handles)

  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    handles.axes2.clo;
    localData = handles.uitable1.Data;  
    handles.fitExp1Fs = cell(1, size(localData, 2) - 1);
    handles.fitExp1Gofs = cell(1, size(localData, 2) - 1);
    handles.fitExp1Outputs = cell(1, size(localData, 2) - 1);
    handles.fitPoly1Fs = cell(1, size(localData, 2) - 1);
    handles.fitPoly1Gofs = cell(1, size(localData, 2) - 1);
    handles.fitPoly1Outputs = cell(1, size(localData, 2) - 1);

    % CODIGO
    ft = fittype('a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y');
    opts = fitoptions('Method', 'NonlinearLeastSquares');
  %  opts.Algorithm = 'Levenberg-Marquardt';
    opts.Display = 'Off';
    opts.StartPoint = [1 60 0];
    opts.Lower = [-1000 -1000 -1000];
    opts.Upper = [1000 1000 1000];
    opts.TolFun = 1e-09;
    opts.TolX = 1e-09;
    % CODIGO

    delta = 1 + realmin('double');

    for i = 1 : size(localData, 2) - 1
      % LINEAR
      [xData, yData] = prepareCurveData(localData(:, 1), localData(:, i + 1));
      xData = xData + delta;
      yData = yData + delta;
      [poly1F, poly1Gof, poly1Output] = fit(xData, log(yData), 'poly1');
      handles.fitPoly1Fs{i} = poly1F;
      handles.fitPoly1Gofs{i} = poly1Gof;
      handles.fitPoly1Outputs{i} = poly1Output;
      % NON_LINEAR
      [exp1F, exp1Gof, exp1Output] = fit(xData, yData, ft, opts);
      handles.fitExp1Fs{i} = exp1F;
      handles.fitExp1Gofs{i} = exp1Gof;
      handles.fitExp1Outputs{i} = exp1Output;
    end

    % Determine the selected data set.
    str = handles.popupmenu2.String;
    val = handles.popupmenu2.Value;
    % Set current data to the selected data set.

    xlabel(handles.axes2, 'TE (ms)') % x-axis label
    ylabel(handles.axes2, 'Intensity (A. U.)') % y-axis label

    hold(handles.axes2, 'on');

    if strcmp(str{val}, 'poly1')
      % LINEAR
      for i = 1 : size(localData, 2) - 1
        [xData, yData] = prepareCurveData(localData(:, 1), localData(:, i + 1));
%        xData = xData + delta;
%        yData = yData + delta;
        plot(handles.axes2, xData, exp(feval(handles.fitPoly1Fs{i}, xData)), '-', 'Color', getColor(handles.Rois{i}));
        plot(handles.axes2, xData, yData, 'o', 'Color', getColor(handles.Rois{i}));
      end
    else
      % NON_LINEAR
      for i = 1 : size(localData, 2) - 1
        plot(handles.axes2, localData(:, 1), feval(handles.fitExp1Fs{i}, localData(:, 1)), '-', 'Color', getColor(handles.Rois{i}));
        plot(handles.axes2, localData(:, 1), localData(:, i + 1), 'o', 'Color', getColor(handles.Rois{i}));
      end
    end
    hold(handles.axes2, 'off');
  else
    handles.axes5.clo;
    localData = handles.uitable4.Data;  
    handles.fitExp1FsFe = cell(1, size(localData, 2) - 1);
    handles.fitExp1GofsFe = cell(1, size(localData, 2) - 1);
    handles.fitExp1OutputsFe = cell(1, size(localData, 2) - 1);
    handles.fitPoly1FsFe = cell(1, size(localData, 2) - 1);
    handles.fitPoly1GofsFe = cell(1, size(localData, 2) - 1);
    handles.fitPoly1OutputsFe = cell(1, size(localData, 2) - 1);

    % CODIGO
    ft = fittype('a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y');
    opts = fitoptions('Method', 'NonlinearLeastSquares');
  %  opts.Algorithm = 'Levenberg-Marquardt';
    opts.Display = 'Off';
    opts.StartPoint = [1 60 0];
    opts.Lower = [-10000 -10000 -1000];
    opts.Upper = [10000 10000 1000];
    opts.TolFun = 1e-09;
    opts.TolX = 1e-09;
    % CODIGO

    delta = 1 + realmin('double');

    for i = 1 : size(localData, 2) - 1
      % LINEAR
      [xData, yData] = prepareCurveData(localData(:, 1), localData(:, i + 1));
      xData = xData + delta;
      yData = yData + delta;
      [poly1F, poly1Gof, poly1Output] = fit(xData, log(yData), 'poly1');
      handles.fitPoly1FsFe{i} = poly1F;
      handles.fitPoly1GofsFe{i} = poly1Gof;
      handles.fitPoly1OutputsFe{i} = poly1Output;
      % NON_LINEAR
      [exp1F, exp1Gof, exp1Output] = fit(xData, yData, ft, opts);
      handles.fitExp1FsFe{i} = exp1F;
      handles.fitExp1GofsFe{i} = exp1Gof;
      handles.fitExp1OutputsFe{i} = exp1Output;
    end

    % Determine the selected data set.
    str = handles.popupmenu5.String;
    val = handles.popupmenu5.Value;
    % Set current data to the selected data set.

    xlabel(handles.axes5, 'TE (ms)') % x-axis label
    ylabel(handles.axes5, 'Intensity (A. U.)') % y-axis label

    hold(handles.axes5, 'on');

    if strcmp(str{val}, 'poly1')
      % LINEAR
      for i = 1 : size(localData, 2) - 1
        [xData, yData] = prepareCurveData(localData(:, 1), localData(:, i + 1));
        xData = xData + delta;
        yData = yData + delta;
        plot(handles.axes5, xData, exp(feval(handles.fitPoly1FsFe{i}, xData)), '-', 'Color', getColor(handles.RoisFe{i}));
        plot(handles.axes5, xData, yData, 'o', 'Color', getColor(handles.RoisFe{i}));
      end
    else
      % NON_LINEAR
      for i = 1 : size(localData, 2) - 1
        plot(handles.axes5, localData(:, 1), feval(handles.fitExp1FsFe{i}, localData(:, 1)), '-', 'Color', getColor(handles.RoisFe{i}));
        plot(handles.axes5, localData(:, 1), localData(:, i + 1), 'o', 'Color', getColor(handles.RoisFe{i}));
      end
    end
    hold(handles.axes5, 'off');
  end

  guidata(hObject, handles);
  adjustT2(hObject, handles);
end

function adjustT2(hObject, handles)

  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    poly1GofsNames = fieldnames(handles.fitPoly1Gofs{1});
    poly1OutputsNames = fieldnames(handles.fitPoly1Outputs{1});
    exp1GofsNames = fieldnames(handles.fitExp1Gofs{1});
    exp1OutputsNames = fieldnames(handles.fitExp1Outputs{1});

    poly1OutputsNames(3:4) = [];
    exp1OutputsNames(3:4) = [];
    dnames = cell(2 + size(exp1GofsNames, 1) + size(exp1OutputsNames, 1), 2 * size(handles.fitExp1Gofs, 2));

    temp = exp1OutputsNames{4};
    exp1OutputsNames{4} = exp1OutputsNames{8};
    exp1OutputsNames{8} = temp;

    handles.poly1InvT2 = cell(1, size(handles.fitPoly1Fs, 2));
    handles.exp1InvT2 = cell(1, size(handles.fitExp1Fs, 2));
    % LINEAR
    for i = 1 : size(handles.fitPoly1Fs, 2) 
      p1 = handles.fitPoly1Fs{i}.p1;
      T2 = -inv(p1);
      interval = confint(handles.fitPoly1Fs{i});
      errorB = (interval(1, 1) - interval(2, 1)) / 2.;
      SD_T2 = abs(errorB / p1^2);
      dnames{1, 2 * i - 1} = T2;
      dnames{2, 2 * i - 1} = SD_T2;
      handles.poly1InvT2{i} = inv(T2);
    end
    % NON_LINEAR
    for i = 1 : size(handles.fitExp1Fs, 2) 
      b = handles.fitExp1Fs{i}.b;
      T2 = b;
      interval = confint(handles.fitExp1Fs{i});
      SD_T2 = abs(interval(1, 2) - interval(2, 2)) / 2.;
      dnames{1, 2 * i} = T2;
      dnames{2, 2 * i} = SD_T2;
      handles.exp1InvT2{i} = inv(T2);
    end

    % LINEAR
    for i = 1:size(poly1GofsNames, 1)
      for j = 1:size(handles.fitPoly1Gofs, 2)
        dnames{i + 2, 2 * j - 1} = getfield(handles.fitPoly1Gofs{j}, exp1GofsNames{i});
      end
    end
    for i = 1:size(poly1OutputsNames, 1)
      for j = 1:size(handles.fitPoly1Outputs, 2)
        dnames{i + 7, 2 * j - 1} = getfield(handles.fitPoly1Outputs{j}, poly1OutputsNames{i});
      end
    end
    % NON_LINEAR
    for i = 1:size(exp1GofsNames, 1)
      for j = 1:size(handles.fitExp1Gofs, 2)
        dnames{i + 2, 2 * j} = getfield(handles.fitExp1Gofs{j}, exp1GofsNames{i});
      end
    end
    for i = 1:size(exp1OutputsNames, 1)
      for j = 1:size(handles.fitExp1Outputs, 2)
        dnames{i + 7, 2 * j} = getfield(handles.fitExp1Outputs{j}, exp1OutputsNames{i});     
      end
    end

    cnames = { };
    rnames = ['T2'; 'SD_T2'; exp1GofsNames; exp1OutputsNames];

    for i = 1 : size(handles.fitExp1Gofs, 2)
      roiColor = getColor(handles.Rois{i}) * 255;
      cnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_linear</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
      cnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_exp1</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
    end

    handles.uitable2.ColumnName = cnames;
    handles.uitable2.RowName = rnames;
    handles.uitable2.Data = dnames;

    guidata(hObject, handles);

    adjustR2(hObject, handles);
  else
    poly1GofsNames = fieldnames(handles.fitPoly1GofsFe{1});
    poly1OutputsNames = fieldnames(handles.fitPoly1OutputsFe{1});
    exp1GofsNames = fieldnames(handles.fitExp1GofsFe{1});
    exp1OutputsNames = fieldnames(handles.fitExp1OutputsFe{1});

    poly1OutputsNames(3:4) = [];
    exp1OutputsNames(3:4) = [];
    dnames = cell(2 + size(exp1GofsNames, 1) + size(exp1OutputsNames, 1), 2 * size(handles.fitExp1GofsFe, 2));

    temp = exp1OutputsNames{4};
    exp1OutputsNames{4} = exp1OutputsNames{8};
    exp1OutputsNames{8} = temp;

    handles.poly1InvT2 = cell(1, size(handles.fitPoly1FsFe, 2));
    handles.exp1InvT2 = cell(1, size(handles.fitExp1FsFe, 2));
    % LINEAR
    for i = 1 : size(handles.fitPoly1FsFe, 2) 
      p1 = handles.fitPoly1FsFe{i}.p1;
      T2 = -inv(p1);
      interval = confint(handles.fitPoly1FsFe{i});
      errorB = (interval(1, 1) - interval(2, 1)) / 2.;
      SD_T2 = abs(errorB / p1^2);
      dnames{1, 2 * i - 1} = T2;
      dnames{2, 2 * i - 1} = SD_T2;
      handles.poly1InvT2Fe{i} = inv(T2);
    end
    % NON_LINEAR
    for i = 1 : size(handles.fitExp1FsFe, 2) 
      b = handles.fitExp1FsFe{i}.b;
      T2 = b;
      interval = confint(handles.fitExp1FsFe{i});
      SD_T2 = abs(interval(1, 2) - interval(2, 2)) / 2.;
      dnames{1, 2 * i} = T2;
      dnames{2, 2 * i} = SD_T2;
      handles.exp1InvT2Fe{i} = inv(T2);
    end

    % LINEAR
    for i = 1:size(poly1GofsNames, 1)
      for j = 1:size(handles.fitPoly1GofsFe, 2)
        dnames{i + 2, 2 * j - 1} = getfield(handles.fitPoly1GofsFe{j}, exp1GofsNames{i});
      end
    end
    for i = 1:size(poly1OutputsNames, 1)
      for j = 1:size(handles.fitPoly1OutputsFe, 2)
        dnames{i + 7, 2 * j - 1} = getfield(handles.fitPoly1OutputsFe{j}, poly1OutputsNames{i});
      end
    end
    % NON_LINEAR
    for i = 1:size(exp1GofsNames, 1)
      for j = 1:size(handles.fitExp1GofsFe, 2)
        dnames{i + 2, 2 * j} = getfield(handles.fitExp1GofsFe{j}, exp1GofsNames{i});
      end
    end
    for i = 1:size(exp1OutputsNames, 1)
      for j = 1:size(handles.fitExp1OutputsFe, 2)
        dnames{i + 7, 2 * j} = getfield(handles.fitExp1OutputsFe{j}, exp1OutputsNames{i});     
      end
    end

    cnames = { };
    rnames = ['T2'; 'SD_T2'; exp1GofsNames; exp1OutputsNames];

    for i = 1 : size(handles.fitExp1GofsFe, 2)
      roiColor = getColor(handles.RoisFe{i}) * 255;
      cnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_linear</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
      cnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_exp1</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
    end

    roiNames = {};
    
    for i = 1 : size(handles.fitExp1GofsFe, 2)
      roiColor = getColor(handles.RoisFe{i}) * 255;
      roiNames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
    end
    
    handles.uitable5.ColumnName = cnames;
    handles.uitable5.RowName = rnames;
    handles.uitable5.Data = dnames;
    handles.popupmenuControlROI.String = roiNames;
    guidata(hObject, handles);
  end
  
%  guidata(hObject, handles);
end

function adjustR2(hObject, handles)
% hObject    handle to pushbuttonAdjustR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  numRois = size(handles.Rois, 2);
  if numRois > 2
    cnames = {'Concentration [Fe]', '1/T2_linear', '1/T2_exp1'};
    rnames = {};
  %  rnames = cell(size(handles.poly1InvT2, 2) + 2 + 15, 1);
  %  dnames = {};
    dnames = cell(size(handles.poly1InvT2, 2) + 2 + 10, 3);

    for i = 1 : size(handles.poly1InvT2, 2)
      dnames{i, 2} = handles.poly1InvT2{i};
      dnames{i, 3} = handles.exp1InvT2{i};
    end

%     for i = 1:size([handles.uitable3.Data{:,1}], 2)
%       handles.feRoi{i} = handles.uitable3.Data{i, 1};
%     end
%     for i = 1:size([handles.uitable3.Data{:,1}], 2)
%       handles.feRoi{i} = handles.uitable3.Data{i, 1};
%     end
%     handles.feRoi{end + 1} = 10 * (size([handles.uitable3.Data{:,1}], 2) + 1);
%    dnames = handles.feRoi;

%     if size(handles.feRoi, 1)
     for i = 1 : numRois
       if isempty(handles.uitable3.Data{i, 1})
         dnames{i, 1} = 10 * i;
         handles.uitable3.Data{i, 1} = dnames{i, 1};
       else
         dnames{i, 1} = handles.uitable3.Data{i, 1};
       end
%       handles.feRoi{i} = dnames{i, 1};
%        for i = 1 : size(handles.feRoi, 2)
%          dnames{i, 1} = handles.feRoi{i};
%        end
     end
%     for i = size(handles.feRoi, 2) + 1 : size(handles.poly1InvT2, 2)
%       dnames{i, 1} = 10 * i;
%       handles.feRoi{end + 1} = dnames{i, 1};
%     end

%    localData = [dnames{1:size(handles.poly1InvT2, 2), 1}];
    localData = [handles.uitable3.Data{1:size(handles.poly1InvT2, 2), 1}]';

    % LINEAR
    [poly1Poly1F, poly1Poly1Gof, poly1Poly1Output] = fit(localData(:), [handles.poly1InvT2{:}]', 'poly1');
    handles.fitPoly1Poly1Fs = poly1Poly1F;
    handles.fitPoly1Poly1Gofs = poly1Poly1Gof;
    handles.fitPoly1Poly1Outputs = poly1Poly1Output;
    % NON_LINEAR
    [poly1Exp1F, poly1Exp1Gof, poly1Exp1Output] = fit(localData(:), [handles.exp1InvT2{:}]', 'poly1');
    handles.fitPoly1Exp1Fs = poly1Exp1F;
    handles.fitPoly1Exp1Gofs = poly1Exp1Gof;
    handles.fitPoly1Exp1Outputs = poly1Exp1Output;

    poly1Poly1GofsNames = fieldnames(poly1Poly1Gof);
    poly1Poly1OutputsNames = fieldnames(poly1Poly1Output);
    poly1Poly1OutputsNames(3:4) = [];

    % LINEAR
    p1 = poly1Poly1F.p1;
    p2 = poly1Poly1F.p2
    r2 = p1;
    dnames{size(handles.poly1InvT2, 2) + 1, 2} = r2;    
    if size(handles.poly1InvT2, 2) > 2
%      interval = confint(poly1Poly1F);
%      errorB = (interval(1, 1) - interval(2, 1)) / 2.;
  %    SD_r2 = abs(errorB / p1^2);
%      SD_r2 = abs(errorB);
%      SD_r2 = linearSD(localData(:), feval(poly1Poly1F, localData(:)), p2, p1);
      SD_r2 = linearSD(localData(:), [handles.poly1InvT2{:}]', p2, p1);
      dnames{size(handles.poly1InvT2, 2) + 2, 2} = SD_r2;
    end
    handles.r2Linear = r2;
  %    handles.poly1InvT2{i} = inv(r2);
  %  end
    % NON_LINEAR
    p1 = poly1Exp1F.p1;
    p2 = poly1Exp1F.p2;
  %  r2 = -inv(p1);
    r2 = p1;
    dnames{size(handles.exp1InvT2, 2) + 1, 3} = r2;
    if size(handles.exp1InvT2, 2) > 2
%      interval = confint(poly1Exp1F);
%      errorB = (interval(1, 1) - interval(2, 1)) / 2.;
  %    SD_r2 = abs(errorB / p1^2);
%      SD_r2 = abs(errorB);
%      SD_r2 = linearSD(localData(:), feval(poly1Exp1F, localData(:)), p2, p1);
      SD_r2 = linearSD(localData(:), [handles.exp1InvT2{:}]', p2, p1);
      dnames{size(handles.poly1InvT2, 2) + 2, 3} = SD_r2;
    end
    handles.r2Exp1 = r2;

    for i = 1 : size(handles.exp1InvT2, 2)
      roiColor = getColor(handles.Rois{i}) * 255;
      rnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
  %    rnames{end + 1} = strcat('ROI_', num2str(i));
    end
    rnames{end + 1} = 'r2';
    rnames{end + 1} = 'SD_r2';
    for i = 1:size(poly1Poly1GofsNames, 1)
      rnames{end + 1} = poly1Poly1GofsNames{i};
    end
    for i = 1:size(poly1Poly1OutputsNames, 1)
      rnames{end + 1} = poly1Poly1OutputsNames{i};
    end

    % LINEAR
    offset = size(handles.poly1InvT2, 2) + 3;
    for i = offset:size(poly1Poly1GofsNames, 1) + offset - 1
      dnames{i, 2} = getfield(poly1Poly1Gof, poly1Poly1GofsNames{i - offset + 1});
    end
    offset = offset + size(poly1Poly1GofsNames, 1);
    for i = offset:size(poly1Poly1OutputsNames, 1) + offset - 1
      dnames{i, 2} = getfield(poly1Poly1Output, poly1Poly1OutputsNames{i - offset + 1});
    end  
    % NON_LINEAR
    offset = size(handles.exp1InvT2, 2) + 3;
    for i = offset:size(poly1Poly1GofsNames, 1) + offset - 1
      dnames{i, 3} = getfield(poly1Exp1Gof, poly1Poly1GofsNames{i - offset + 1});
    end
    offset = offset + size(poly1Poly1GofsNames, 1);
    for i = offset:size(poly1Poly1OutputsNames, 1) + offset - 1
      dnames{i, 3} = getfield(poly1Exp1Output, poly1Poly1OutputsNames{i - offset + 1});
    end  

    handles.uitable3.ColumnName = cnames;
    handles.uitable3.RowName = rnames;
    handles.uitable3.Data = dnames;

    set(handles.uitable3, 'ColumnEditable', logical([1 0 0]))

    handles.popupmenuR2.Enable = 'on';

    % http://www.mathworks.com/matlabcentral/newsreader/view_thread/298335#802680
  %  numRois = size(handles.exp1InvT2, 2);
    numRois = size(handles.Rois, 2);
    jscroll = findjobj(handles.uitable3);
    rowHeaderViewport = jscroll.getComponent(4);
    rowHeader = rowHeaderViewport.getComponent(0);
    %height=rowHeader.getSize
    %rowHeader.setSize(80,360)
    newWidth = 100; % 100 pixels
    rowHeaderViewport.setPreferredSize(java.awt.Dimension(newWidth,0));
    height = rowHeader.getHeight;
    height = height + (100 * numRois);
    rowHeader.setPreferredSize(java.awt.Dimension(newWidth,height));
    rowHeader.setSize(newWidth,height);


    guidata(hObject, handles);
    plotR2(hObject, handles);
  end
end

function plotR2(hObject, handles)
% hObject    handle to pushbuttonPlotR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  
  handles.axes3.clo;

  % Determine the selected data set.
  str = handles.popupmenu3.String;
  val = handles.popupmenu3.Value;
  % Set current data to the selected data set.
  
  cla(handles.axes3, 'reset');

  xlabel(handles.axes3, 'Concentration Fe (ug/mL)') % x-axis label
  ylabel(handles.axes3, '1/T2 (ms^{-1})') % y-axis label

  hold(handles.axes3, 'on');
  
  localData = [handles.uitable3.Data{1:size(handles.poly1InvT2, 2), 1}]';
%  localData = [handles.feRoi{:}];
  if strcmp(str{val}, 'poly1')
    % LINEAR
      plot(handles.axes3, localData, feval(handles.fitPoly1Poly1Fs, localData), '-', 'Color', 'Blue');
      plot(handles.axes3, localData, [handles.poly1InvT2{:}], 'o', 'Color', 'Red');
  else
    % NON_LINEAR
      plot(handles.axes3, localData, feval(handles.fitPoly1Exp1Fs, localData), '-', 'Color', 'Blue');
      plot(handles.axes3, localData, [handles.exp1InvT2{:}], 'o', 'Color', 'Red');
  end
  hold(handles.axes3, 'off');

  guidata(hObject, handles);
end

% --- Executes on button press in pushbuttonTableT2.
function pushbuttonTableT2_Callback(hObject, eventdata, handles)
  % hObject    handle to pushbuttonTableT2 (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)

%     k=1;
%     for i = 1 : size(handles.Rois, 2)
%     if ~ (handles.Rois{i}.isvalid)
% %      imMask(:, :, end + 1) = 
% %      mask = uint16(createMask(Rois{i}, imHandle));
% %      appliedRoiStruct{end + 1} = {};
% %      for j = 1:size(dicomStruct)
% %          appliedRoiStruct(k,j,:,:) = mask .* uint16(dicomStruct{j}{2});
% %        appliedRoiStruct{k}{j} = uint16(mask) .* uint16(dicomStruct{j}{2});
% %      end
%       k =+ 1;
% %      appliedRoiStruct{end+1} = {tempMask};
%     end
%   end  
  
%   handles.uitable1.Visible = 'on';
%   handles.uitable2.Visible = 'off';
%   handles.uitable3.Visible = 'off';
%   handles.popupmenu1.Visible = 'on';
%   handles.popupmenu2.Visible = 'off';
%   handles.popupmenu3.Visible = 'off';
%   handles.axes2.Visible = 'off';
%   handles.axes3.Visible = 'off';
%   handles.axes2.clo;
%   handles.axes3.clo;

  
%  cnames = {'X','Y','Z'};
%  rnames = {'First','Second','Third'};

  handles.RoisMasks = getMasks(handles.axes1, handles.Rois);
  szMasks = size(handles.RoisMasks, 3);
  %szdicomStruct = size(handles.dicomStruct, 1);
  roiStats = zeros(handles.dicomStructSize, szMasks + 1);

  %roisStats(:,1) = 8;

%  cnames = {'<HTML><FONT color=rgb(0,0,255)>TE</FONT></HTML>'};
  cnames = {'TE'};
  rnames = {};
  for i = 1 : szMasks
%    cnames{end + 1} = strcat('ROI_',num2str(i));
    roiColor = getColor(handles.Rois{i}) * 255;
    cnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
%    cnames{end + 1} = strcat('ROI_',num2str(i));
  end

  for i = 1 : handles.dicomStructSize
    rnames{end + 1} = strcat('im_',num2str(i));
    roiStats(i, 1) = i * 8;
  end

  % Determine the selected data set.
  str = handles.popupmenu1.String;
  val = handles.popupmenu1.Value;
  % Set current data to the selected data set.

  for i = 1 : handles.dicomStructSize
    for j = 1 : szMasks
  %        roiStats(i, j + 1) = applyRoiFunc('mean', handles.dicomStruct{i}{2}, handles.RoisMasks(:, :, j));
      roiStats(i, j + 1) = applyRoiFunc(str{val}, handles.dicomStruct{i}{2}, handles.RoisMasks(:, :, j));
    end
  end

  handles.uitable1.ColumnName = cnames;
  handles.uitable1.RowName = rnames;
  %handles.uitable1.ColumnName = {'X','Y','Z'};
  %handles.uitable1.RowName = {'First','Second','Third'};
  %handles.uitable1.Data = [1 2 3; 4 5 6; 7 8 9];
  handles.uitable1.Data = roiStats;

  guidata(hObject, handles);
end

% --- Executes on button press in pushbuttonPlotT2.
function pushbuttonPlotT2_Callback(hObject, eventdata, handles)
  % hObject    handle to pushbuttonPlotT2 (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)

%   handles.uitable1.Visible = 'off';
%   handles.uitable2.Visible = 'off';
%   handles.uitable3.Visible = 'off';
%   handles.popupmenu1.Visible = 'off';
%   handles.popupmenu2.Visible = 'on';
%   handles.popupmenu3.Visible = 'off';
%   handles.axes2.Visible = 'on';
%   handles.axes3.Visible = 'off';
   handles.axes2.clo;
%   handles.axes3.clo;


  %handles.RoisMasks = getMasks(handles.axes1, handles.Rois);

  localData = handles.uitable1.Data;
  %localData = localData';
  
  handles.fitExp1Fs = cell(1, size(localData, 2) - 1);
  handles.fitExp1Gofs = cell(1, size(localData, 2) - 1);
  handles.fitExp1Outputs = cell(1, size(localData, 2) - 1);
  handles.fitPoly1Fs = cell(1, size(localData, 2) - 1);
  handles.fitPoly1Gofs = cell(1, size(localData, 2) - 1);
  handles.fitPoly1Outputs = cell(1, size(localData, 2) - 1);

  % CODIGO
  ft = fittype('a*exp(-x/b)+c', 'independent', 'x', 'dependent', 'y');
  opts = fitoptions('Method', 'NonlinearLeastSquares');
%  opts.Algorithm = 'Levenberg-Marquardt';
  opts.Display = 'Off';
  opts.StartPoint = [1 60 0];
  opts.Lower = [-10000 -10000 -1000];
  opts.Upper = [10000 10000 1000];
  opts.TolFun = 1e-09;
  opts.TolX = 1e-09;
  % CODIGO
  
  delta = 1 + realmin('double');
  
  for i = 1 : size(localData, 2) - 1
    % LINEAR
    [xData, yData] = prepareCurveData(localData(:, 1), localData(:, i + 1));
    xData = xData + delta;
    yData = yData + delta;
    [poly1F, poly1Gof, poly1Output] = fit(xData, log(yData), 'poly1');
%    [poly1F, poly1Gof, poly1Output] = fit(localData(:, 1), log(localData(:, i + 1)), 'poly1');
    handles.fitPoly1Fs{i} = poly1F;
    handles.fitPoly1Gofs{i} = poly1Gof;
    handles.fitPoly1Outputs{i} = poly1Output;
    % NON_LINEAR
    [exp1F, exp1Gof, exp1Output] = fit(xData, yData, ft, opts);
%    [exp1F, exp1Gof, exp1Output] = fit(localData(:, 1), localData(:, i + 1), ft, opts);
    handles.fitExp1Fs{i} = exp1F;
    handles.fitExp1Gofs{i} = exp1Gof;
    handles.fitExp1Outputs{i} = exp1Output;
  end
  
  % Determine the selected data set.
  str = handles.popupmenu2.String;
  val = handles.popupmenu2.Value;
  % Set current data to the selected data set.
    
%  cla(handles.axes3, 'reset');
%  cla(handles.axes2, 'reset');
%  cla(handles.axes2);

  xlabel(handles.axes2, 'TE (ms)') % x-axis label
  ylabel(handles.axes2, 'Intensity (A. U.)') % y-axis label

  hold(handles.axes2, 'on');
  
  if strcmp(str{val}, 'poly1')
    % LINEAR
    for i = 1 : size(localData, 2) - 1
      [xData, yData] = prepareCurveData(localData(:, 1), localData(:, i + 1));
      xData = xData + delta;
      yData = yData + delta;
%      localColorIndex = handles.axes2.ColorOrderIndex;
%      localColor = handles.axes2.ColorOrder(localColorIndex, :);
      plot(handles.axes2, xData, exp(feval(handles.fitPoly1Fs{i}, xData)), '-', 'Color', getColor(handles.Rois{i}));
      plot(handles.axes2, xData, yData, 'o', 'Color', getColor(handles.Rois{i}));
%      plot(handles.axes2, xData, exp(feval(handles.fitPoly1Fs{i}, xData)), '-', 'Color', localColor);
%      plot(handles.axes2, xData, yData, 'o', 'Color', localColor);
%      plot(handles.axes2, localData(:, 1), feval(handles.fitPoly1Fs{i}, localData(:, 1)), '-', 'Color', localColor);
%      plot(handles.axes2, localData(:, 1), log(localData(:, i + 1)), 'o', 'Color', localColor);
%      handles.axes2.ColorOrderIndex = handles.axes2.ColorOrderIndex - 1;
    end
  else
    % NON_LINEAR
    for i = 1 : size(localData, 2) - 1
%      localColorIndex = handles.axes2.ColorOrderIndex;
%      localColor = handles.axes2.ColorOrder(localColorIndex, :);
%      plot(handles.axes2, localData(:, 1), feval(handles.fitExp1Fs{i}, localData(:, 1)), '-', 'Color', localColor);
%      plot(handles.axes2, localData(:, 1), localData(:, i + 1), 'o', 'Color', localColor);
      plot(handles.axes2, localData(:, 1), feval(handles.fitExp1Fs{i}, localData(:, 1)), '-', 'Color', getColor(handles.Rois{i}));
      plot(handles.axes2, localData(:, 1), localData(:, i + 1), 'o', 'Color', getColor(handles.Rois{i}));
%      handles.axes2.ColorOrderIndex = handles.axes2.ColorOrderIndex - 1;
    end
  end
  hold(handles.axes2, 'off');

  %appliedRoiStruct = applyRoiMask(handles.axes1, handles.dicomStruct, handles.Rois);

%  disp('test');

  %imshow(imadjust(squeeze(appliedRoiStruct(1,1,:,:))), 'Parent', handles.axes2);

  %imshow(imadjust(appliedRoiStruct{1}{1}), 'Parent', handles.axes2);
  guidata(hObject, handles);

end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
  % hObject    handle to popupmenu1 (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)

  % Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
  %        contents{get(hObject,'Value')} returns selected item from popupmenu1

  %handles.pushbutton9_Callback(hObject, eventdata, handles)
  
  tableT2(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
  % hObject    handle to popupmenu1 (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    empty - handles not created until after all CreateFcns called

  % Hint: listbox controls usually have a white background on Windows.
  %       See ISPC and COMPUTER.
  if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
      set(hObject,'BackgroundColor','white');
  end
end

% --- Executes on button press in pushbuttonAdjustT2.
function pushbuttonAdjustT2_Callback(hObject, eventdata, handles)
  % hObject    handle to pushbuttonAdjustT2 (see GCBO)
  % eventdata  reserved - to be defined in a future version of MATLAB
  % handles    structure with handles and user data (see GUIDATA)

%   handles.uitable1.Visible = 'off';
%   handles.uitable2.Visible = 'on';
%   handles.uitable3.Visible = 'off';
%   handles.popupmenu1.Visible = 'off';
%   handles.popupmenu2.Visible = 'off';
%   handles.popupmenu3.Visible = 'off';
%   handles.axes2.Visible = 'off';
%   handles.axes3.Visible = 'off';
%   handles.axes2.clo;
%   handles.axes3.clo;

  
%   handles.Fitfs{:}
%   handles.Fitgofs{:}
%   handles.Fitoutputs{:}

  poly1GofsNames = fieldnames(handles.fitPoly1Gofs{1});
  poly1OutputsNames = fieldnames(handles.fitPoly1Outputs{1});
  exp1GofsNames = fieldnames(handles.fitExp1Gofs{1});
  exp1OutputsNames = fieldnames(handles.fitExp1Outputs{1});

  poly1OutputsNames(3:4) = [];
  exp1OutputsNames(3:4) = [];
  dnames = cell(2 + size(exp1GofsNames, 1) + size(exp1OutputsNames, 1), 2 * size(handles.fitExp1Gofs, 2));

  temp = exp1OutputsNames{4};
  exp1OutputsNames{4} = exp1OutputsNames{8};
  exp1OutputsNames{8} = temp;
  
  handles.poly1InvT2 = cell(1, size(handles.fitPoly1Fs, 2));
  handles.exp1InvT2 = cell(1, size(handles.fitExp1Fs, 2));
  % LINEAR
  for i = 1 : size(handles.fitPoly1Fs, 2) 
    p1 = handles.fitPoly1Fs{i}.p1;
    T2 = -inv(p1);
    interval = confint(handles.fitPoly1Fs{i});
    errorB = (interval(1, 1) - interval(2, 1)) / 2.;
    SD_T2 = abs(errorB / p1^2);
    dnames{1, 2 * i - 1} = T2;
    dnames{2, 2 * i - 1} = SD_T2;
    handles.poly1InvT2{i} = inv(T2);
  end
  % NON_LINEAR
  for i = 1 : size(handles.fitExp1Fs, 2) 
    b = handles.fitExp1Fs{i}.b;
    T2 = b;
    interval = confint(handles.fitExp1Fs{i});
    SD_T2 = abs(interval(1, 2) - interval(2, 2)) / 2.;
%    errorB = (interval(1, 2) - interval(2, 2)) / 2.;
%    SD_T2 = abs(errorB / b^2);
    dnames{1, 2 * i} = T2;
    dnames{2, 2 * i} = SD_T2;
    handles.exp1InvT2{i} = inv(T2);
  end
  
  % LINEAR
  for i = 1:size(poly1GofsNames, 1)
    for j = 1:size(handles.fitPoly1Gofs, 2)
      dnames{i + 2, 2 * j - 1} = getfield(handles.fitPoly1Gofs{j}, exp1GofsNames{i});
    end
  end
  for i = 1:size(poly1OutputsNames, 1)
    for j = 1:size(handles.fitPoly1Outputs, 2)
      dnames{i + 7, 2 * j - 1} = getfield(handles.fitPoly1Outputs{j}, poly1OutputsNames{i});
    end
  end
  % NON_LINEAR
  for i = 1:size(exp1GofsNames, 1)
    for j = 1:size(handles.fitExp1Gofs, 2)
      dnames{i + 2, 2 * j} = getfield(handles.fitExp1Gofs{j}, exp1GofsNames{i});
    end
  end
  for i = 1:size(exp1OutputsNames, 1)
    for j = 1:size(handles.fitExp1Outputs, 2)
      dnames{i + 7, 2 * j} = getfield(handles.fitExp1Outputs{j}, exp1OutputsNames{i});     
    end
  end
  
  cnames = { };
  rnames = ['T2'; 'SD_T2'; exp1GofsNames; exp1OutputsNames];

  for i = 1 : size(handles.fitExp1Gofs, 2)
    roiColor = getColor(handles.Rois{i}) * 255;
    cnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_linear</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
    cnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_exp1</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
    %cnames{end + 1} = strcat('ROI_', num2str(i), '_linear');
    %cnames{end + 1} = strcat('ROI_', num2str(i), '_exp1');
  end
  
  handles.uitable2.ColumnName = cnames;
  handles.uitable2.RowName = rnames;
  handles.uitable2.Data = dnames;

%  disp 'debug';
  
  %handles.uitable1.ColumnName = {'X','Y','Z'};
  %handles.uitable1.RowName = {'First','Second','Third'};
  %handles.uitable1.Data = [1 2 3; 4 5 6; 7 8 9];

  %handles.uitable1.Data = roiStats;

  %fieldnames(handles.gof)
  
  %getfield(gof,fnames{1})
  
  guidata(hObject, handles);
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2

plotT2(hObject, handles)
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
  if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
  end
end

% --- Executes on button press in pushbuttonPlotR2.
function pushbuttonPlotR2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonPlotR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  

%   handles.uitable1.Visible = 'off';
%   handles.uitable2.Visible = 'off';
%   handles.uitable3.Visible = 'off';
%   handles.popupmenu1.Visible = 'off';
%   handles.popupmenu2.Visible = 'off';
%   handles.popupmenu3.Visible = 'on';
%   handles.axes2.Visible = 'off';
%   handles.axes3.Visible = 'on';
%   handles.axes2.clo;
   handles.axes3.clo;

  
    % Determine the selected data set.
  str = handles.popupmenu3.String;
  val = handles.popupmenu3.Value;
  % Set current data to the selected data set.
  
%  cla(handles.axes2, 'reset');
%  handles.axes2.clo;
  cla(handles.axes3, 'reset');
%  cla(handles.axes3);

  xlabel(handles.axes3, 'Concentration Fe (ug/mL)') % x-axis label
  ylabel(handles.axes3, '1/T2 (ms^{-1})') % y-axis label

  hold(handles.axes3, 'on');

  localData = [handles.feRoi{:}];
  if strcmp(str{val}, 'poly1')
    % LINEAR
%    for i = 1 : size(localData, 2) - 1
%      localColorIndex = handles.axes3.ColorOrderIndex;
%      localColor = handles.axes3.ColorOrder(localColorIndex, :);
      plot(handles.axes3, localData, feval(handles.fitPoly1Poly1Fs, localData), '-', 'Color', 'Blue');
      plot(handles.axes3, localData, [handles.poly1InvT2{:}], 'o', 'Color', 'Red');
%      handles.axes3.ColorOrderIndex = handles.axes2.ColorOrderIndex - 1;
%    end
  else
    % NON_LINEAR
%    for i = 1 : size(localData, 2) - 1
%      localColorIndex = handles.axes2.ColorOrderIndex;
%      localColor = handles.axes2.ColorOrder(localColorIndex, :);
      plot(handles.axes3, localData, feval(handles.fitPoly1Exp1Fs, localData), '-', 'Color', 'Blue');
      plot(handles.axes3, localData, [handles.exp1InvT2{:}], 'o', 'Color', 'Red');
%      handles.axes2.ColorOrderIndex = handles.axes2.ColorOrderIndex - 1;
%    end
  end
  hold(handles.axes3, 'off');

  guidata(hObject, handles);

end

% --- Executes on button press in pushbuttonAdjustR2.
function pushbuttonAdjustR2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAdjustR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%   handles.uitable1.Visible = 'off';
%   handles.uitable2.Visible = 'off';
%   handles.uitable3.Visible = 'on';
%   handles.popupmenu1.Visible = 'off';
%   handles.popupmenu2.Visible = 'off';
%   handles.popupmenu3.Visible = 'off';
%   handles.axes2.Visible = 'off';
%   handles.axes3.Visible = 'off';
%   handles.axes2.clo;
%   handles.axes3.clo;
  
  cnames = {'Concentration [Fe]', '1/T2_linear', '1/T2_exp1'};
  rnames = {};
%  rnames = cell(size(handles.poly1InvT2, 2) + 2 + 15, 1);
%  dnames = {};
  dnames = cell(size(handles.poly1InvT2, 2) + 2 + 10, 3);

  for i = 1 : size(handles.poly1InvT2, 2)
    dnames{i, 2} = handles.poly1InvT2{i};
    dnames{i, 3} = handles.exp1InvT2{i};
  end
  
  for i = 1:size([handles.uitable3.Data{:,1}], 2)
    handles.feRoi{i} = handles.uitable3.Data{i, 1};
  end
  
  if size(handles.feRoi, 1)
%     for i = 1 : size(handles.poly1InvT2, 2)
    for i = 1 : size(handles.feRoi, 2)
      dnames{i, 1} = handles.feRoi{i};
    end
  end
  for i = size(handles.feRoi, 2) + 1 : size(handles.poly1InvT2, 2)
    dnames{i, 1} = 10 * i;
    handles.feRoi{end + 1} = dnames{i, 1};
  end

%   poly1GofsNames = fieldnames(handles.fitR2Poly1Gofs{1});
%   poly1OutputsNames = fieldnames(handles.fitR2Poly1Outputs{1});
%   exp1GofsNames = fieldnames(handles.fitR2Exp1Gofs{1});
%   exp1OutputsNames = fieldnames(handles.fitR2Exp1Outputs{1});
% 
%   poly1OutputsNames(3:4) = [];
%   exp1OutputsNames(3:4) = [];
%   dnames = cell(2 + size(exp1GofsNames, 1) + size(exp1OutputsNames, 1), 2 * size(handles.fitR2Exp1Gofs, 2));
% 
%   temp = exp1OutputsNames{4};
%   exp1OutputsNames{4} = exp1OutputsNames{8};
%   exp1OutputsNames{8} = temp;

  localData = [dnames{1:size(handles.poly1InvT2, 2), 1}];

%  for i = 1 : size(localData, 2)
  % LINEAR
  [poly1Poly1F, poly1Poly1Gof, poly1Poly1Output] = fit(localData(:), [handles.poly1InvT2{:}]', 'poly1');
  handles.fitPoly1Poly1Fs = poly1Poly1F;
  handles.fitPoly1Poly1Gofs = poly1Poly1Gof;
  handles.fitPoly1Poly1Outputs = poly1Poly1Output;
  % NON_LINEAR
  [poly1Exp1F, poly1Exp1Gof, poly1Exp1Output] = fit(localData(:), [handles.exp1InvT2{:}]', 'poly1');
  handles.fitPoly1Exp1Fs = poly1Exp1F;
  handles.fitPoly1Exp1Gofs = poly1Exp1Gof;
  handles.fitPoly1Exp1Outputs = poly1Exp1Output;
%  end

  poly1Poly1GofsNames = fieldnames(poly1Poly1Gof);
  poly1Poly1OutputsNames = fieldnames(poly1Poly1Output);
  poly1Poly1OutputsNames(3:4) = [];
   
    % LINEAR
%  for i = 1 : size(handles.fitPoly1Fs, 2) 
  p1 = poly1Poly1F.p1;
%  r2 = -inv(p1);
  r2 = p1;
  dnames{size(handles.poly1InvT2, 2) + 1, 2} = r2;    
  if size(handles.poly1InvT2, 2) > 2
    interval = confint(poly1Poly1F);
    errorB = (interval(1, 1) - interval(2, 1)) / 2.;
%    SD_r2 = abs(errorB / p1^2);
    SD_r2 = abs(errorB);
    dnames{size(handles.poly1InvT2, 2) + 2, 2} = SD_r2;
  end
  handles.r2Linear = r2;
%    handles.poly1InvT2{i} = inv(r2);
%  end
  % NON_LINEAR
  p1 = poly1Exp1F.p1;
%  r2 = -inv(p1);
  r2 = p1;
  dnames{size(handles.exp1InvT2, 2) + 1, 3} = r2;
  if size(handles.exp1InvT2, 2) > 2
    interval = confint(poly1Exp1F);
    errorB = (interval(1, 1) - interval(2, 1)) / 2.;
%    SD_r2 = abs(errorB / p1^2);
    SD_r2 = abs(errorB);
    dnames{size(handles.poly1InvT2, 2) + 2, 3} = SD_r2;
  end
  handles.r2Exp1 = r2;

  for i = 1 : size(handles.exp1InvT2, 2)
%    roiColor = getColor(handles.Rois{i}) * 255;
%    rnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), i);
    rnames{end + 1} = strcat('ROI_', num2str(i));
  end
  rnames{end + 1} = 'r2';
  rnames{end + 1} = 'SD_r2';
  for i = 1:size(poly1Poly1GofsNames, 1)
      rnames{end + 1} = poly1Poly1GofsNames{i};
  end
  for i = 1:size(poly1Poly1OutputsNames, 1)
      rnames{end + 1} = poly1Poly1OutputsNames{i};
  end
  
  % LINEAR
  offset = size(handles.poly1InvT2, 2) + 3;
  for i = offset:size(poly1Poly1GofsNames, 1) + offset - 1
    dnames{i, 2} = getfield(poly1Poly1Gof, poly1Poly1GofsNames{i - offset + 1});
  end
  offset = offset + size(poly1Poly1GofsNames, 1);
  for i = offset:size(poly1Poly1OutputsNames, 1) + offset - 1
    dnames{i, 2} = getfield(poly1Poly1Output, poly1Poly1OutputsNames{i - offset + 1});
  end  
  % NON_LINEAR
  offset = size(handles.exp1InvT2, 2) + 3;
  for i = offset:size(poly1Poly1GofsNames, 1) + offset - 1
    dnames{i, 3} = getfield(poly1Exp1Gof, poly1Poly1GofsNames{i - offset + 1});
  end
  offset = offset + size(poly1Poly1GofsNames, 1);
  for i = offset:size(poly1Poly1OutputsNames, 1) + offset - 1
    dnames{i, 3} = getfield(poly1Exp1Output, poly1Poly1OutputsNames{i - offset + 1});
  end  

  handles.uitable3.ColumnName = cnames;
  handles.uitable3.RowName = rnames;
  handles.uitable3.Data = dnames;
  
  set(handles.uitable3, 'ColumnEditable', logical([1 0 0]))
  
  handles.popupmenuR2.Enable = 'on';
%  handles.popupmenuR2.Value = 2;
%  handles.editR2.String = num2str(handles.r2Exp1);
%  handles.editR2.Enable = 'off';

%   handles.feRoi = { };
%   for i = 1:size(handles.poly1InvT2, 2)
% %    handles.feRoi{end + 1} = dnames{i, 1};
%     handles.feRoi{end + 1} = handles.uitable3.Data{i, 1};
%   end
  
  guidata(hObject, handles);
end

% --- Executes on selection change in popupmenu3.
function popupmenuSubstanceType_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3

items = get(hObject,'String');
index_selected = get(hObject,'Value');
item_selected = items{index_selected};
%display(item_selected);

  switch item_selected
    case 'Substance' 
      handles.editCellQuantity.Enable = 'off';
      handles.textCellQuantity.Enable = 'off';
      handles.textQuantificationOfIronContent.String = 'Quantification Of Iron Content Of Substance';
    case 'Cell'
      handles.editCellQuantity.Enable = 'on';
      handles.textCellQuantity.Enable = 'on';
      handles.textQuantificationOfIronContent.String = 'Quantification Of Iron Content Of Cell';
    case 'Tissue'
      handles.editCellQuantity.Enable = 'on';
      handles.textCellQuantity.Enable = 'on';
      handles.textQuantificationOfIronContent.String = 'Quantification Of Iron Content Of Tissue';
    otherwise
      handles.editCellQuantity.Enable = 'on';
      handles.textCellQuantity.Enable = 'on';
      handles.textQuantificationOfIronContent.String = ['Quantification Of Iron Content Of ' item_selected];
  end


end

% --- Executes during object creation, after setting all properties.
function popupmenuSubstanceType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --------------------------------------------------------------------
function Draw_ROI_Callback(hObject, eventdata, handles)
% hObject    handle to Draw_ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --------------------------------------------------------------------
function Point_Callback(hObject, eventdata, handles)
% hObject    handle to Point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  h = impoint(handles.axes1);
  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    h = impoint(handles.axes1);
  else
    h = impoint(handles.axes4);
  end

  %wait(h);
  roiAdd(h, hObject, eventdata, handles);
%   color = handles.roiColorsName{mod(handles.roiColorsCount, size(handles.roiColorsName, 2)) + 1};
%   setColor(h, color);
%   handles.roiColorsCount = handles.roiColorsCount + 1;
%   handles.Rois{end + 1} = h;
%   %imshow(getMask(handles.axes1, handles.Rois),'Parent', handles.axes2);
% 
%   guidata(hObject, handles);

end

% --------------------------------------------------------------------
function Line_Callback(hObject, eventdata, handles)
% hObject    handle to Line (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  h = imline(handles.axes1);
  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    h = imline(handles.axes1);
  else
    h = imline(handles.axes4);
  end  
  %wait(h);
  roiAdd(h, hObject, eventdata, handles);
%   color = handles.roiColorsName{mod(handles.roiColorsCount, size(handles.roiColorsName, 2)) + 1};
%   setColor(h, color);
%   handles.roiColorsCount = handles.roiColorsCount + 1;
%   handles.Rois{end + 1} = h;
%   %imshow(getMask(handles.axes1, handles.Rois),'Parent', handles.axes2);
% 
%   guidata(hObject, handles);

end

% --------------------------------------------------------------------
function Rectangle_Callback(hObject, eventdata, handles)
% hObject    handle to Rectangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  h = imrect(handles.axes1);
  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    h = imrect(handles.axes1);
  else
    h = imrect(handles.axes4);
  end  
  %wait(h);
  roiAdd(h, hObject, eventdata, handles);

%   color = handles.roiColorsName{mod(handles.roiColorsCount, size(handles.roiColorsName, 2)) + 1};
%   setColor(h, color);
%   handles.roiColorsCount = handles.roiColorsCount + 1;
%   handles.Rois{end + 1} = h;
%   %imshow(getMask(handles.axes1, handles.Rois),'Parent', handles.axes2);
% 
%   guidata(hObject, handles);

end

function roiDelete(ObjH, EventData, hObject, handles)

  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
  %  delete(ObjH);
    buf1 = cell(1, size(handles.Rois, 2) - 1);
%    buf2 = cell(1, size(handles.Rois, 2) - 1);
    k = 1;
    for i = 1:size(handles.Rois, 2)
      if handles.Rois{i}.isvalid
  %      handles.Rois(i) = [];
        buf1{k} = handles.Rois{i};
  %      buf2{k} = handles.roiListenerHandles{k};
        k = k + 1;
  %       i = i + 1;
      else
  %      delete(handles.roiListenerHandles{k})
  %       delete(handles.Rois{i});      
      end
    end
  %   buf = cell(1, size(handles.Rois, 2) - 1);
  %   k = 1;
  %   for i = 1:size(handles.roiListenerHandles, 2)
  %     delete(handles.roiListenerHandles{i});
  % %    handles.roiListenerHandles{i}.Enabled = false;
  %   end

    handles.Rois = buf1;
  %  handles.roiListenerHandles = buf2;
  else
    buf1 = cell(1, size(handles.RoisFe, 2) - 1);
    k = 1;
    for i = 1:size(handles.RoisFe, 2)
      if handles.RoisFe{i}.isvalid
        buf1{k} = handles.RoisFe{i};
        k = k + 1;
      end
    end
    handles.RoisFe = buf1;
  end
  guidata(hObject, handles);
%  roiUpdateHandles(hObject, guidata(hObject));

%  pushbuttonTableT2_Callback(ObjH, EventData, guidata(ObjH))
  tableT2(hObject, handles);
%  plotT2(hObject, handles);
%  adjustT2(hObject, handles);

%  disp('escutei!')
end

function roiAdd(h, hObject, eventdata, handles)
  addlistener(h, 'ObjectBeingDestroyed', @(ObjH, EventData) roiDelete(ObjH, EventData, hObject, guidata(get(ObjH, 'Parent'))));
  addNewPositionCallback(h, @(pos) tableT2(hObject, guidata(get(h, 'Parent'))));
%  addNewPositionCallback(h, @(pos) plotT2(hObject, guidata(get(h, 'Parent'))));
%  addNewPositionCallback(h, @(pos) adjustT2(hObject, guidata(get(h, 'Parent'))));
  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    color = handles.roiColorsName{mod(handles.roiColorsCount, size(handles.roiColorsName, 2)) + 1};
    setColor(h, color);
    handles.roiColorsCount = handles.roiColorsCount + 1;
    handles.Rois{end + 1} = h;
  else
    color = handles.roiColorsName{mod(handles.roiColorsCountFe, size(handles.roiColorsName, 2)) + 1};
    setColor(h, color);
    handles.roiColorsCountFe = handles.roiColorsCountFe + 1;
    handles.RoisFe{end + 1} = h;
  end
  guidata(hObject, handles);
  tableT2(hObject, handles);
%  plotT2(hObject, handles);
%  adjustT2(hObject, handles);
end

% --------------------------------------------------------------------
function Ellipse_Callback(hObject, eventdata, handles)
% hObject    handle to Ellipse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  %h = imellipse(axes1Parent);
  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    h = imellipse(handles.axes1);
  else
    h = imellipse(handles.axes4);
  end
  roiAdd(h, hObject, eventdata, handles);
% %  h.Deletable = false;
% %   handles.roiListenerHandles{end + 1} = 
%    addlistener(h, 'ObjectBeingDestroyed', @(ObjH, EventData) roiDelete(ObjH, EventData, hObject, guidata(get(ObjH, 'Parent'))));
%    addNewPositionCallback(h, @(pos) tableT2(hObject, guidata(get(h, 'Parent'))));
% %  addlistener(h, 'ObjectBeingDestroyed', @(ObjH, EventData) roiDelete(ObjH, EventData, handles.Rois))
%   %wait(h);
%   color = handles.roiColorsName{mod(handles.roiColorsCount, size(handles.roiColorsName, 2)) + 1};
%   setColor(h, color);
%   handles.roiColorsCount = handles.roiColorsCount + 1;
%   handles.Rois{end + 1} = h;
%     
% %  pos = getPosition(h);
%   guidata(hObject, handles);
% %  roiUpdateHandles(hObject, handles);
%   tableT2(hObject, handles);

end

% --------------------------------------------------------------------
function Polygon_Callback(hObject, eventdata, handles)
% hObject    handle to Polygon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%  h = impoly(handles.axes1);
  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    h = impoly(handles.axes1);
  else
    h = impoly(handles.axes4);
  end  
  %wait(h);
  roiAdd(h, hObject, eventdata, handles);
%   color = handles.roiColorsName{mod(handles.roiColorsCount, size(handles.roiColorsName, 2)) + 1};
%   setColor(h, color);
%   handles.roiColorsCount = handles.roiColorsCount + 1;
%   handles.Rois{end + 1} = h;
%   %imshow(getMask(handles.axes1, handles.Rois),'Parent',handles.axes2);
% 
%   guidata(hObject, handles);

end

% --------------------------------------------------------------------
function Free_Hand_Callback(hObject, eventdata, handles)
% hObject    handle to Free_Hand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%  h = imfreehand(handles.axes1);
  if strcmp(handles.tgroupMain.SelectedTab.Title, 'r2 calculation')
    h = imfreehand(handles.axes1);
  else
    h = imfreehand(handles.axes4);
  end  
  roiAdd(h, hObject, eventdata, handles);
  %wait(h);
%   color = handles.roiColorsName{mod(handles.roiColorsCount, size(handles.roiColorsName, 2)) + 1};
%   setColor(h, color);
%   handles.roiColorsCount = handles.roiColorsCount + 1;
%   handles.Rois{end + 1} = h;
% 
%   guidata(hObject, handles);
  
end

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end

% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

infoStrs = {'VNano 1.0 (Copyright) 2016', 'David Macedo da Conceicao (davidbrsp@gmail.com)', 'Lionel Gamarra (lionelgamarra7@gmail.com)'};
myicon = imread('images/about.jpg');
fontName = 'Helvetica';
fontSize = 16;
msgHandle = msgbox(infoStrs, 'About', 'custom', myicon);

% ah = get( msgHandle, 'CurrentAxes' );
% ch = get( ah, 'Children' );
% set( ch, 'FontSize', 20 ); %makes text bigger


% uicontrol(msgHandle, 'FontSize', 16.0);

% set( msgHandle, 'Visible', 'off' );
% 
% get handles to the UIControls ([OK] PushButton) and Text
%kids0 = findobj( msgHandle, 'Type', 'UIControl' );
kids1 = findobj(msgHandle, 'Type', 'Text');

% change the font and fontsize
extent0 = get(kids1, 'Extent'); % text extent in old font
%set( [kids0, kids1], 'FontName', fontName, 'FontSize', fontSize );
set(kids1, 'FontName', fontName, 'FontSize', fontSize);
extent1 = get(kids1, 'Extent'); % text extent in new font

% need to resize the msgbox object to accommodate new FontName and FontSize
delta = extent1 - extent0; % change in extent
pos = get(msgHandle, 'Position'); % msgbox current position
pos = pos + delta; % change size of msgbox
set(msgHandle, 'Position', pos); % set new position

% set( msgHandle, 'Visible', 'on' );

end

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4

  tableT2(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5

plotT2(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in pushbuttonPlotT2Fe.
function pushbuttonPlotT2Fe_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonPlotT2Fe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes on button press in pushbuttonAdjustT2Fe.
function pushbuttonAdjustT2Fe_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAdjustT2Fe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

function editAtomicMass_Callback(hObject, eventdata, handles)
% hObject    handle to editAtomicMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editAtomicMass as text
%        str2double(get(hObject,'String')) returns contents of editAtomicMass as a double
end

% --- Executes during object creation, after setting all properties.
function editAtomicMass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAtomicMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editOxideDensity_Callback(hObject, eventdata, handles)
% hObject    handle to editOxideDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOxideDensity as text
%        str2double(get(hObject,'String')) returns contents of editOxideDensity as a double
end

% --- Executes during object creation, after setting all properties.
function editOxideDensity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOxideDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editDiameter_Callback(hObject, eventdata, handles)
% hObject    handle to editDiameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDiameter as text
%        str2double(get(hObject,'String')) returns contents of editDiameter as a double
end

% --- Executes during object creation, after setting all properties.
function editDiameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDiameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editOxideMolecularWeight_Callback(hObject, eventdata, handles)
% hObject    handle to editOxideMolecularWeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editOxideMolecularWeight as text
%        str2double(get(hObject,'String')) returns contents of editOxideMolecularWeight as a double
end

% --- Executes during object creation, after setting all properties.
function editOxideMolecularWeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editOxideMolecularWeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editFeMolecularMass_Callback(hObject, eventdata, handles)
% hObject    handle to editFeMolecularMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFeMolecularMass as text
%        str2double(get(hObject,'String')) returns contents of editFeMolecularMass as a double
end

% --- Executes during object creation, after setting all properties.
function editFeMolecularMass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFeMolecularMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editWellWeight_Callback(hObject, eventdata, handles)
% hObject    handle to editWellWeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editWellWeight as text
%        str2double(get(hObject,'String')) returns contents of editWellWeight as a double
end

% --- Executes during object creation, after setting all properties.
function editWellWeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editWellWeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editCellQuantity_Callback(hObject, eventdata, handles)
% hObject    handle to editCellQuantity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCellQuantity as text
%        str2double(get(hObject,'String')) returns contents of editCellQuantity as a double
end

% --- Executes during object creation, after setting all properties.
function editCellQuantity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCellQuantity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editVolumeAgarose_Callback(hObject, eventdata, handles)
% hObject    handle to editVolumeAgarose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editVolumeAgarose as text
%        str2double(get(hObject,'String')) returns contents of editVolumeAgarose as a double
end

% --- Executes during object creation, after setting all properties.
function editVolumeAgarose_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editVolumeAgarose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editSliceThickness_Callback(hObject, eventdata, handles)
% hObject    handle to editSliceThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSliceThickness as text
%        str2double(get(hObject,'String')) returns contents of editSliceThickness as a double
end

% --- Executes during object creation, after setting all properties.
function editSliceThickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSliceThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editR2_Callback(hObject, eventdata, handles)
% hObject    handle to editR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editR2 as text
%        str2double(get(hObject,'String')) returns contents of editR2 as a double
end

% --- Executes during object creation, after setting all properties.
function editR2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in pushbuttonQuantification.
function pushbuttonQuantification_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonQuantification (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  items = get(handles.popupmenuSubstanceType, 'String');
  index_selected = get(handles.popupmenuSubstanceType, 'Value');
  item_selected = items{index_selected};

  Ma  = .0;  % atomic mass
  Mx  = .0;  % Molecular weight oxide 
  Do  = .0;  % Density oxide (g/m3)
  D   = .0;   % Diameter (nm)
  MFe = .0; % Molecular weight Fe 
  H   = .0;   % Well height (mm)
  Nc  = .0;  % Number of cells
  Va  = .0;  % Sample volume (mL)
  EF  = .0;  % slice thickness (mm)
  r2  = .0;  % r2(ms-1mg-1mL)

  Ma  = str2double(handles.editAtomicMass.String);
  Mx  = str2double(handles.editOxideMolecularWeight.String);
  Do  = str2double(handles.editOxideDensity.String);
  D   = str2double(handles.editDiameter.String);
  MFe = str2double(handles.editFeMolecularMass.String);
  H   = str2double(handles.editWellWeight.String);
  Nc  = str2double(handles.editCellQuantity.String);
  Va  = str2double(handles.editVolumeAgarose.String);
  EF  = str2double(handles.editSliceThickness.String);
  r2  = str2double(handles.editR2.String);
  
%  disp(Ma); disp(Mx); disp(Do); disp(D); disp(MFe); disp(H); disp(Nc); disp(Va); disp(EF);

%   CF   = .0; % Iron concentration
%   CM   = .0; % Molar concentration
%   CFVa = .0; % Iron concentration per Sample Volume
%   CNP  = .0; % concentration of nanoparticles
%   NNPt = .0; % Total nano particles

  index_selected = get(handles.popupmenuControlROI, 'Value');

  n = 1 : size(handles.uitable5.Data, 2) / 2;
  
  poly1T2 = handles.uitable5.Data(1, 2 * n - 1);
  poly1T2Control = poly1T2{index_selected};
  poly1T2(index_selected) = [];
  exp1T2 = handles.uitable5.Data(1, 2 * n);
  exp1T2Control = exp1T2{index_selected};
  exp1T2(index_selected) = [];
  
  numRois = size(n, 2) - 1;
  poly1CF   = cell(1, numRois);
  poly1CM   = cell(1, numRois);
  poly1CFVa = cell(1, numRois);
  poly1CNP  = cell(1, numRois);
  poly1NNPt = cell(1, numRois);
  poly1NNPc = cell(1, numRois);
  exp1CF   = cell(1, numRois);
  exp1CM   = cell(1, numRois);
  exp1CFVa = cell(1, numRois);
  exp1CNP  = cell(1, numRois);
  exp1NNPt = cell(1, numRois);
  exp1NNPc = cell(1, numRois);
  % CF = (1 / T2_i - 1 / T2_c) / r2
  rnames = {};
  roiNumbers = 1:(numRois + 1);
  roiNumbers(index_selected) = [];
  dnames = cell(numRois * 4, 6);
  for i = 1 : numRois
    roiColor = getColor(handles.RoisFe{roiNumbers(i)}) * 255;
    %LINEAR
    poly1CF{i}   = (inv(poly1T2{i}) - inv(poly1T2Control)) / r2;  
    poly1CM{i}   = poly1CF{i} / Ma;
    poly1CFVa{i} = poly1CF{i} * Va;
    poly1CNP{i}  = (6 * 10^24 * poly1CF{i}   * Mx) / (pi * Do * D^3 * MFe);
    poly1NNPt{i} = (6 * 10^24 * poly1CFVa{i} * Mx) / (pi * Do * D^3 * MFe);
    rnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_poly1</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), roiNumbers(i));
    rnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_poly1_SD</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), roiNumbers(i));
%     rnames{end + 1} = ['ROI_' num2str(roiNumbers(i)) '_poly1'];
%     rnames{end + 1} = ['SD_ROI_' num2str(roiNumbers(i)) '_poly1'];
    dnames{(4 * i - 3), 1} = poly1CF{i};
    dnames{(4 * i - 2), 1} = .05 * poly1CF{i};
    dnames{(4 * i - 3), 2} = poly1CM{i};
    dnames{(4 * i - 2), 2} = .05 * poly1CM{i};
    dnames{(4 * i - 3), 3} = poly1CFVa{i};
    dnames{(4 * i - 2), 3} = .05 * poly1CFVa{i};
    dnames{(4 * i - 3), 4} = poly1CNP{i};
    dnames{(4 * i - 2), 4} = .05 * poly1CNP{i};
    dnames{(4 * i - 3), 5} = poly1NNPt{i};
    dnames{(4 * i - 2), 5} = .05 * poly1NNPt{i};
    %NON_LINEAR
    exp1CF{i}   = (inv(exp1T2{i}) - inv(exp1T2Control)) / r2;  
    exp1CM{i}   = exp1CF{i} / Ma;
    exp1CFVa{i} = exp1CF{i} * Va;
    exp1CNP{i}  = (6 * 10^24 * exp1CF{i}   * Mx) / (pi * Do * D^3 * MFe);
    exp1NNPt{i} = (6 * 10^24 * exp1CFVa{i} * Mx) / (pi * Do * D^3 * MFe);
    rnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_exp1</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), roiNumbers(i));
    rnames{end + 1} = sprintf('<HTML><FONT color=rgb(%d,%d,%d)>ROI_%d_exp1_SD</FONT></HTML>', roiColor(1), roiColor(2), roiColor(3), roiNumbers(i));
%     rnames{end + 1} = ['ROI_' num2str(roiNumbers(i)) '_exp1'];
%     rnames{end + 1} = ['SD_ROI_' num2str(roiNumbers(i)) '_exp1'];
    dnames{(4 * i - 1), 1} = exp1CF{i};
    dnames{(4 * i), 1} = .05 * exp1CF{i};
    dnames{(4 * i - 1), 2} = exp1CM{i};
    dnames{(4 * i), 2} = .05 * exp1CM{i};
    dnames{(4 * i - 1), 3} = exp1CFVa{i};
    dnames{(4 * i), 3} = .05 * exp1CFVa{i};
    dnames{(4 * i - 1), 4} = exp1CNP{i};
    dnames{(4 * i), 4} = .05 * exp1CNP{i};
    dnames{(4 * i - 1), 5} = exp1NNPt{i};
    dnames{(4 * i), 5} = .05 * exp1NNPt{i};
  end
  
% CF = (1 / T2_i - 1 / T2_c) / r2
% CM   = CF / Ma
% CFVa = CF * Va
% CNP  = (6 * 10^24 * CF   * Mx) / (pi * Do * D^3 * MFe)
% NNPt = (6 * 10^24 * CFVa * Mx) / (pi * Do * D^3 * MFe)
% NNPc = NNPt / Nc

  cnames = {'Fe Concentration | (mg/mL)', 'Molar concentration | (mol/L)', 'Fe load in the sample | volume (mg)', 'Nanoparticles | concentration (NP/mL)', 'Nanoparticles | number' };
  
  if strcmp(item_selected, 'Cell')
    cnames{end + 1} = 'Nanoparticles | per cell';
  end
  if strcmp(item_selected, 'Cell')
    for i = 1 : numRois
      %LINEAR
      poly1NNPc{i} = poly1NNPt{i} / Nc;
      dnames{(4 * i - 3), 6} = poly1NNPc{i};
      dnames{(4 * i - 2), 6} = .05 * poly1NNPc{i};
      %NON_LINEAR
      exp1NNPc{i} = exp1NNPt{i} / Nc;
      dnames{(4 * i - 1), 6} = exp1NNPc{i};
      dnames{(4 * i), 6} = .05 * exp1NNPc{i};
    end
  else
    dnames(:, 6) = [];
  end
  
%  rnames{end + 1} = '<html><b>teste</b></html>';
  handles.uitable6.ColumnName = cnames;
  handles.uitable6.RowName = rnames;
  %handles.uitable1.ColumnName = {'X','Y','Z'};
  %handles.uitable1.RowName = {'First','Second','Third'};
  %handles.uitable1.Data = [1 2 3; 4 5 6; 7 8 9];
  handles.uitable6.Data = dnames;

  % http://www.mathworks.com/matlabcentral/newsreader/view_thread/298335#802680
  jscroll=findjobj(handles.uitable6);
  rowHeaderViewport=jscroll.getComponent(4);
  rowHeader=rowHeaderViewport.getComponent(0);
  %height=rowHeader.getSize
  %rowHeader.setSize(80,360)
  newWidth=100; %100 pixels
  rowHeaderViewport.setPreferredSize(java.awt.Dimension(newWidth,0));
  height=rowHeader.getHeight;
  height=numRois * height;
  rowHeader.setPreferredSize(java.awt.Dimension(newWidth,height));
  rowHeader.setSize(newWidth,height);
  
  handles.tgroupFe.SelectedTab = handles.tabFeQuantification;
  
  guidata(hObject, handles);
end

% --- Executes on selection change in popupmenuControlROI.
function popupmenuControlROI_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuControlROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuControlROI contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuControlROI

items = get(hObject,'String');
index_selected = get(hObject,'Value');
item_selected = items{index_selected};
display(item_selected);

end

% --- Executes during object creation, after setting all properties.
function popupmenuControlROI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuControlROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3

  plotR2(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in popupmenuMaterial.
function popupmenuMaterial_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuMaterial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuMaterial contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuMaterial

items = get(hObject,'String');
index_selected = get(hObject,'Value');
item_selected = items{index_selected};
%display(item_selected);

  switch item_selected
    case 'Magnetite' 
      handles.editAtomicMass.String = num2str(handles.magnetiteMa);
      handles.editOxideMolecularWeight.String = num2str(handles.magnetiteMx);
      handles.editOxideDensity.String = num2str(handles.magnetiteDo);
      handles.editDiameter.String = num2str(handles.magnetiteD);
      handles.editFeMolecularMass.String = num2str(handles.magnetiteMFe);
      handles.editAtomicMass.Enable = 'off';
      handles.editOxideMolecularWeight.Enable = 'off';
      handles.editOxideDensity.Enable = 'off';
%      handles.editDiameter.Enable = 'off';
      handles.editFeMolecularMass.Enable = 'off';

%      handles.editCellQuantity.String = num2str(handles.magnetiteNc);
%      handles.editWellWeight.String = num2str(handles.magnetiteH);
%      handles.editVolumeAgarose.String = num2str(handles.magnetiteVa);
    case 'Maghemite'
      handles.editAtomicMass.String = num2str(handles.maghemiteMa);
      handles.editOxideMolecularWeight.String = num2str(handles.maghemiteMx);
      handles.editOxideDensity.String = num2str(handles.maghemiteDo);
      handles.editDiameter.String = num2str(handles.maghemiteD);
      handles.editFeMolecularMass.String = num2str(handles.maghemiteMFe);
      handles.editAtomicMass.Enable = 'off';
      handles.editOxideMolecularWeight.Enable = 'off';
      handles.editOxideDensity.Enable = 'off';
%      handles.editDiameter.Enable = 'off';
      handles.editFeMolecularMass.Enable = 'off';
%      handles.editCellQuantity.String = num2str(handles.maghemiteNc);
%      handles.editWellWeight.String = num2str(handles.maghemiteH);
%      handles.editVolumeAgarose.String = num2str(handles.maghemiteVa);
    otherwise
      handles.editAtomicMass.String = num2str(.0);
      handles.editOxideMolecularWeight.String = num2str(.0);
      handles.editOxideDensity.String = num2str(.0);
%      handles.editDiameter.String = num2str(.0);
      handles.editFeMolecularMass.String = num2str(.0);
      handles.editAtomicMass.Enable = 'on';
      handles.editOxideMolecularWeight.Enable = 'on';
      handles.editOxideDensity.Enable = 'on';
%      handles.editDiameter.Enable = 'on';
      handles.editFeMolecularMass.Enable = 'on';
%      handles.editCellQuantity.String = num2str(.0);
%      handles.editWellWeight.String = num2str(.0);
%      handles.editVolumeAgarose.String = num2str(.0);
  end


end

% --- Executes during object creation, after setting all properties.
function popupmenuMaterial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuMaterial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in popupmenuR2.
function popupmenuR2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuR2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuR2

items = get(hObject,'String');
index_selected = get(hObject,'Value');
item_selected = items{index_selected};
%display(item_selected);

  switch item_selected
    case 'Exp1' 
      handles.editR2.String = num2str(handles.r2Exp1);
      handles.editR2.Enable = 'off';
    case 'Linear'
      handles.editR2.String = num2str(handles.r2Linear);
      handles.editR2.Enable = 'off';
    otherwise
      handles.editR2.String = '';
      handles.editR2.Enable = 'on';
  end
end

% --- Executes during object creation, after setting all properties.
function popupmenuR2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --------------------------------------------------------------------
function Documentation_Callback(hObject, eventdata, handles)
% hObject    handle to Documentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  % http://www.mathworks.com/help/matlab/ref/open.html
  open('docs/doc.pdf')
end

function editTEO_Callback(hObject, eventdata, handles)
% hObject    handle to editTEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTEO as text
%        str2double(get(hObject,'String')) returns contents of editTEO as a double

tableT2(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function editTEO_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTEO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editDelta_Callback(hObject, eventdata, handles)
% hObject    handle to editDelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDelta as text
%        str2double(get(hObject,'String')) returns contents of editDelta as a double

tableT2(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function editDelta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in pushbuttonSaveTableT2.
function pushbuttonSaveTableT2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSaveTableT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  T = array2table(handles.uitable1.Data);
  T.Properties.RowNames = handles.uitable1.RowName;
  T.Properties.VariableNames = regexprep(handles.uitable1.ColumnName, '<[^>]*>', '');
  T.Properties.DimensionNames{1} = cell2mat(handles.popupmenu1.String(handles.popupmenu1.Value));

  [filename, pathname] = uiputfile('*.csv', 'Save Comma Separeted Version', 'r2CalculationTableT2.csv');
                       
  if isequal(filename,0) || isequal(pathname,0)
    disp('User selected Cancel')
  else
    disp(['User selected ', fullfile(pathname, filename)])
    writetable(T, fullfile(pathname, filename), 'WriteRowNames', true);
  end

end

% --- Executes on button press in pushbuttonSavePlotT2.
function pushbuttonSavePlotT2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSavePlotT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


  VariableNames = regexprep(handles.uitable1.ColumnName, '<[^>]*>', '');
  Data = zeros(size(handles.uitable1.Data) + [0 (2 * size(handles.fitPoly1Fs, 2))]);
  Data(:, 1:size(handles.uitable1.Data, 2)) = handles.uitable1.Data(:, :);
  for i = 1:size(handles.fitPoly1Fs, 2)
%    handles.fitPoly1Fs{i} = poly1F;
    Data(:, (2 * i - 1) + size(handles.uitable1.Data, 2) ) = exp(feval(handles.fitPoly1Fs{i}, Data(:, 1)));
    VariableNames{end + 1} = [VariableNames{i + 1} '_poly1'];
%    handles.fitExp1Fs{i} = exp1F;
    Data(:, (2 * i) + size(handles.uitable1.Data, 2) ) = feval(handles.fitExp1Fs{i}, Data(:, 1));
    VariableNames{end + 1} = [VariableNames{i + 1} '_exp1'];
  end

%  exp(feval(handles.fitPoly1Fs{i}, xData))



%  T = array2table(handles.uitable1.Data);
  T = array2table(Data);
  T.Properties.RowNames = handles.uitable1.RowName;
%  T.Properties.VariableNames = regexprep(handles.uitable1.ColumnName, '<[^>]*>', '');
  T.Properties.VariableNames = VariableNames;
  T.Properties.DimensionNames{1} = cell2mat(handles.popupmenu1.String(handles.popupmenu1.Value));

  [filename, pathname] = uiputfile('*.csv', 'Save Comma Separeted Version', 'r2CalculationPlotT2.csv');
                       
  if isequal(filename,0) || isequal(pathname,0)
    disp('User selected Cancel')
  else
    disp(['User selected ', fullfile(pathname, filename)])
    writetable(T, fullfile(pathname, filename), 'WriteRowNames', true);
  end
end

% --- Executes on button press in pushbuttonSaveAdjustT2.
function pushbuttonSaveAdjustT2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSaveAdjustT2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  T = array2table(handles.uitable2.Data);
  T.Properties.RowNames = handles.uitable2.RowName;
  T.Properties.VariableNames = regexprep(handles.uitable2.ColumnName, '<[^>]*>', '');
  T.Properties.DimensionNames{1} = cell2mat(handles.popupmenu1.String(handles.popupmenu1.Value));

  [filename, pathname] = uiputfile('*.csv', 'Save Comma Separeted Version', 'r2CalculationAdjustT2.csv');
                       
  if isequal(filename,0) || isequal(pathname,0)
    disp('User selected Cancel')
  else
    disp(['User selected ', fullfile(pathname, filename)])
    writetable(T, fullfile(pathname, filename), 'WriteRowNames', true, 'QuoteStrings', true);
  end
end

% --- Executes on button press in pushbuttonSaveAdjustR2.
function pushbuttonSaveAdjustR2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSaveAdjustR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  T = array2table(handles.uitable3.Data);
  T.Properties.RowNames = regexprep(handles.uitable3.RowName, '<[^>]*>', '');
  VariableNames = regexprep(handles.uitable3.ColumnName, '[ [^>]*]', '');
  T.Properties.VariableNames = regexprep(VariableNames, '1/', 'inv');
%  T.Properties.VariableNames = handles.uitable3.ColumnName;
  T.Properties.DimensionNames{1} = cell2mat(handles.popupmenu1.String(handles.popupmenu1.Value));

  [filename, pathname] = uiputfile('*.csv', 'Save Comma Separeted Version', 'r2CalculationAdjustR2.csv');
                       
  if isequal(filename,0) || isequal(pathname,0)
    disp('User selected Cancel')
  else
    disp(['User selected ', fullfile(pathname, filename)])
    writetable(T, fullfile(pathname, filename), 'WriteRowNames', true);
  end
end

function editTEOFe_Callback(hObject, eventdata, handles)
% hObject    handle to editTEOFe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTEOFe as text
%        str2double(get(hObject,'String')) returns contents of editTEOFe as a double
  tableT2(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function editTEOFe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTEOFe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function editDeltaFe_Callback(hObject, eventdata, handles)
% hObject    handle to editDeltaFe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDeltaFe as text
%        str2double(get(hObject,'String')) returns contents of editDeltaFe as a double
  tableT2(hObject, handles);
end

% --- Executes during object creation, after setting all properties.
function editDeltaFe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDeltaFe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in pushbuttonSavePlotT2Fe.
function pushbuttonSavePlotT2Fe_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSavePlotT2Fe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  VariableNames = regexprep(handles.uitable4.ColumnName, '<[^>]*>', '');
  Data = zeros(size(handles.uitable4.Data) + [0 (2 * size(handles.fitPoly1FsFe, 2))]);
  Data(:, 1:size(handles.uitable4.Data, 2)) = handles.uitable4.Data(:, :);
  for i = 1:size(handles.fitPoly1FsFe, 2)
    Data(:, (2 * i - 1) + size(handles.uitable4.Data, 2) ) = exp(feval(handles.fitPoly1FsFe{i}, Data(:, 1)));
    VariableNames{end + 1} = [VariableNames{i + 1} '_poly1'];
    Data(:, (2 * i) + size(handles.uitable4.Data, 2) ) = feval(handles.fitExp1FsFe{i}, Data(:, 1));
    VariableNames{end + 1} = [VariableNames{i + 1} '_exp1'];
  end

  T = array2table(Data);
  T.Properties.RowNames = handles.uitable4.RowName;
  T.Properties.VariableNames = VariableNames;
  T.Properties.DimensionNames{1} = cell2mat(handles.popupmenu4.String(handles.popupmenu1.Value));

  [filename, pathname] = uiputfile('*.csv', 'Save Comma Separeted Version', 'FeCalculationPlotT2.csv');
                       
  if isequal(filename,0) || isequal(pathname,0)
    disp('User selected Cancel')
  else
    disp(['User selected ', fullfile(pathname, filename)])
    writetable(T, fullfile(pathname, filename), 'WriteRowNames', true);
  end
end

% --- Executes on button press in pushbuttonSaveAdjustT2Fe.
function pushbuttonSaveAdjustT2Fe_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSaveAdjustT2Fe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  T = array2table(handles.uitable5.Data);
  T.Properties.RowNames = handles.uitable5.RowName;
  T.Properties.VariableNames = regexprep(handles.uitable5.ColumnName, '<[^>]*>', '');
  T.Properties.DimensionNames{1} = cell2mat(handles.popupmenu4.String(handles.popupmenu1.Value));

  [filename, pathname] = uiputfile('*.csv', 'Save Comma Separeted Version', 'FeCalculationAdjustT2.csv');
                       
  if isequal(filename,0) || isequal(pathname,0)
    disp('User selected Cancel')
  else
    disp(['User selected ', fullfile(pathname, filename)])
    writetable(T, fullfile(pathname, filename), 'WriteRowNames', true, 'QuoteStrings', true);
  end
end

% --- Executes on button press in pushbuttonSaveQuantification.
function pushbuttonSaveQuantification_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSaveQuantification (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  T = array2table(handles.uitable6.Data);
  T.Properties.RowNames = regexprep(handles.uitable6.RowName, '<[^>]*>', '');
  um = regexprep(handles.uitable6.ColumnName, ' \|', '');
  dois = regexprep(um, '(', '');
  tres = regexprep(dois, ')', '');
  quatro = regexprep(tres, ' ', '_');
  VariableNames = regexprep(quatro, '\/', '_');
  T.Properties.VariableNames = VariableNames;
  T.Properties.DimensionNames{1} = cell2mat(handles.popupmenu4.String(handles.popupmenu1.Value));

  [filename, pathname] = uiputfile('*.csv', 'Save Comma Separeted Version', 'FeCalculationFeQuantification.csv');
                       
  if isequal(filename,0) || isequal(pathname,0)
    disp('User selected Cancel')
  else
    disp(['User selected ', fullfile(pathname, filename)])
    writetable(T, fullfile(pathname, filename), 'WriteRowNames', true, 'QuoteStrings', true);
  end
end

% --- Executes on button press in pushbuttonSaveTableT2Fe.
function pushbuttonSaveTableT2Fe_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSaveTableT2Fe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  T = array2table(handles.uitable4.Data);
  T.Properties.RowNames = handles.uitable4.RowName;
  T.Properties.VariableNames = regexprep(handles.uitable4.ColumnName, '<[^>]*>', '');
  T.Properties.DimensionNames{1} = cell2mat(handles.popupmenu1.String(handles.popupmenu4.Value));

  [filename, pathname] = uiputfile('*.csv', 'Save Comma Separeted Version', 'FeCalculationTableT2.csv');
                       
  if isequal(filename,0) || isequal(pathname,0)
    disp('User selected Cancel')
  else
    disp(['User selected ', fullfile(pathname, filename)])
    writetable(T, fullfile(pathname, filename), 'WriteRowNames', true);
  end

end

% --- Executes when entered data in editable cell(s) in uitable3.
function uitable3_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

adjustR2(hObject, handles);

end
