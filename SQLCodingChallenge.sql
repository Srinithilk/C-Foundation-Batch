----Virtual Art Gallery Shema DDL and DML

CREATE DATABASE Virtual_Art_Gallery;

USE Virtual_Art_Gallery;

-- Create tables

-- Create the Artists table
CREATE TABLE Artists (
ArtistID INT PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
Biography TEXT,
Nationality VARCHAR(100));

-- Create the Categories table
CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL);

-- Create the Artworks table
CREATE TABLE Artworks (
ArtworkID INT PRIMARY KEY,
Title VARCHAR(255) NOT NULL,
ArtistID INT,
CategoryID INT,
Year INT,
Description TEXT,
ImageURL VARCHAR(255),
FOREIGN KEY (ArtistID) REFERENCES Artists (ArtistID),
FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID));

-- Create the Exhibitions table
CREATE TABLE Exhibitions (
ExhibitionID INT PRIMARY KEY,
Title VARCHAR(255) NOT NULL,
StartDate DATE,
EndDate DATE,
Description TEXT);

-- Create a table to associate artworks with exhibitions
CREATE TABLE ExhibitionArtworks (
ExhibitionID INT,
ArtworkID INT,
PRIMARY KEY (ExhibitionID, ArtworkID),
FOREIGN KEY (ExhibitionID) REFERENCES Exhibitions (ExhibitionID),
FOREIGN KEY (ArtworkID) REFERENCES Artworks (ArtworkID));

-- Insert sample data

