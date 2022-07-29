clc;
clear all;
close all;

%% Lossless Transmission
nof = 10;
frame = 0;
ack = 1;
for (i=0:nof-1)
    fprintf('frame %d has been transmitted from sender to receiver \n', frame);
    fprintf('frame %d has received by the receiver \n', frame);
    fprintf('frame %d is accepted by the receiver \n', frame);
    if (frame==0)
        frame = frame+1;
    else
        frame = frame-1;
    end
    fprintf('ack %d has been transmitted from receiver to sender \n', ack);
    if (ack==0)
        ack = ack+1;
    else
        ack = ack-1;
    end
end
