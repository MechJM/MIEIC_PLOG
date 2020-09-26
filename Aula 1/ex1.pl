male("Aldo Burrows").
male("Lincoln Burrows").
male("LJ Burrows").
male("Michael Scofield").

female("Christina Rose Scofield").
female("Sara Tancredi").
female("Ella Scofield").
female("Lisa Rix").

parent("Aldo Burrows","Lincoln Burrows").
parent("Aldo Burrows","Michael Scofield").
parent("Christina Rose Scofield","Lincoln Burrows").
parent("Christina Rose Scofield","Michael Scofield").
parent("Lincoln Burrows","LJ Burrows").
parent("Lisa Rix","LJ Burrows").
parent("Michael Scofield","Ella Scofield").
parent("Sara Tancredi","Ella Scofield").

/* Queries
1. parent(X,"Michael Scofield").
2. parent("Aldo Burrows",Y).