-- Insert sample data into the Artists table
INSERT INTO Artists (ArtistID, Name, Biography, Nationality) VALUES
(1, 'Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
(2, 'Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
(3, 'Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian');

SELECT * FROM Artists;

-- Insert sample data into the Categories table
INSERT INTO Categories (CategoryID, Name) VALUES
(1, 'Painting'),
(2, 'Sculpture'),
(3, 'Photography');

SELECT * FROM Categories;

-- Insert sample data into the Artworks table
INSERT INTO Artworks (ArtworkID, Title, ArtistID, CategoryID, Year, Description, ImageURL) VALUES
(1, 'Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 'starry_night.jpg'),
(2, 'Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 'mona_lisa.jpg'),
(3, 'Guernica', 1, 1, 1937, 'Pablo Picassos powerful anti-war mural.', 'guernica.jpg');

SELECT * FROM Artworks;

-- Insert sample data into the Exhibitions table
INSERT INTO Exhibitions (ExhibitionID, Title, StartDate, EndDate, Description) VALUES
(1, 'Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'),
(2, 'Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.');

SELECT * FROM Exhibitions;

-- Insert artworks into exhibitions
INSERT INTO ExhibitionArtworks (ExhibitionID, ArtworkID) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2);

SELECT * FROM ExhibitionArtworks;

--1. Retrieve the names of all artists along with the number of artworks they have in the gallery, and list them in descending order of the number of artworks.
SELECT A.Name AS Artist, COUNT(AW.ArtworkID) AS NumberOfArtworks
FROM Artists A
LEFT JOIN Artworks AW ON A.ArtistID = AW.ArtistID
GROUP BY A.Name
ORDER BY NumberOfArtworks DESC;

/*2. List the titles of artworks created by artists from 'Spanish' and 'Dutch' nationalities, and order
them by the year in ascending order.*/

SELECT AW.Title AS Artwork, AW.Year,A.Nationality
FROM Artworks AW
JOIN Artists A ON AW.ArtistID = A.ArtistID
WHERE A.Nationality IN ('Spanish', 'Dutch')
ORDER BY AW.Year ASC;

/*3. Find the names of all artists who have artworks in the 'Painting' category, and the number of
artworks they have in this category.*/

SELECT A.Name AS Artist, COUNT(AW.ArtworkID) AS NumberOfArtworks
FROM Artists A
JOIN Artworks AW ON A.ArtistID = AW.ArtistID
WHERE AW.CategoryID = (SELECT C.CategoryID FROM Categories C WHERE Name = 'Painting')
GROUP BY A.Name;

/*4. List the names of artworks from the 'Modern Art Masterpieces' exhibition, along with their
artists and categories.*/

SELECT AW.Title AS Artwork, A.Name AS Artist, C.Name AS Category
FROM Artworks AW
JOIN ExhibitionArtworks EA ON AW.ArtworkID = EA.ArtworkID
JOIN Exhibitions E ON EA.ExhibitionID = E.ExhibitionID
JOIN Artists A ON AW.ArtistID = A.ArtistID
JOIN Categories C ON AW.CategoryID = C.CategoryID
WHERE E.Title = 'Modern Art Masterpieces';

--5. Find the artists who have more than two artworks in the gallery.

SELECT A.ArtistID,A.Name AS Artist 
FROM Artists A
JOIN Artworks AW ON A.ArtistID = AW.ArtistID
GROUP BY A.ArtistID,A.Name
HAVING COUNT(AW.ArtworkID) > 2;

--6. Find the titles of artworks that were exhibited in both 'Modern Art Masterpieces' and 'Renaissance Art' exhibitions

SELECT AW.Title FROM Artworks AW
JOIN ExhibitionArtworks EA ON AW.ArtworkID = EA.ArtworkID
JOIN Exhibitions E ON EA.ExhibitionID = E.ExhibitionID
WHERE E.Title = 'Modern Art Masterpieces' AND E.Title = 'Renaissance Art';

--7. Find the total number of artworks in each category

SELECT C.Name AS Category, COUNT(AW.ArtworkID) AS NumberOfArtworks
FROM Categories C
LEFT JOIN Artworks AW ON C.CategoryID = AW.CategoryID
GROUP BY C.Name;

--8. List artists who have more than 3 artworks in the gallery.

SELECT A.Name AS Artist
FROM Artists A
JOIN Artworks AW ON A.ArtistID = AW.ArtistID
GROUP BY A.Name
HAVING COUNT(AW.ArtworkID) > 3;

--9. Find the artworks created by artists from a specific nationality (e.g., Spanish).

SELECT AW.Title AS Artwork, A.Name AS Artist
FROM Artworks AW
JOIN Artists A ON AW.ArtistID = A.ArtistID
WHERE A.Nationality = 'Spanish';

--10. List exhibitions that feature artwork by both Vincent van Gogh and Leonardo da Vinci.

SELECT e.*
FROM Exhibitions e
JOIN ExhibitionArtworks ea ON e.ExhibitionID = ea.ExhibitionID
JOIN Artworks aw ON ea.ArtworkID = aw.ArtworkID
JOIN Artists a ON aw.ArtistID = a.ArtistID
WHERE a.Name IN ('Vincent van Gogh', 'Leonardo da Vinci');

--11. Find all the artworks that have not been included in any exhibition.

SELECT AW.Title AS Artwork
FROM Artworks AW
WHERE AW.ArtworkID NOT IN (SELECT EA.ArtworkID FROM ExhibitionArtworks EA);

--12. List artists who have created artworks in all available categories.

SELECT A.Name AS Artist FROM Artists A
WHERE NOT EXISTS (
    SELECT C.CategoryID FROM Categories C
    WHERE NOT EXISTS (
        SELECT AW.ArtworkID FROM Artworks AW
        WHERE A.ArtistID = AW.ArtistID AND C.CategoryID = AW.CategoryID)
);

--13. List the total number of artworks in each category.

SELECT C.Name AS Category, COUNT(AW.ArtworkID) AS NumberOfArtworks
FROM Categories C
LEFT JOIN Artworks AW ON C.CategoryID = AW.CategoryID
GROUP BY C.Name;

--14. Find the artists who have more than 2 artworks in the gallery.

SELECT A.Name AS Artist
FROM Artists A
JOIN Artworks AW ON A.ArtistID = AW.ArtistID
GROUP BY A.Name
HAVING COUNT(AW.ArtworkID) > 2;

/*15. List the categories with the average year of artworks they contain, only for categories with more
than 1 artwork.*/

SELECT C.Name AS Category, AVG(AW.Year) AS AverageYear
FROM Categories C
JOIN Artworks AW ON C.CategoryID = AW.CategoryID
GROUP BY C.Name
HAVING COUNT(AW.ArtworkID) > 1;

--16. Find the artworks that were exhibited in the 'Modern Art Masterpieces' exhibition.

SELECT AW.Title AS Artwork
FROM Artworks AW
JOIN ExhibitionArtworks EA ON AW.ArtworkID = EA.ArtworkID
JOIN Exhibitions E ON EA.ExhibitionID = E.ExhibitionID
WHERE E.Title = 'Modern Art Masterpieces';

--17. Find the categories where the average year of artworks is greater than the average year of all artworks.

SELECT C.Name AS Category
FROM Categories C
JOIN Artworks AW ON C.CategoryID = AW.CategoryID
GROUP BY C.Name
HAVING AVG(AW.Year) > (SELECT AVG(AW.Year) FROM Artworks AW);


--18. List the artworks that were not exhibited in any exhibition.

SELECT AW.Title AS Artwork
FROM Artworks AW
WHERE AW.ArtworkID NOT IN (SELECT EA.ArtworkID FROM ExhibitionArtworks EA);

--19. Show artists who have artworks in the same category as "Mona Lisa."

SELECT A.Name AS ArtistName
FROM Artists A
JOIN Artworks AW ON A.ArtistID = AW.ArtistID
WHERE AW.CategoryID = (SELECT C.CategoryID FROM Categories C WHERE C.Name = 'Painting' AND AW.Title = 'Mona Lisa');

--20. List the names of artists and the number of artworks they have in the gallery.

SELECT A.Name AS Artist, COUNT(AW.ArtworkID) AS NumberOfArtworks
FROM Artists A
LEFT JOIN Artworks AW ON A.ArtistID = AW.ArtistID
GROUP BY A.Name;

