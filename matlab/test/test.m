clear
addpath('../');
caffe.reset_all()
% Solver = modelconfig(model_path);
Solver.Solver_ = caffe.Solver('./model/solver.prototxt');
Solver.Solver_.net.copy_from('./model/LRNN_iter_200000.caffemodel');

blur = imread('./data/000011.png');
blur = single(blur)/255;

clean = Solver.Solver_.net.forward({blur});

clean = clean{1};

imwrite(clean, './data/output.png');