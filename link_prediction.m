load dataLinkPrediction;
% %% build a positive and negitive equal-sized data set.
% pNum=sum(sign==1);
% mNum=sum(sign==-1);
% pSample=dataEpinion(sign==1,:);
% pSampleNegetive=dataEpinion(sign==-1,:);
% reducedPsample = datasample(pSample,mNum,'Replace',false);
% balDataEpinion=[reducedPsample;pSampleNegetive];
% %% partition the balanced data set into the training and test data set. the training data set take 70%
% c = cvpartition(balDataEpinion(:,3),'holdout',0.3);
% train_set=balDataEpinion(c.training,:);
% test_set=balDataEpinion(c.test,:);
% 
train_set2=zeros(size(train_set,1),24);
test_set2=zeros(size(test_set,1),24);

%% Epinion
%% find the features for each entry in the training data set 
tic;
for k=1:1000%size(train_set,1)
    % features based on degree but I will leave the embeddedness to the end
    outP=sum(dataEpinion(:,1)==train_set(k,1)&dataEpinion(:,3)==1);
    outN=sum(dataEpinion(:,1)==train_set(k,1)&dataEpinion(:,3)==-1);
    inP=sum(dataEpinion(:,2)==train_set(k,2)&dataEpinion(:,3)==1);
    inN=sum(dataEpinion(:,2)==train_set(k,2)&dataEpinion(:,3)==-1);
    sumOut=outP+outN;
    sumIn=inP+inN;
    % features based on the sixteen triads and the embeddedness
    [triad,em]=find16Triads(train_set(k,:),dataEpinion);
    train_set2(k,:)=[outP,outN,inP,inN,sumOut,sumIn,em,triad(1,2:5),triad(2,2:5),triad(3,2:5),triad(4,2:5),train_set(k,3)];
end
toc;
%% find the features for test data set




%% Slashdot

%% Wiki









