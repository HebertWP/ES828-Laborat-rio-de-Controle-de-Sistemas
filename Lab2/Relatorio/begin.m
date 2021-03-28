function begin()
    clc; close all; clear all;
    if isfolder('data')
        delete('./data/*')
    else
        mkdir('data')
    end
end