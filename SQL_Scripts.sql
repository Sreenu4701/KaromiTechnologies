CREATE DATABASE KaromiTechDB
GO

USE KaromiTechDB
GO


CREATE TABLE Trains(
[TrainNumber]		INT				PRIMARY KEY		IDENTITY(10000,1),
[TrainName]			VARCHAR(MAX)	NOT NULL,
[Schedule_Days]		VARCHAR(MAX)	NOT NULL
)
GO

CREATE TABLE TrainStops(
[Id]				INT				PRIMARY KEY		IDENTITY(1,1),
[TrainNumber]		INT			FOREIGN KEY REFERENCES Trains(TrainNumber),
[Source]			VARCHAR(MAX)	NOT NULL,
[Destination]		VARCHAR(MAX)	NOT NULL,
[Stops]				VARCHAR(MAX)	NOT NULL,
[SourceTime]		VARCHAR(MAX)	NOT NULL,
[DestinationTime]	VARCHAR(MAX)	NOT NULL
)
GO

CREATE TABLE BookingList(
[Id]				INT				PRIMARY KEY		IDENTITY(1,1),
[TrainNumber]		INT			FOREIGN KEY REFERENCES Trains(TrainNumber),
[NAME]				VARCHAR(50)		NOT NULL,
[Email]				VARCHAR(100)	NOT NULL,
[ModeOfJourney]		INT				NOT NULL,
[NoOfSeats]			INT				NOT NULL,
[Source]			VARCHAR(50)		NOT NULL,
[Destination]		VARCHAR(50)		NOT NULL,
[Date]				DATETIME		NOT NULL,
[Fare]				INT				NOT NULL
)
GO


INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Charminar Express', 'DAILY')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Sangamitra Express', 'Mon,Fri')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Santraganchi Express', 'Wed,Sat')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('NavJeevan SF Express', 'DAILY')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Shatabdi Express', 'Tue,Wed,Fri')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Hyderabad SF Express', 'DAILY')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Chennai Express', 'Thu,Fri,Sat,Sun')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Bhuvaneswar Express', 'DAILY')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Visakha Express', 'Mon,Tue,Fri')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Andaman Express', 'Tue,Wed,Sat')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('JanShatabdi Express', 'DAILY')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Hyderabad Express', 'DAILY')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Kachiguda Express', 'Tue,Thu,Fri')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('MAS SC Express', 'DAILY')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Duronto Express', 'Mon,Fri')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('TamilNadu Express', 'DAILY')
INSERT INTO TRAINS(TrainName,Schedule_Days) VALUES('Grand Trunk SF Express', 'DAILY')
Go
SELECT * FROM TRAINS
Go

INSERT INTO TrainStops(TrainNumber,[Source],Destination,Stops,SourceTime,DestinationTime)
	VALUES(10000, 'Chennai','Hyderabad','Sullurpet,Gudur,Nellore,Ongole,Tenali,Guntur,Vijayawada,Warangal,Secunderabad','4 PM,5 PM,6 PM,7 PM,8 PM,9 PM,10 PM,11 PM,12 AM,1 AM','4.55 PM,5.55 PM,6.55 PM,7.55 PM,8.55 PM,9.55 PM,10.55 PM,11.55 PM,12.55 AM,2 AM')
INSERT INTO TrainStops(TrainNumber,[Source],Destination,Stops,SourceTime,DestinationTime)
	VALUES(10005, 'Chennai','Hyderabad','Sullurpet,Gudur,Nellore,Ongole,Tenali,Guntur,Vijayawada,Warangal,Secunderabad','2 PM,3 PM,4 PM,5 PM,6 PM,7 PM,8 PM,9 PM,10 PM,11 PM,','2.55 PM,3.55 PM,4.55 PM,5.55 PM,6.55 PM,7.55 PM,8.55 PM,9.55 PM,10.55 PM,12 AM')
INSERT INTO TrainStops(TrainNumber,[Source],Destination,Stops,SourceTime,DestinationTime)
	VALUES(10013, 'Chennai','Hyderabad','Sullurpet,Gudur,Nellore,Ongole,Tenali,Guntur,Vijayawada,Warangal,Secunderabad','4 PM,5 PM,6 PM,7 PM,8 PM,9 PM,10 PM,11 PM, 12 AM,1 AM','4.55 PM,5.55 PM,6.55 PM,7.55 PM,8.55 PM,9.55 PM,10.55 PM,11.55 PM, 12.55 AM,2 AM')
