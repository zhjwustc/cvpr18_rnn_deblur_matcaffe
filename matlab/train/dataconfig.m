function Solver = dataconfig(Solver)
Solver.patchsize = 128;
Solver.batchsize = 20;
Solver.datapath = './data';  
Solver.inputfolder = 'input';
Solver.labelfolder = 'label';
Solver.subfolderpath = dir(fullfile(Solver.datapath, Solver.inputfolder));  Solver.subfolderpath(1:2) = [];
if exist(fullfile(Solver.datapath, 'data.mat'),'file')
    load(fullfile(Solver.datapath, 'data.mat'));
else
    testlst = {};
    trainlst = {};
    
    count = 1;
    for subfolderid = 1:length(Solver.subfolderpath)
        dir_list = dir(fullfile(Solver.datapath,Solver.inputfolder,Solver.subfolderpath(subfolderid).name,'*.png'));
        num_png = length(dir_list);
        for id = 1:num_png
            trainlst{count}.input = fullfile(Solver.datapath,Solver.inputfolder,Solver.subfolderpath(subfolderid).name,dir_list(id).name);
            trainlst{count}.label = fullfile(Solver.datapath,Solver.labelfolder,Solver.subfolderpath(subfolderid).name,dir_list(id).name);
            count = count+1;
        end
    end
  

    data.trainlst = trainlst;
    data.train_num = length(trainlst);
    data.testlst = testlst;
    data.test_num = length(testlst);   
   
   
    fprintf('saving data structure ...\n');
    save(fullfile(Solver.datapath, 'data.mat'), 'data');
end
Solver.data = data;
fprintf('Done with data config, obtain %d traning images.\n',Solver.data.train_num);
end
