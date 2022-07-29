clc;
clear all;
close all;

nof = 10;
frame = 0;
ack = 1;
for i=0:nof-1
    fprintf('frame %d has been transmitted from sender to receiver \n', frame);
    frame_loss = input('Enter the frame loss factor (1 for frame loss and 0 for frame transmission): ');
    if (frame_loss==0)
        fprintf('frame %d has received by the receiver \n', frame);
        fprintf('frame %d is accepted by the receiver \n', frame);
        ack_loss = input('Enter the ack loss factor (1 for ack loss and 0 for ack transmission): ');
        if (ack_loss==0)
            fprintf('ack %d has been transmitted from receiver to sender \n', ack);
        else
            fprintf('ack lossed \n');
            fprintf('frame %d has been retransmitted from sender to receiver \n', frame);
            fprintf('frame %d has received by the receiver \n', frame);
            fprintf('frame %d is Discarded due to duplicate frame \n', frame);
            fprintf('ack %d has been retransmitted from receiver to sender \n', ack);
        end
    else
        fprintf('frame %d has been retransmitted from sender to receiver \n', frame);
        fprintf('frame %d has received by the receiver \n', frame);
        fprintf('frame %d is accepted by the receiver \n', frame);
        fprintf('ack %d has been transmitted from receiver to sender \n', ack);
    end
    if (frame==0)
        frame = frame+1;
    else
        frame = frame-1;
    end
    if (ack==0)
        ack = ack+1;
    else
        ack = ack-1;
    end
end
