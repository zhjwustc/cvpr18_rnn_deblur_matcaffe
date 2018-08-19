function [batch, gt] = Gen_training_deblur2( Solver)

batch = single(zeros(Solver.patchsize,Solver.patchsize,3,Solver.batchsize));
gt = single(zeros(Solver.patchsize,Solver.patchsize,3,Solver.batchsize));
rng('shuffle');
idpool = randperm(Solver.data.train_num);
for count = 1:Solver.batchsize
    idx = idpool(count);
    clean = im2single(imread(Solver.data.trainlst{idx}.label));
    blur = im2single(imread(Solver.data.trainlst{idx}.input));

%     blur_gray = rgb2gray(blur);
%     [dx,dy] = gradient(blur_gray);
%     batch(:,:,:,count) = cat(3, blur, dx, dy);
    batch(:,:,:,count) = blur;
    gt(:,:,:,count) = clean;
end
end