This package contains the code of the image deblurring algorithm described in the paper: 
Jiawei Zhang, Jinshan Pan, Jimmy Ren, Yibing Song, Linchao Bao, Rynson W.H. Lau, Ming-Hsuan Yang, "Dynamic Scene Deblurring Using Spatially Variant Recurrent Neural Networks", CVPR 2018. 
----------------
How to use
----------------
1. Please install matcaffe by
(1) compile caffe: make all -j8.
(2) compile matcaffe: make matcaffe.
2. Put training data into: ./matlab/train/data. There are a few images in that folder already.
3. Run train.m in ./matlab/train for training
4. Run test.m in ./matlab/test for testing
5. Download caffe model for testing in google drive(https://drive.google.com/file/d/1uZ9QcUR1R7k5nFeCj4D7IZopJYr5b37Q/view?usp=sharing) or baidu pan(https://pan.baidu.com/s/19buirGFT6PLpfhIYQIcLaA password: 1fw5)

----------------
Experimental results
----------------
You can download the experimental results (using 'blur' other than 'blur_gamma' for testing data of 2017 CVPR Nah) from the proposed network and other state-of-the-art methods in baidu pan.
2012 IJCV Whyte: https://pan.baidu.com/s/16tlBgUYpInaL4SlVdRUvKw passward: v5b4
2013 CVPR Xu: https://pan.baidu.com/s/108R3h5va1Zl_EsDJpxRJDQ passward: raeq
2015 CVPR Sun: https://pan.baidu.com/s/1yKYnnBIhK_kXTJ0Kv1nIGg passward: zqy2
2016 CVPR Pan: https://pan.baidu.com/s/1HP8tN5NiFgqFz4M2Sll4Xw passward: 2mae
2017 CVPR Nah: https://pan.baidu.com/s/1wWHtYDhmGNYT0yPn7zgBDg passward: btrj [using 'release_scale3_adv_lin']
2017 CVPR Gong: https://pan.baidu.com/s/1LEL2tYXMv-45-4uV4HY4uQ passward: nnsj
ours: https://pan.baidu.com/s/1XcCbxGZr6NLiTJXs1rCBjg passward: gd5u

----------------
Thanks Sifei Liu to provide her matcaffe code from [1] and spatial rnn implementation from [2]
[1] Sifei Liu and et. al. Multi-Objective Convolutional Learning for Face Labeling, CVPR 2015
[2] Sifei Liu and et. al. Learning Recursive Filters for Low-Level Vision via a Hybrid Neural Network, ECCV 2016 