INSERT INTO TrainStops(TrainNumber,[Source],Destination,Stops,SourceTime,DestinationTime)
	VALUES(10007, 'Chennai','Bhuvaneswar','Sullurpet,Nellore,Ongole,Guntur,Vijayawada,Rajamundry,Visakhapatnam,Srikakulam,Brahmapur','9 PM,10 PM,11 PM, 12 AM,1 AM,2 AM,3 AM,4 AM,5 AM,6 AM','9.55 PM,10.55 PM,11.55 PM,12.55 AM,1.55 AM,2.55 AM,3.55 AM,4.55 AM,5.55 AM,7 AM')
INSERT INTO TrainStops(TrainNumber,[Source],Destination,Stops,SourceTime,DestinationTime)
	VALUES(10009, 'Chennai','New Delhi','Gudur,Vijayawada,Khammam,Warangal,Ramagundam,Chandrapur,Itarsi,Bhopal,Jhansi','4 PM,6 PM,8 PM,10 PM,12 AM,1 AM,3 AM,5 AM, 8 AM,10 AM','5.55 PM,7.55 PM,9.55 PM,11.55 PM,12.55 AM,2.55 AM,4.55 AM,7.55 AM,9.55 AM,11.30 AM')
INSERT INTO TrainStops(TrainNumber,[Source],Destination,Stops,SourceTime,DestinationTime)
	VALUES(10014, 'Chennai','New Delhi','Gudur,Vijayawada,Khammam,Warangal,Ramagundam,Chandrapur,Itarsi,Bhopal,Jhansi','4 PM,6 PM,8 PM,10 PM,12 AM,1 AM,3 AM,5 AM, 8 AM,10 AM','5.55 PM,7.55 PM,9.55 PM,11.55 PM,12.55 AM,2.55 AM,4.55 AM,7.55 AM,9.55 AM,11.30 AM')
INSERT INTO TrainStops(TrainNumber,[Source],Destination,Stops,SourceTime,DestinationTime)
	VALUES(10016, 'Chennai','New Delhi','Gudur,Vijayawada,Khammam,Warangal,Ramagundam,Chandrapur,Itarsi,Bhopal,Jhansi','4 AM,6 AM,8 AM,10 AM,12 PM,1 PM,3 PM,5 PM, 8 PM,10 PM','5.55 AM,7.55 AM,9.55 AM,11.55 PM,12.55 PM,2.55 PM,4.55 PM,7.55 PM,9.55 PM,11.30 PM')
GO
SELECT * FROM TrainStops
GO



----------------------------------------------------------------------------------------------
-- DATABASE SCRIPTS
----------------------------------------------------------------------------------------------


CREATE FUNCTION UFN_Search (
@source VARCHAR(MAX),
@destination VARCHAR(MAX),
@doj DATETIME
)
RETURNS @SearchList TABLE
(TrainNumber INT, TrainName VARCHAR(100), Schedule_Days VARCHAR(100), [Source] VARCHAR(100), [Destination] VARCHAR(100), Stops VARCHAR(MAX), SourceTime VARCHAR(MAX), DestinationTime VARCHAR(MAX))
AS
BEGIN

