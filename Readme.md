===================================================
Hand Written Digit Classification using Logistic Regression and Feed Forward Neural Networks.
===================================================


The Classification task is performed on a set of images of handwritten numerals using the techniques of Logistic Regression and Neural Network Back Propagation. A standard available package is also used to compare results with the techniques implemented through code.

   LOGISTIC REGRESSION CLASSIFICATION
------------------------------------------
In this technique the training data provided is used to tune the model by the weights for each parameter which are 512 characteristics of the images extracted using feature extraction programs. Here the bias of value 1 is also added to each parameter, to give us a feature space of 513 dimensions in all. In Logistic Regression, the posterior probability of class C1 can be written as a logistic sigmoid acting on a linear function of the feature vector φ so that

                 p(C_1│φ)=y(φ)=σ(w^T φ)

Here w are the weights that will be tuned using the gradient step method. C1 can be assumed to be the class of digit 0, C2¬ of digit 1 and so on. Thus, in this implementation start with a random set of values for w, and calculate y(φ). The the error function is used as the negative log probability to find the convergence of the error to a stable value.

            ∇E= t×log⁡(σ(w^T φ))+(1-t)×log⁡(1-σ(w^T φ))

Here t is the target vector, which is constructed using the 1 of k classification. Hence the target vector for a sample belonging to C1¬ would be 〈1,0,0,0,0,0,0,0,0,0〉 and so on for all the classes. Then, the gradient step function is used to find new set of weights to be used in the next iteration of the above process as
                        s= σ(w^T φ)-t

S is the gradient which measures the difference between the current value of p(C_1│φ) and the target t.

                            g=φ×s
                        w_new=w_old-ε×g

Where ε is the gradient step size, also called the learning rate. ε determines the period with which the linear regression model changes the weight with the gradient.

   FEED FORWARD NEURAL NETWORK WITH BACK PROPAGATION
-------------------------------------------------------
In this technique instead of using the samples to calculate p(C_1│φ), the input is fed to a 2 layer neural network having 1 hidden layer and 1 output layer. The hidden layer contains 50 nodes and the output layer contains 10 nodes, one for each class. The samples are drawn randomly from the training set. The forward propagation with the back propagation algorithm is applied on all the samples. This cycle is repeated a number of times.
For the hidden layer, the set of weights are assumed to be wh as random values initially and the for the output layer the set of weights wo are similarly assumed to be random values. Then by the forward propagation algorithm:

                        a_h=w_h×X^T

and the output of the hidden layer

                        z_h=σ(a_h).

The same calculations for the output layer are:

                         a_o=w_o×z_h

and the output of the neural network as

                        z_o=σ(a_o).

Proceeding with back propagation by calculating δ_o for the hidden layer as

                    δ_o=(z_0-t^T)

The back-propagation of the error from the output layer to the hidden layer similarly and find δ_h for the hidden layer:

                δ_h=(w_o^T×δ_o )(σ(a_h ))(1-σ(a_h ))

Using these values the gradient for the weights Wo and Wh of the hidden and output layers are given as:

                        ∆_h=δ_h×X^T
                        ∆_o=δ_o×z_h

Hence the updated values of the weights are:

                    w_o^new=w_o^old-ε×∆_o
                    w_h^new=w_h^old-ε×∆_h

The updated weights are applied on the next sample withdrawn randomly.
This process was repeated a number of times until the error calculated as below converges.

                ∇E= t×log⁡(σ(w_o^T X))+(1-t)×log⁡(1-σ(w_o^T X))

The graph for the above result of Error vs. the number of iterations of repeating the whole process 500 times, was found to show an initially rapid, then steady decrease until it becomes constant at a very low error percentage.


  RESULTS
-----------
1. LOGISTIC REGRESSION
The result shows that the error decreases steeply at first and then gradually tapers down to a near constant rate. The final matrix of weights obtained was used on the testing set and it mis-classified 143 samples out of 1500 giving an error of 9.53 %.

2. FEED FORWARD NEURAL NETWORK WITH BACK PROPAGATION
The value of the error was found to decrease rapidly in the beginning but then it keeps decreasing slowly and gradually as the number of iterations increase. The weights for the output and the hidden layer of the network found at the end of all iterations on the testing set were plotted and it was found that the network misclassified 48 samples out of 1500 giving a percentage error rate of 3.2%.


COMPARISON WITH NEURAL NETWORK PACKAGE IN MATLAB
------------------------------------------------
The standard package available for neural networks with MATLAB were used and trained the network with the training set and calculated the error on the testing set given. A network of 50 hidden layer nodes was used similar to the network created through code before.
The following error rates were obtained:

%ETRAINING = 0.300343 %
%EVALIDATION = 2.3023 %
%ETESTING = 2.2022 %

CONCLUSION
----------
Amongst the methods implemented through code, Neural Networks with Back Propagation showed better accuracy in classification than Linear Regression. However the standard package used from the Neural Network Toolbox on MATLAB gives an even lower error rate than the code-implemented Neural Network with backpropagation.
