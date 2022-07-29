clc;
clear all;
close all;

nof = 16;
window_size = 4;
frame = 0;
ack = 1;
for i=0:window_size:nof-1
    for j=0:window_size-1
        fprintf('frame %d has been transmitted from sender to receiver \n', frame);
        fprintf('frame %d has received by the receiver \n', frame);
        fprintf('frame %d is accepted by the receiver \n', frame);
        if j==window_size-1
            fprintf('ack %d for frame from 0 to %d has been transmitted from receiver to sender \n', ack, window_size-1);
        end
        if (frame<nof-1)
            frame = frame+1;
        else
            frame = 0;
        end
        if (ack<nof-1)
            ack = ack+1;
        else
            ack = 0;
        end
    end
end
