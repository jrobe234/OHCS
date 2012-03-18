    
CREATE TABLE location
	(
		locationID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, postCode INT, latitude FLOAT, longitude FLOAT
	);

CREATE TABLE healthcareServices
	(
		healthcareID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), phone VARCHAR(50), locationID INT,
        Foreign Key (locationID) REFERENCES location(locationID)
        );

