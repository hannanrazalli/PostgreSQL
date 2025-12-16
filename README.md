Day 1 : dvdrental exercise
Right click @ database > create > database > right click @ database name > restore > dvdrental.tar > refresh > right click @ dvdrental databased > query tool > test query (SELECT * FROM film;)

CREATE DATABASE test; #create database named test

SELECT * FROM film; #select everything from database film

SELECT DISTINCT store_id FROM customer; #select all different store_id, no duplicate

SELECT COUNT(store_id) FROM customer; #sum of the store_id number. duplicate or not, it will sum all numbers

SELECT COUNT(DISTINCT store_id) FROM customer; #sql will read distinct first, then count the distinct