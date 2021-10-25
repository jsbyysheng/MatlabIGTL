%%% read image data
fid = fopen('igtlTestImage1.raw', 'r');
I = fread(fid, [256 256], 'uint8')';
fclose(fid);

%%% affine transform matrix
M = [1.0, 0.0, 0.0, 0.0;
    0.0, -1.0, 0.0, 0.0;
    0.0, 0.0, 1.0, 0.0;
    0.0, 0.0, 0.0, 1.0];

IMGDATA.Type = 'IMAGE';
IMGDATA.Name = 'MatlabImage';
IMGDATA.Image = I;
IMGDATA.Trans = M;

%%% send the image data through OpenIGTLink connection
sd = igtlopen('localhost', 18944);
r = igtlsend(sd, IMGDATA);
igtlclose(sd);
