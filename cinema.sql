-- HELP
--ALTER TABLE Viewers ADD CONSTRAINT Cinema_Hall_ID FOREIGN KEY(Cinema_Hall_ID) REFERENCES Cinema_Halls (Cinema_Hall_ID);

CREATE DATABASE cinema;

USE cinema;

-- Viewers
CREATE TABLE Viewers (
Viewer_ID INT PRIMARY KEY NOT NULL,
Total_Viewers INT NOT NULL,
Cinema_Hall_ID INT NOT NULL
);

-- Cinema_Halls
CREATE TABLE Cinema_Halls (
Cinema_Hall_ID INT PRIMARY KEY NOT NULL,
Cinema_ID INT NOT NULL,
Seats INT NOT NULL
);

ALTER TABLE Viewers ADD FOREIGN KEY(Cinema_Hall_ID) REFERENCES Cinema_Halls (Cinema_Hall_ID);

-- Cinema_Halls_Film
CREATE TABLE Cinama_Halls_Film (
Cinema_Hall_Film_ID INT PRIMARY KEY NOT NULL,
Cinema_Hall_ID INT NOT NULL,
Film_ID INT NOT NULL

FOREIGN KEY(Cinema_Hall_ID) REFERENCES Cinema_Halls (Cinema_Hall_ID)
);

-- Cinemas
CREATE TABLE Cinemas (
Cinema_ID INT PRIMARY KEY NOT NULL,
Cinema_Name VARCHAR(50) NOT NULL,
Cinema_Address VARCHAR(50) NOT NULL,
Total_Cinema_Hall INT NOT NULL
);

ALTER TABLE Cinema_Halls ADD FOREIGN KEY(Cinema_ID) REFERENCES Cinemas (Cinema_ID);

-- Cinema_Tickets
CREATE TABLE Cinema_Ticket (
Cinema_Tickets_ID INT PRIMARY KEY NOT NULL
Cinema_ID INT NOT NULL,
Tickets_ID INT NOT NULL

FOREIGN KEY(Cinema_ID) REFERENCES Cinemas (Cinema_ID)
);

-- Tickets
CREATE TABLE Tickets (
Tickets_ID INT PRIMARY KEY NOT NULL,
Cinema_ID INT NOT NULL
);

ALTER TABLE Cinema_Ticket ADD FOREIGN KEY(Tickets_ID) REFERENCES Tickets (Tickets_ID);

-- Participants
CREATE TABLE Participants (
Participant_ID INT PRIMARY KEY NOT NULL,
Tickets_ID INT NOT NULL,
Participant_Name VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL

FOREIGN KEY(Tickets_ID) REFERENCES Tickets (Tickets_ID)
);

ALTER TABLE Tickets ADD FOREIGN KEY(Cinema_ID) REFERENCES Cinemas (Cinema_ID);

-- Films
CREATE TABLE Films (
Film_ID INT PRIMARY KEY NOT NULL,
Title VARCHAR(50) NOT NULL,
Cinema_Hall_ID INT NOT NULL,
Release_Date VARCHAR(50),
Genre VARCHAR(50) NOT NULL,
Film_Length INT NOT NULL,
Tickets_ID INT NOT NULL

FOREIGN KEY(Tickets_ID) REFERENCES Tickets (Tickets_ID)
);

-- Actors
CREATE TABLE Actors (
Actor_ID INT PRIMARY KEY NOT NULL,
Actor_Name VARCHAR(50) NOT NULL
);

-- Film_Actor
CREATE TABLE Film_Actor (
Film_Actor_ID INT PRIMARY KEY NOT NULL,
Film_ID INT NOT NULL,
Actor_ID INT NOT NULL

FOREIGN KEY(Actor_ID) REFERENCES Actors (Actor_ID),
FOREIGN KEY(Film_ID) REFERENCES Films (Film_ID)
);

-- Directors
CREATE TABLE Directors (
Director_ID INT PRIMARY KEY NOT NULL,
Film_ID INT NOT NULL,
Director_Name VARCHAR(50) NOT NULL

FOREIGN KEY(Film_ID) REFERENCES Films (Film_ID)
);

-- Film_Director
CREATE TABLE Film_Director (
Film_Director_ID INT PRIMARY KEY NOT NULL,
Director_ID INT NOT NULL,
Film_ID INT NOT NULL
);

ALTER TABLE Film_Director ADD FOREIGN KEY(Film_ID) REFERENCES Films (Film_ID);
ALTER TABLE Film_Director ADD FOREIGN KEY(Director_ID) REFERENCES Directors (Director_ID);