DECLARE @DATEOFJOURNEY VARCHAR(10) ;
select @DATEOFJOURNEY=datename(dw,getdate());

	IF EXISTS (SELECT 1 FROM Trains T1 JOIN TrainStops T2 ON T1.TrainNumber=T2.TrainNumber WHERE Source=@source AND Destination=@destination AND ((Schedule_Days LIKE '%'+ SUBSTRING(@DATEOFJOURNEY,1,3) +'%') OR UPPER(Schedule_Days) = UPPER('Daily')))
	BEGIN
		INSERT @SearchList
			SELECT T1.TrainNumber,T1.TrainName,T1.Schedule_Days,T2.Source,T2.Destination,T2.Stops,T2.SourceTime,T2.DestinationTime FROM Trains T1 JOIN TrainStops T2 ON T1.TrainNumber=T2.TrainNumber 
			WHERE Source=@source AND Destination=@destination  AND ((Schedule_Days LIKE '%'+ SUBSTRING(@DATEOFJOURNEY,1,3) +'%') OR UPPER(Schedule_Days) = UPPER('Daily'))
	END
	IF EXISTS (SELECT 1 FROM Trains T1 JOIN TrainStops T2 ON T1.TrainNumber=T2.TrainNumber WHERE Stops LIKE '%'+@source+'%' AND Destination=@destination AND ((Schedule_Days LIKE '%'+ SUBSTRING(@DATEOFJOURNEY,1,3) +'%') OR UPPER(Schedule_Days) = UPPER('Daily')))
	BEGIN
		INSERT @SearchList
			SELECT T1.TrainNumber,T1.TrainName,T1.Schedule_Days,T2.Source,T2.Destination,T2.Stops,T2.SourceTime,T2.DestinationTime FROM Trains T1 JOIN TrainStops T2 ON T1.TrainNumber=T2.TrainNumber 
			WHERE Stops LIKE '%'+@source+'%' AND Destination=@destination  AND ((Schedule_Days LIKE '%'+ SUBSTRING(@DATEOFJOURNEY,1,3) +'%') OR UPPER(Schedule_Days) = UPPER('Daily'))
	END
	IF EXISTS (SELECT 1 FROM Trains T1 JOIN TrainStops T2 ON T1.TrainNumber=T2.TrainNumber WHERE Source=@source AND Stops LIKE '%'+@destination+'%' AND ((Schedule_Days LIKE '%'+ SUBSTRING(@DATEOFJOURNEY,1,3) +'%') OR UPPER(Schedule_Days) = UPPER('Daily')))
	BEGIN
		INSERT @SearchList
			SELECT T1.TrainNumber,T1.TrainName,T1.Schedule_Days,T2.Source,T2.Destination,T2.Stops,T2.SourceTime,T2.DestinationTime FROM Trains T1 JOIN TrainStops T2 ON T1.TrainNumber=T2.TrainNumber 
			WHERE Source=@source AND Stops LIKE '%'+@destination+'%'  AND ((Schedule_Days LIKE '%'+ SUBSTRING(@DATEOFJOURNEY,1,3) +'%') OR UPPER(Schedule_Days) = UPPER('Daily'))
	END
	ELSE IF EXISTS (SELECT 1 FROM Trains T1 JOIN TrainStops T2 ON T1.TrainNumber=T2.TrainNumber WHERE Stops LIKE '%'+@source+'%' AND Stops LIKE '%'+@destination+'%'  AND (Schedule_Days LIKE '%'+ SUBSTRING(@DATEOFJOURNEY,1,3) +'%' OR UPPER(Schedule_Days) = UPPER('Daily')))
	BEGIN
		INSERT @SearchList
			SELECT T1.TrainNumber,T1.TrainName,T1.Schedule_Days,T2.Source,T2.Destination,T2.Stops,T2.SourceTime,T2.DestinationTime FROM Trains T1 JOIN TrainStops T2 ON T1.TrainNumber=T2.TrainNumber 
			WHERE Stops LIKE '%'+@source+'%' AND Stops LIKE '%'+@destination+'%'  AND (Schedule_Days LIKE '%'+ SUBSTRING(@DATEOFJOURNEY,1,3) +'%' OR UPPER(Schedule_Days) = UPPER('Daily'))
	
	END

	RETURN
END
GO

SELECT * FROM UFN_Search('Gudur','Warangal',GETDATE())
GO


CREATE PROCEDURE BookingSP(
@TrainNumber INT,
@Name VARCHAR(50),
@Email VARCHAR(100),
@Doj DATETIME,
@ModeOfJourney INT,
@NoOfSeats INT,
@TotalFare INT,
@Source VARCHAR(100),
@Destination VARCHAR(100)
)
AS 
BEGIN
	BEGIN TRY
		INSERT INTO BookingList
		VALUES(@TrainNumber, @Name, @Email, @ModeOfJourney, @NoOfSeats, @Source, @Destination, @Doj, @TotalFare)
		RETURN 1
	END TRY
	BEGIN CATCH
		RETURN -1
	END CATCH

END
GO

EXEC BOOKINGSP @TrainNumber= 10005,@Name= 'Sreenu P',@Email= 'patsree1212@gmail.com',
				@Doj= '12-12-2020',@ModeOfJourney= 2,@NoOfSeats= 2,@TotalFare= 374,@Source= 'Gudur',@Destination= 'Nellore'
GO



