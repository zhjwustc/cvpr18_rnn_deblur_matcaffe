function Solver = modelconfig(model_path)
solver_file = fullfile(model_path, 'solver.prototxt');
save_file = fullfile(model_path, 'solver.mat');

if exist(save_file, 'file')
    Solver = SolverParser(solver_file, save_file);
else
    Solver = SolverParser(solver_file);
end

if isfield(Solver, 'snapshot_prefix')
    if isfield(Solver, 'iter')
        Solver.state_file = [Solver.snapshot_prefix,sprintf('_iter_%d.solverstate', Solver.iter)];
        Solver.model_file = [Solver.snapshot_prefix, sprintf('_iter_%d.caffemodel', Solver.iter)];
    else
        Solver.state_file = [];
        fprintf('ALERT: no pretrained snapshot found.\n');
    end
end

Solver = caffe_init(Solver, solver_file);
Solver.matfile = save_file;

end
