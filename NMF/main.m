clc
clear


movie_list = loadMovieList();
load MovieLens.mat
times = 1000;
[movie_matrix, person_matrix, delta] = nmf(Y, 10, times, 0.0001);
plot(1:times, (delta))
