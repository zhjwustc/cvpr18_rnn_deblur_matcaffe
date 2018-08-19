function [delta, loss] = sigmoid_CELoss_hardsample(active, gt, mode)
% if ~exist('sparse','var')
%    sparse = 0;
% end
[r,c,cha,bz] = size(active);
if size(gt,1)~= r
    gt = imresize(gt,[r,c]);
end
% loss = zeros(2,1);

active = double(active); %% in case loss is NAN (debug from exp3)
sigmoidActive = 1./(1+exp(-active));
sigmoidActive = sigmoidActive* 0.998 + 0.001; %% in case loss is NAN
dt = -gt.*log(sigmoidActive) - (1-gt).*log(1-sigmoidActive);
loss = sum(dt(:))/bz;

dt = sigmoidActive - gt;

if strcmp(mode, 'train')
    msk1 = hardsample(dt, [1:cha], [r,c,cha,bz], 0.4);
    msk2 = uni_balance([r,c,cha,bz], 0.1);
    msk = max(cat(5,msk1,msk2),[],5);
    delta = single((msk.*dt)/bz);
else
    delta = 0;
end
end

function mask = uni_balance(dsize, rate)
mask = zeros(dsize);
for m = 1:dsize(4)
    msk = rand(dsize(1),dsize(2)) < rate;
    mask(:,:,:,m) = repmat(msk,[1,1,dsize(3)]);
end
end

function mask = hardsample(delta, channel, dsize, rate)
mask = zeros(dsize);
num = round(rate * (dsize(1)*dsize(2)));
for m = 1:dsize(4)
    msk = zeros(dsize(1),dsize(2));
    det = sum(abs(delta(:,:,:,m)),3);
    [Y,I] = sort(det(:), 1, 'descend');
    msk(I(1:num)) = 1;
    mask(:,:,channel,m) = repmat(msk,[1,1,length(channel)]);
end
end
