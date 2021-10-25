clear
clc

igtlConnection = igtlopen('localhost', 18944);
M = [1.0, 0.0, 0.0, 0.0;
    0.0, 1.0, 0.0, 0.0;
    0.0, 0.0, 1.0, 0.0;
    0.0, 0.0, 0.0, 1.0];

IMGDATA.Type = 'TRANSFORM';
IMGDATA.Name = 'NeedleToTracker';
IMGDATA.Trans = M;

startTime = igtlTimestampNow();

for t=1:1000
  M = [ 1 0 0 12+30*sin(t*0.5); 
                        0 1 0 -5; 
                        0 0 1 20; 
                        0 0 0 1 ];
  IMGDATA.timestamp = igtlTimestampNow();
  IMGDATA.Trans = M;
  r = igtlsend(igtlConnection, IMGDATA);
  pause(0.1)
end

igtlclose(igtlConnection);

function timestamp = igtlTimestampNow()
    % igtlTimestampNow  Time elapsed since 00:00:00 January 1, 1970, UTC, in seconds
    %
    %   timestamp = igtlTimestampNow()
    %
    %  Example:
    %
    %   igtlConnection = igtlConnect('127.0.0.1',18944);
    %   transform.name = 'NeedleToTracker';
    %   transform.matrix = [ 1 0 0 10; 0 1 0 -5; 0 0 1 20; 0 0 0 1 ];
    %   transform.timestamp = igtlTimestampNow();
    %   igtlSendTransform(igtlConnection, transform);
    %   igtlDisconnect(igtlConnection);
    %
    timestamp = java.lang.System.currentTimeMillis/1000;
end