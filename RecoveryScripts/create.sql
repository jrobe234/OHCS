    
CREATE TABLE location
	(
		locationID INT NOT NULL, postCode INT, latitude FLOAT, longitude FLOAT,
		PRIMARY KEY(locationID)
	);

CREATE TABLE healthcareServices
	(
		healthcareID INT NOT NULL, name VARCHAR(50), phone VARCHAR(50), serviceType INT, locationID INT,
		 PRIMARY KEY (healthcareID),
        Foreign Key (locationID) REFERENCES location(locationID)
        );

create sequence hcSeq 
	start with 1 
	increment by 1 
	nomaxvalue; 		

	create trigger hcTrigg
	before insert on healthcareServices
		for each row
		begin
			select hcSeq.nextval into :new.healthcareID from dual;
		end;
		/

create sequence locSeq 
	start with 1 
	increment by 1 
	nomaxvalue; 		

	create trigger locTrigg
	before insert on location
		for each row
		begin
			select locSeq.nextval into :new.locationID from dual;
		end;
		/