% Code (c) Su Yan, Imperial College London, 17 November 2022
% s.yan18@imperial.ac.uk

function data_cube=load_raw_file(width, height, depth)

% A function used to read '*.raw' files output from XRF devices (such as
% Bruker M6 JETSTREAM).

% Once calling the function, a dialog box will pop up to select the '*.raw'
% file, which only allows a single file to be selected.

% The input parameters (width, height, depth) can be found from the '*.rpl'
% file opened with 'Notepad'.
%   For example: 
%       width = 534;
%       height = 539;
%       depth = 4096;

% This is in part of the EPSRC-funded ARTICT "Art Through the ICT Lens: Big
% Data Processing Tools to Support the Technical Study, Preservation and
% Conservation of Old Master Paintings" project (EP/R032785/1). 
% More information: https://art-ict.github.io/artict/home.html

% Relevent papers:

% S. Yan, J.J. Huang, N. Daly, C. Higgitt, and P.L. Dragotti, "When de
% Prony Met Leonardo: An Automatic Algorithm for Chemical Element
% Extraction From Macro X-Ray Fluorescence Data," IEEE Transactions on
% Computational Imaging, vol. 7, pp. 908–924, 2021.

% S. Yan, J.J. Huang, N. Daly, C. Higgitt, and P.L. Dragotti, “Revealing
% Hidden Drawings in Leonardo s  the Virgin of the Rocks’ from Macro X-Ray
% Fluorescence Scanning Data through Element Line Localisation,” in ICASSP
% 2020-2020 IEEE International Conference on Acoustics, Speech and Signal
% Processing (ICASSP). IEEE, 2020, pp. 1444–1448.


[open_file_name,load_path,~] = uigetfile('*.raw','MultiSelect','off');

fileID  = fopen([load_path, open_file_name],'r');
data_cube = fread(fileID, [depth,width*height], 'uint8');
fclose(fileID);
data_cube=reshape(data_cube,[channel_num,column_num,row_num]);