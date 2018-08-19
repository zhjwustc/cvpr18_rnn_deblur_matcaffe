warning off

addpath('../');
caffe.reset_all()

model_path = 'model/';

Solver = modelconfig(model_path);

Solver = dataconfig(Solver);

if isfield(Solver, 'iter')
    begin = Solver.iter+1;
else
    begin = 1;
%     Solver = usePreTrainedModel(Solver);
end

for iter = begin:Solver.max_iter
    Solver.iter = iter;
    Solver.Solver_.set_iter(iter);
    
    [batch, gt] = Gen_training_deblur2( Solver);                                                                
    batchc = {single(batch)};
    activec = Solver.Solver_.net.forward(batchc);
    
%     figure(1); imshow([gt(:,:,:,1), batch(:,:,1:3,1),activec{1}(:,:,:,1)])
%     drawnow;
    
    [deltac{1}, loss] = L2Loss(activec{1}, gt, 'train');
    
    Solver.loss(iter) = loss(1);
    
    if ~isnan(Solver.loss(iter))
        Solver.Solver_.net.backward(deltac);
        Solver.Solver_.update();
    else
        error('Model NAN.')
    end
    
    % vis
    if ~mod(iter,10)
        fprintf('========Processed iter %.6d, ',iter);
        fprintf('loss_L2: %d=======', mean(Solver.loss(iter-9:iter)));
        fprintf('\n');
    end    
    
    if ~mod(iter,100)
        Solver.Solver_.save();
        % save mat
        delete(['./model/LRNN_iter_' num2str(iter-200) '.caffemodel'])
        delete(['./model/LRNN_iter_' num2str(iter-200) '.solverstate'])
        save(Solver.matfile, 'Solver');
    end
    
end
