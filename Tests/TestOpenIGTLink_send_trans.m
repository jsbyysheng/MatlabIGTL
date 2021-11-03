%%% affine transform matrix
M = [1.0, 0.0, 0.0, 0.0;
    0.0, -1.0, 0.0, 0.0;
    0.0, 0.0, 1.0, 0.0;
    0.0, 0.0, 0.0, 1.0];

IMGDATA.Type = 'TRANSFORM';
IMGDATA.Name = 'MatlabTrans';
IMGDATA.Trans = M;

sd = igtlopen('localhost', 18944);
r = igtlsend(sd, IMGDATA);
igtlclose(sd);
