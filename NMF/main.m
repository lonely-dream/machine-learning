clc
clear


movie_list = loadMovieList();
load MovieLens.mat
times = 3000;
[movie_matrix, person_matrix, delta] = nmf(Y, R, 3, times);

heatmap(corrcoef(person_matrix), 'GridVisible', 'off')
% heatmap(corrcoef(movie_matrix'), 'GridVisible', 'off')
