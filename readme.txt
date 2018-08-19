This package contains the code of the image deblurring algorithm described in the paper: 
Jiawei Zhang, Jinshan Pan, Jimmy Ren, Yibing Song, Linchao Bao, Rynson W.H. Lau, Ming-Hsuan Yang, "Dynamic Scene Deblurring Using Spatially Variant Recurrent Neural Networks", CVPR 2018. 
----------------
How to use
----------------
1. Please install matcaffe by
(1) compile caffe: make all -j8.
(2) compile matcaffe: make matcaffe.
2. Put training data into: ./matlab/exp/data. There are a few images in that folder already.
3. Run train.m in ./matlab/exp

Thanks Sifei Liu to provide his matcaffe code from [1] and spatial rnn implementation from [2]
[1] Sifei Liu and et. al. Multi-Objective Convolutional Learning for Face Labeling, CVPR 2015
[2] Sifei Liu and et. al. Learning Recursive Filters for Low-Level Vision via a Hybrid Neural Network, ECCV 2016 
