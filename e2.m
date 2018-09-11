% Sample script  that shows how to automate running problem solutions
close all;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a) Load an image using the imread command 
I = imread('Lenna_baseimage.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% b) Display original image in the first spot of a 2 x 3 a grid layout
%    Check the imshow and subplot commands.

subplot(2,3,1), imshow(I);
gridfig = gcf;

pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% c) Display a gray scale version of the image in position 2 of the grid.
%    help rgb2gray

J = rgb2gray(I);
subplot(2,3,2), imshow(J)

% use figure, imshow(J); to open J in a new image window

figure, imshow(J);
grayFig = gcf;

pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d) Generate a new figure and ask user to manually select a region of the
%    image. Display the subimage in position 3 of the grid.
%    Hint--> getrect()

figure, imshow(I);

% Get user input on a newly dislayed image

disp("Please select a region of the newly opened image")
rect = getrect;

% Make grid the current figure
figure(gridfig);

% Display selected region. Note the last : which applies the cut
% over all 3 channels.
x1 = floor(rect(1));
x2 = floor(x1 + rect(3));
y1 = floor(rect(2));
y2 = floor(y1 + rect(4));
crop = I(y1:y2, x1:x2, :);
subplot(2,3,3), imshow(crop)

pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% e) Create a function J = luminance_change(I, option, value) such that:
%   * When given the option 'c', image I's contrast will be modified by
%     the given value. Simple multiplication will achieve this.
%   * When given the option 'b', image I's brightness will be modified by
%     the given value. Simple addition will achieve this.
%  
%   Showcase your function by filling positions 4 and 5 in the grid
prompt = 'Enter luminance change option (c/b): ';
str = input(prompt,'s');
prompt2 = 'Enter contrast modifier: ';
contrast = input(prompt2);
L = luminance_change(I, str, contrast);
% Contrast change
figure(gridfig)
subplot(2,3,4), imshow(L)

pause();


% Brightness change
prompt = 'Enter luminance change option (c/b): ';
str = input(prompt,'s');
prompt2 = 'Enter contrast modifier: ';
contrast = input(prompt2);
L = luminance_change(I, str, contrast);
figure(gridfig)
subplot(2,3,5), imshow(L)

pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f) BONUS: Display a version of the image after it's been blurred using a
%    Gaussian filter. Hint: imgaussfilt()

Iblur = imgaussfilt(I, 2);
figure(gridfig)
subplot(2,3,6), imshow(Iblur)


function L = luminance_change(I, option, value)
    if option == 'c' 
        I = I * value;
    else if option == 'b'
        I = I + value;
        end
    end
    L = I;
end
