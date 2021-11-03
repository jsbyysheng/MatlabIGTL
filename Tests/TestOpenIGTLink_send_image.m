%%% read image data
fid = fopen('igtlTestImage1.raw', 'r');
I1 = fread(fid, [256 256], 'uint8')';
fclose(fid);

I2 = imread('igtlTestImage2.jpg');
I2 = rgb2gray(I2);
I2 = reshape(I2, [271, 186]);
% I2 = padarray(I2, [43, 0], 0);
% I2 = I2(2:end, :);

%%% affine transform matrix
M = [-1.0, 0.0, 0.0, 0.0;
    0.0, -1.0, 0.0, 0.0;
    0.0, 0.0, 1.0, 0.0;
    0.0, 0.0, 0.0, 1.0];

IMGDATA.Type = 'IMAGE';
IMGDATA.Name = 'MatlabImage';
IMGDATA.Image = I2;
IMGDATA.Trans = M;

%%% send the image data through OpenIGTLink connection
sd = igtlopen('localhost', 18944);
r = igtlsend(sd, IMGDATA);
igtlclose(sd);
