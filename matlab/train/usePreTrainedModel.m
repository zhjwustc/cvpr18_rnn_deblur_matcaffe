function Solver = usePreTrainedModel(Solver)
%%%%%% use it before 1st iteration in train
w1 = Solver.Solver_.net.get_weights();
w2 = load('./model/exp117_weights_iter_151700.mat'); w2 = w2.weights;

w1 = w2;

Solver.Solver_.net.set_weights(w1);
