clc;
clear;
addpath('./mat_files/');
addpath('./provided_files/');
addpath('./helper_files/');
load('tfidfHistograms.mat');
sumWords = sum(tfidf,1);
size(sumWords);
ind = 1:1:1500;
sumWords = [sumWords; ind]';
sumWords = sortrows(sumWords);
stoplist = sumWords(1:200,2);
save('stopList.mat','stoplist');