CREATE TABLE IF NOT EXISTS Catalogazione
(
	Modello varchar(20) NOT NULL PRIMARY KEY,
	Costruzione varchar(25) NOT NULL,
	FunzioneAereo varchar(25) NOT NULL,
	nPosti smallint,
	CapCarico int
);

CREATE TABLE IF NOT EXISTS Aereo
(
	ID varchar(8) NOT NULL PRIMARY KEY,
	Modello varchar(20) NOT NULL,
	Azienda varchar(40) NOT NULL,
	Status varchar(30) NOT NULL
	);

CREATE TABLE IF NOT EXISTS Tratte
(
	Numero bigint NOT NULL PRIMARY KEY,
	Tipo varchar(15) NOT NULL,
Arrivo varchar(35) NOT NULL,
Partenza varchar(35) NOT NULL,
SpazioAereo varchar(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS Volo
(
	nVolo varchar(15) NOT NULL,
	IDAereo varchar(8) NOT NULL,
Tratta bigint NOT NULL,
Stato varchar(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS SpecificheVolo
(
	nVolo varchar(15) NOT NULL PRIMARY KEY,
	PartPrevista DATETIME NOT NULL,
ArrPrevisto DATETIME NOT NULL,
Ritardo smallint NOT NULL,
nPostiOccupati smallint NOT NULL
);

CREATE TABLE IF NOT EXISTS PersonaleDiBordo
(
	Matricola varchar(10) NOT NULL,
	Ruolo varchar (15) NOT NULL,
nVolo varchar(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS DatiDipendenti
(
	Matricola varchar(10) NOT NULL PRIMARY KEY,
	CF varchar(16) NOT NULL,
Nome varchar(25) NOT NULL,
Cognome varchar(15) NOT NULL,
Indirizzo varchar(30) NOT NULL,
Citta varchar(45) NOT NULL,
	Stato varchar(30) NOT NULL,
CAP varchar(10) NOT NULL,
DataNascita Date NOT NULL,
telPrivato varchar(15) NOT NULL,
nPassaporto varchar(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Dipendenti
(
	Matricola varchar(10) NOT NULL PRIMARY KEY,
	Azienda varchar(40) NOT NULL,
telAziendale varchar(15) NOT NULL
);


CREATE TABLE IF NOT EXISTS Clienti
(
	CF varchar(16) NOT NULL PRIMARY KEY,
nVolo varchar(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS DatiClienti
(
	CF varchar(16) NOT NULL PRIMARY KEY,
Nome varchar(25) NOT NULL,
Cognome varchar(15) NOT NULL,
Indirizzo varchar(30) NOT NULL,
Citta varchar(30) NOT NULL,
CAP varchar(10) NOT NULL,
Stato varchar(30) NOT NULL,
DataNascita date NOT NULL,
telPrivato varchar(15) NOT NULL,
nPassaporto varchar(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Azienda
(
	Nome varchar(45) NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Sede
(
	Azienda varchar(45) NOT NULL PRIMARY KEY,
	Telefono varchar(30) NOT NULL,
	Indirizzo varchar(100) NOT NULL,
Citta varchar(55) NOT NULL,
CAP varchar(15) NOT NULL,
	Stato varchar(35) NOT NULL
);

CREATE TABLE IF NOT EXISTS Servizio
(
	ID varchar(6) NOT NULL PRIMARY KEY,
	Nome varchar(20) NOT NULL,
	Azienda varchar(40) NOT NULL,
	Stato varchar(25) NOT NULL,
Descrizione varchar(150) NOT NULL,
Localizzazione varchar(8) NOT NULL,
Responsabile varchar(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS Luogo
(
	ID varchar(8) NOT NULL,
	SicurezzaApplicata varchar(20) NOT NULL,
	Zona varchar(20) NOT NULL,
	Tipologia varchar(20) NOT NULL,
	Descrizione varchar(150) NOT NULL,
PRIMARY KEY(ID,SicurezzaApplicata)
);

CREATE TABLE IF NOT EXISTS Parcheggi
(
	ID varchar(8) NOT NULL PRIMARY KEY,
Stato varchar(20) NOT NULL,
Terminal varchar(8) NOT NULL
);


CREATE TABLE IF NOT EXISTS PrenotazioneParcheggio
(
	ID varchar(8) NOT NULL,
Inizio DATETIME NOT NULL,
	IDAereo varchar(8) NOT NULL,
	Fine DATETIME,
PRIMARY KEY (ID, Inizio, IDAereo)
);
ALTER TABLE Aereo ADD FOREIGN KEY (Modello) REFERENCES Catalogazione (Modello) ;
ALTER TABLE Aereo ADD FOREIGN KEY (Azienda) REFERENCES Azienda (Nome) ;
ALTER TABLE PrenotazioneParcheggio ADD FOREIGN KEY (IDAereo) REFERENCES Aereo (ID) ;
ALTER TABLE PrenotazioneParcheggio ADD FOREIGN KEY (ID) REFERENCES Parcheggi (ID) ;
ALTER TABLE Parcheggi ADD FOREIGN KEY (ID) REFERENCES Luogo (ID) ;
ALTER TABLE Volo ADD FOREIGN KEY (nVolo) REFERENCES SpecificheVolo (nVolo) ;
ALTER TABLE Volo ADD FOREIGN KEY (IDAereo) REFERENCES Aereo (ID) ;
ALTER TABLE Volo ADD FOREIGN KEY (Tratta) REFERENCES Tratte (Numero) ;

ALTER TABLE PersonaleDiBordo ADD FOREIGN KEY (Matricola) REFERENCES Dipendenti (Matricola) ;
ALTER TABLE PersonaleDiBordo ADD FOREIGN KEY (nVolo) REFERENCES SpecificheVolo (nVolo) ;

ALTER TABLE DatiDipendenti ADD FOREIGN KEY (Matricola) REFERENCES Dipendenti (Matricola) ;

ALTER TABLE Dipendenti ADD FOREIGN KEY (Azienda) REFERENCES Azienda (Nome) ;

ALTER TABLE Clienti ADD FOREIGN KEY (nVolo) REFERENCES SpecificheVolo (nVolo) ;

ALTER TABLE DatiClienti ADD FOREIGN KEY (CF) REFERENCES Clienti (CF) ;

ALTER TABLE Sede ADD FOREIGN KEY (Azienda) REFERENCES Azienda (Nome) ;

ALTER TABLE Servizio ADD FOREIGN KEY (Azienda) REFERENCES Azienda (Nome) ;
ALTER TABLE Servizio ADD FOREIGN KEY (Localizzazione) REFERENCES Luogo (ID) ;
ALTER TABLE Servizio ADD FOREIGN KEY (Responsabile) REFERENCES Dipendenti (Matricola) ;

INSERT INTO SpecificheVolo (nVolo, PartPrevista, ArrPrevisto, Ritardo, nPostiOccupati) VALUES
('KL427', '2018-3-18 14:34', '2018-3-18 23:59', '0', '310'),
('EK90', '2018-3-18 14:37', '2018-3-18 23:51', '0', '402'),
('EK22', '2018-3-18 08:45', '2018-3-18 19:45', '103', '800'),
('EK136', '2018-3-18 15:13', '2018-3-18 23:51', '2', '233'),
('DY4601', '2018-3-18 15:13', '2018-3-18 00:56', '0', '207'),
('QF001', '2018-3-18 16:59', '2018-3-18 00:56', '16', '542'),
('FZ151', '2018-3-18 21:35', '2018-3-18 00:50', '0', '0'),
('SG052', '2018-3-18 23:59', '2018-3-18 04:25', '0', '179'),
('BG148', '2018-3-18 00:05', '2018-3-18 06:55', '0', '203'),
('AI996', '2018-3-18 12:31', '2018-3-18 05:12', '27', '210'),
('EK705', '2018-3-18 02:30', '2018-3-18 07:11', '0', '452'),
('AF655', '2018-3-18 01:30', '2018-3-18 06:05', '0', '299'),
('LH631', '2018-3-18 01:50', '2018-3-18 05:50', '0', '479'),
('VS401', '2018-3-18 12:55', '2018-3-18 16:49', '90', '198'),
('EK871', '2018-3-18 12:00', '2018-3-18 12:50', '0', '105');

INSERT INTO Clienti (CF, nVolo) VALUES
('ZTEGPP83C22A757S', 'EK136'),
('BRSLSN85E18L840X', 'BG148'),
('NDRGNN87E07G224O', 'EK90'),
('CMRGRT85H68L840D', 'EK136'),
('BNCMRA88L05H501Y', 'EK705'),
('FMGLCA72C43F205K', 'EK871'),
('CRBNGL91D47F205E', 'LH631'),
('NRELSS89A47L219T', 'AF655'),
('SPRLSN86H16H501T', 'VS401'),
('RSSLLL90T67D612Q', 'VS401'),
('FMGLCU81R05F205K', 'VS401'),
('BNCFNC70C27B157F', 'VS401'),
('MNTFNC87P60G224A', 'AI996'),
('CSLLCU87E01L840D', 'FZ151'),
('ZGLLNZ87M26L840D', 'KL427');

INSERT INTO DatiClienti (CF, Nome, Cognome, Indirizzo, Citta, Stato, CAP, DataNascita, telPrivato, nPassaporto) VALUES
('ZTEGPP83C22A757S', 'Giuseppe', 'Zeta', 'Via Luigi XIV, 12', 'Belluno (BL)', 'Italy', '32100', '1983-03-22', '3476547202', 'EZ5048F2'),
('CMRGRT85H68L840D', 'Greta', 'Camerini', 'Via Rossi, 72', 'Vicenza (VI)', 'Italy', '36100', '1985-06-28', '3337225091', 'CC4987E2'),
('BRSLSN85E18L840X', 'Alessandro', 'Bross', 'Via Giuseppe Verdi, 5', 'Vicenza (VI)', 'Italy', '36100', '1985-05-18', '3493307274', 'XS90S409'),
('NDRGNN87E07G224O', 'Giovanni', 'Indirizzo', 'Via Paolotti, 2', 'Padova (PD)', 'Italy', '35131', '1987-05-07', '392717520', 'AZ6H791'),
('BNCMRA88L05H501Y', 'Mario', 'Bianchi', 'Via Abruzzo, 52', 'Roma (RM)', 'Italy', '00127', '1988-07-05', '3920074782', 'LE3435H'),
('FMGLCA72C43F205K', 'Alice', 'Fumagalli', 'Corso Buenos Aires, 3', 'Milano (MI)', 'Italy', '20019', '1972-03-03', '3407175698', 'IJ990A3'),
('CRBNGL91D47F205E', 'Angela', 'Carboni', 'Via Chopin, 7/A', 'Milano (MI)', 'Italy', '20019', '1991-04-07', '3485977320', 'TT903A67'),
('NRELSS89A47L219T', 'Alessia', 'Neri', 'Via Emanuele Filiberto, 9', 'Torino (TO)', 'Italy', '10121', '1989-01-07', '3928856703', 'WQ8980H'),
('SPRLSN86H16H501T', 'Alessandro', 'Spiretti', 'Via Abano, 95', 'Roma (RM)', 'Italy', '00127', '1986-06-16', '3445209991', 'TY789G12'),
('RSSLLL90T67D612Q', 'Lucilla', 'Rossetti', 'Via Torino, 4/A', 'Firenze (FI)', 'Italy', '50100', '1990-12-27', '3209873451', 'FG789A1'),
('FMGLCU81R05F205K', 'Lucio', 'Fumagalli', 'Corso Sempione, 6', 'Milano (MI)', 'Italy', '20099', '1981-10-05', '3478897072', 'PA459I0L'),
('BNCFNC70C27B157F', 'Francesco', 'Bianchini', 'Via 7 Nani, 2', 'Brescia (BS)', 'Italy', '25121', '1970-03-27', '3907475218', 'ZR172953F'),
('MNTFNC87P60G224A', 'Francesca', 'Mantese', 'Via Paolotti, 6', 'Padova (PD)', 'Italy', '35131', '1987-09-20', '3407265419', 'E535641'),
('CSLLCU87E01L840D', 'Luca', 'Casalini', 'Via Cinque Stelle, 5', 'Valli del Pasubio (VI)', 'Italy', '36010', '1987-05-01', '3446170112', 'VI4107254A'),
('ZGLLNZ87M26L840D', 'Lorenzo', 'Zaglia', 'Leith Street, 42', 'Edinburgh', 'United Kingdom', 'EH1 1BE', '1987-08-26', '3336754132', 'CA00314AE' ) ;

INSERT INTO Tratte (Numero, Tipo, Arrivo, Partenza, SpazioAereo) VALUES
('001', 'Internazionale', 'Dubai, UAE (DXB)', 'Amsterdam, Netherlands (AMS)', 'B772'),
('010', 'Internazionale', 'Dubai, UAE (DXB)', 'Geneva, Switzerland (GVA)', 'B774'),
('011', 'Internazionale', 'Dubai, UAE (DXB)', 'Manchester, UK (MAN)', 'G388'),
('100', 'Internazionale', 'Dubai, UAE (DXB)', 'Venezia, Italia (VCE)', 'B777'),
('101', 'Internazionale', 'Dubai, UAE (DXB)', 'Stoccolma, Svezia (ARN)', 'B738'),
('110', 'Internazionale', 'Dubai, UAE (DXB)', 'Sydney, Australia (SYD)', 'L388'),
('1000', 'Internazionale', 'Dubai, UAE (DXB)', 'Mashhad, Iran (MHD)', 'B740'),
('111', 'Internazionale', 'Pune, India (PNQ)', 'Dubai, UAE (DXB)', 'B797'),
('1101', 'Internazionale', 'Chittagong, Bangladesh (CGP)', 'Dubai, UAE (DXB)', 'B701'),
('1010', 'Internazionale', 'Mahé, Seychelles (SEZ)', 'Dubai, UAE (DXB)', 'B747'),
('1111', 'Internazionale', 'Paris, France (CDG)', 'Dubai, UAE (DXB)', 'B772'),
('1011', 'Internazionale', 'Frankfurt, Germany (FRA)', 'Dubai, UAE (DXB)', 'B744'),
('1100', 'Internazionale', 'London Heathrow, UK (LHR)', 'Dubai, UAE (DXB)', 'A725'),
('1110', 'Internazionale', 'Dubai, UAE (DXB)', 'Al Kuwait, Kuwait', 'L771'),
('1001', 'Internazionale', 'Dubai, UAE (DXB)', 'New Delhi, India (DEL)', 'L404');

INSERT INTO Catalogazione (Modello, Costruzione, FunzioneAereo, nPosti, CapCarico) VALUES
('777-206', 'Boeing', 'Trasporto Passeggeri', '316', '0'),
('777-300', 'Boeing', 'Trasporto Passeggeri', '468', '0'),
('A3480-861', 'Airbus', 'Trasporto Passeggeri', '868', '0'),
('777-31', 'Boeing', 'Trasporto Passeggeri', '304', '0'),
('737-8', 'Boeing', 'Trasporto Passeggeri', '215' , '0'),
('A380-841', 'Airbus', 'Trasporto Passeggeri', '645', '0'),
('787-8', 'Boeing', 'Trasporto Passeggeri', '210', '0'),
('777-228', 'Boeing', 'Trasporto Passeggeri', '314', '0'),
('747-430', 'Boeing', 'Trasporto Passeggeri', '563', '0'),
('A330-343', 'Airbus', 'Trasporto Passeggeri', '232', '0'),
('747-8', 'Boeing', 'Cargo', '0', '150.000');

INSERT INTO Luogo (ID, SicurezzaApplicata, Zona, Tipologia, Descrizione) VALUES
('01A', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti '),
('01B', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti '),
('01D', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti '),
('01E', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti ' ),
('01C', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti '),
('01F', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti '),
('01G', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti '),
('01H', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti '),
('01I', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti '),
('01J', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti'),
('01K', 'Telesorveglianza', 'Piano Terra', 'Vendita Biglietti', 'spazio di vendita-controllo biglietti '),
('05A', 'Telesorveglianza', 'Piano Terra', 'Ristorazione', 'zona produzione-consumo di cibo e bevande'),
('05B', 'Telesorveglianza', 'Piano Terra', 'Altro', 'zona per servizi vari'),
('05C', 'Telesorveglianza', 'Piano Terra', 'Altro', 'zona per servizi vari'),
('05D', 'Telesorveglianza', 'Piano Terra', 'Altro', 'zona predisposta per servizi di vendita telematici'),
('05F', 'Telesorveglianza', 'Piano Terra', 'Ristorazione', 'zona produzione-consumo di cibo e bevande'),
('05H', 'Telesorveglianza', 'Piano Terra', 'Terminal', 'zona destinata a servizi di sicurezza'),
('07B', 'Telesorveglianza', 'Primo Piano', 'Ristorazione', 'zona produzione consumo di cibo e bevande'),
('07D', 'Telesorveglianza', 'Primo Piano', 'Terminal', 'zona destinata a servizi di sicurezza '),
('07D', 'Pattuglia Armata', 'Primo Piano', 'Terminal', 'zona destinata a servizi di sicurezza '),
('07F', 'Telesorveglianza', 'Primo Piano', 'Vendita', 'zona vendita di beni fisici'),
('07J', 'Telesorveglianza', 'Primo Piano', 'Altro', 'zona ad alta sicurezza'),
('07J', 'Guardia Fissa', 'Primo Piano', 'Altro', 'zona ad alta sicurezza'),
('07L', 'Telesorveglianza', 'Primo Piano', 'Altro', 'zona destinata a servizi di sicurezza'),
('07T', 'Telesorveglianza', 'Primo Piano', 'Terminal', 'sala di attesa'),
('11E', 'Telesorveglianza', 'Secondo Piano', 'Vendita', 'zona vendita di beni fisici'),
('11F', 'Telesorveglianza', 'Secondo Piano', 'Altro', 'zona ad alta sicurezza'),
('11F', 'Guardia Fissa', 'Secondo Piano', 'Altro', 'zona ad alta sicurezza'),
('11L', 'Telesorveglianza', 'Secondo Piano', 'Altro', 'zona ad alta sicurezza'),
('11L', 'Guardia Fissa', 'Secondo Piano', 'Altro', 'zona ad alta sicurezza'),
('15', 'Telesorveglianza', 'Esterno Piano Terra', 'Vendita', 'zona esterna all edificio principale, disponibile per servizi vari'),
('16A', 'Telesorveglianza', 'Piano Interrato', 'Altro', 'zona predisposta per servizi medici'),
('16A', 'Guardia Fissa', 'Piano Interrato', 'Altro', 'zona predisposta per servizi medici'),
('16B', 'Telesorveglianza', 'Piano Interrato', 'Altro', 'zona predisposta per servizi religiosi'),
('16C', 'Telesorveglianza', 'Piano Interrato', 'Deposito', 'zona destinata a servizi di sicurezza'),
('T1','Pattuglia Armata', 'Esterno Piano Terra', 'Terminal', 'zona imbarco e controllo bagagli #1'),
('T2','Pattuglia Armata', 'Esterno Piano Terra', 'Terminal', 'zona imbarco e controllo bagagli #2'),
('T3', 'Pattuglia Armata', 'Esterno Piano Terra', 'Terminal', 'zona imbarco e controllo bagagli #3'),
('000','Telesorveglianza', 'Intero aeroporto', 'Altro', 'Intero aeroporto'),
('000', 'Guardie Fisse', 'Intero aeroporto', 'Altro', 'Intero aeroporto'),
('000', 'Pattuglia Armata', 'Intero aeroporto', 'Altro', 'Intero aeroporto'),
('E18', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('F21', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('F12', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('EZ18', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('B3', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('A5', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('L2', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('F7', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('C1', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('D3', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('D4', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('D5', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('D6', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('B4', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('B5', 'Telesorveglianza', 'Esterno Piano Terra', 'Parcheggio', 'zona di sosta aeromobili'),
('77A', 'Pattuglia Armata', 'Esterno', 'Altro', 'Pista di atterraggio'),
('77B', 'Pattuglia Armata', 'Esterno', 'Altro', 'Pista di atterraggio'),
('77C', 'Pattuglia Armata', 'Esterno', 'Altro', 'Pista di atterraggio'),
('77D', 'Pattuglia Armata', 'Esterno', 'Altro', 'Pista di atterraggio');

INSERT INTO Parcheggi (ID, Stato, Terminal) VALUES
('E18', 'Prenotato', 'T1'),
('F21', 'Prenotato', 'T1'),
('F12', 'Prenotato', 'T2'),
('EZ18', 'Prenotato', 'T3'),
('B3', 'Prenotato', 'T3'),
('A5', 'Occupato', 'T1'),
('L2', 'Prenotato', 'T2'),
('F7', 'Prenotato', 'T2'),
('C1', 'Prenotato', 'T3'),
('D3', 'Occupato','T1'),
('D4', 'Occupato','T1'),
('D5', 'Libero', 'T1'),
('D6', 'Libero','T1'),
('B4', 'Libero','T1'),
('B5', 'Libero','T1');

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO PrenotazioneParcheggio (ID, Inizio, IDAereo, Fine) VALUES
('E18', '2018-03-18 23:50', 'F84678', '2018-03-19 07:30'),
('F21', '2018-03-18 23:42', 'KG9567B', '2018-03-19 06:30'),
('F12', '2018-03-18 19:38', 'SS0001', '2018-03-18 21:20'),
('EZ18', '2018-03-18 11:40', 'K05771', '2018-03-21 18:30'),
('B3', '2018-03-18 00:30', '6001LOG2', '2018-03-19 08:35'),
('A5', '2018-03-18 19:35', 'T5498', '2018-03-18 01:20'),
('L2', '2018-03-18 12:32', 'AQ764', '2018-03-20 12:50'),
('F7', '2018-03-18 04:00', 'V07561D', '2018-03-19 16:35'),
('C1', '2018-03-18 04:50', 'Z99916', '2018-03-22 06:30'),
('D3', '2018-03-18 11:50', 'LAB7468', '2018-03-18 13:30'),
('D5', '2018-03-18 11:00', 'H95817D', '2018-03-18 14:20');

INSERT INTO Aereo (ID, Modello, Azienda, Status) VALUES
('F84678', '777-206', 'Air France', 'In Volo'),
('KG9567B', '777-300', 'Emirates Airline', 'In Volo'),
('SS0001', 'A380-861', 'Emirates Airline', 'In Volo'),
('K05771', '777-31', 'Emirates Airline', 'In Volo'),
('6001LOG2', '737-8', 'Norwegian Air Shuttle', 'In Volo'),
('AQ764', 'A380-841', 'Qantas', 'In Volo'),
('T5498', '737-8', 'FlyDubai', 'Pronto'),
('V07561D', '737-8', 'SpiceJet', 'In Volo'),
('G35780A', '737-8', 'Biman Bangladesh Airlines', 'Rifornimento Carburante'),
('Z99916', '787-8', 'Air India', 'In Volo'),
('EA986B', '777-300', 'Emirates Airline', 'Pronto'),
('C22239B', '777-228', 'Air France' , 'In Volo'),
('F769820', '747-430', 'Lufthansa', 'Atterrato'),
('H95817D', 'A330-343', 'Virgin Atlantic Airways Limited', 'Ritardo nel Volo Precedente'),
('N6067E', '747-8', 'Alitalia', 'Pronto'),
('LAB7468', '777-31', 'Emirates Airline', 'N/D');

INSERT INTO Volo (nVolo, IDAereo, Tratta, Stato) VALUES
('KL427', 'F84678', '001', 'In Volo'),
('EK90', 'KG9567B', '010', 'In Volo'),
('EK22', 'SS0001', '011', 'In Volo'),
('EK136', 'K05771', '100', 'In Volo'),
('DY4601', '6001LOG2', '101', 'In Volo'),
('QF001', 'AQ764', '110', 'In Volo'),
('FZ151', 'T5498', '1000', 'Pronto'),
('SG052', 'V07561D', '111', 'In Volo'),
('BG148', 'G35780A', '1101', 'In Preparazione'),
('AI996', 'Z99916', '1001', 'In Volo'),
('EK705', 'EA986B', '1010', 'Pronto'),
('AF655', 'C22239B', '1111', 'In Volo'),
('LH631', 'F769820', '1011', 'Atterrato'),
('VS401', 'H95817D', '1100', 'Ritardo alla Partenza'),
('EK871', 'LAB7468', '1110', 'Cancellato');


INSERT INTO Azienda (Nome) VALUES
('Air France'),
('Emirates Airline'),
('Norwegian Air Shuttle'),
('Qantas'),
('FlyDubai'),
('SpiceJet'),
('Biman Bangladesh Airlines'),
('Air India'),
('Lufthansa'),
('Virgin Atlantic Airways'),
('Alitalia'),
('Starbucks'),
('Burger King Corporation'),
('Samsonite S.p.A'),
('Sharaf ExChange L.L.C'),
('Hard Rock International'),
('Cicar'),
('Dubai Islamic Bank'),
('Savannah Petroleum'),
('Airport');

INSERT INTO Servizio (ID, Nome, Azienda, Stato, Descrizione, Localizzazione, Responsabile) VALUES
('151A', 'Compagnia Aerea', 'Air France', 'Attivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti, area lounge e servizio clienti', '01A', 'LF53928'),
('151B', 'Compagnia Aerea', 'Emirates Airline', 'Attivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti, area lounge e servizio clienti', '01B', 'LO82483'),
('151C', 'Compagnia Aerea', 'Norwegian Air Shuttle', 'Inattivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti e servizio clienti', '01C', 'LE14910'),
('151D', 'Compagnia Aerea', 'Qantas', 'Inattivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti, area lounge e servizio clienti', '01D', 'LI3194'),
('151E', 'Compagnia Aerea', 'FlyDubai', 'Inattivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti e servizio clienti', '01E', 'LQ14334'),
('151F', 'Compagnia Aerea', 'SpiceJet', 'Attivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti e servizio clienti', '01F', 'LP42059'),
('151G', 'Compagnia Aerea', 'Birman Bangladesh Airlines', 'Attivo', 'Check-in, gate (ed imbarco valigie), vendita biglietti, area lounge e servizio clienti', '01G', 'LT43195'),
('151H', 'Compagnia Aerea', 'Air India', 'Attivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti, area lounge e servizio clienti', '01H', 'LK5203'),
('151I', 'Compagnia Aerea', 'Lufthansa', 'Attivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti, area lounge e servizio clienti', '01I', 'LX31442'),
('151J', 'Compagnia Aerea', 'Alitalia', 'Inattivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti, area lounge e servizio clienti', '01J', 'AU7832'),
('151K', 'Compagnia Aerea', 'Virgin Atlantic Airways Limited', 'Inattivo', 'Check-in (ed imbarco valigie), gate, vendita biglietti e servizio clienti', '01K', 'YU8731'),
('20A', 'Starbucks Coffee', 'Starbucks', 'Inattivo', 'Ristorazione di caffè e dolciari', '05A', 'GP0184'),
('20C', 'Burger King', 'Burger King Corporation', 'Attivo', 'Ristorazione', '07B', 'GP0184'),
('07L', 'Lugagges', 'Samsonite S.p.A.', 'Attivo', 'Negozio di Valigie', '07F', 'GP0184'),
('121B', 'ExChange', 'Sharaf ExChange L.L.C', 'Inattivo', 'Servizio di cambio valuta', '07J', 'GP0184'),
('15TT', 'Duty Free Shop', 'Airport', 'Attivo', 'Vendita profumi e balocchi, cibarie, tabacco, prodotti tipici e alcolici senza imposte', '11E', 'LK9137Y'),
('20K', 'Hard Rock Cafe', 'Hard Rock International', 'Attivo', 'Ristorazione e vendita Gadget del marchio', '05F', 'GP0184'),
('999A', 'Pulizia', 'Airport', 'Attivo', 'Servizio di pulizia aeroportuale', '000', 'LK9137Y'),
('999B', 'Toilettes', 'Airport', 'Attivo-Manutenzione', 'Spazio WC per clienti', '000', 'LK9137Y'),
('999C', 'Passport Control', 'Airport', 'Attivo', 'Spazio Controllo Documenti', '07D', 'LK9137Y'),
('999D', 'Security Check', 'Airport', 'Attivo', 'Spazio Controlli di sicurezza a persone, oggetti personali e bagaglio a mano', '05H', 'LK9137Y'),
('30CR', 'Car Rent', 'Cicar', 'Inattivo', 'Area dedicata al Car Rent', '15', 'GP0184'),
('217G', 'Bank', 'Dubai Islamic Bank', 'Inattivo-Manutenzione', 'Banca di Dubai', '11F', 'GP0184'),
('217H', 'Bank', 'Savannah Petroleum', 'Attivo', 'Banca Internazionale del Niger', '11L', 'GP0184'),
('999E', 'Medical Centre', 'Airport', 'Attivo', 'Centro Medico', '16A', 'LK9137Y'),
('999F', 'Prayer Room', 'Airport', 'Attivo', 'Zona di preghiera', '16B', 'LK9137Y'),
('999G', 'Police', 'Airport', 'Attivo', 'Polizia aeroportuale', '07L', 'LK9137Y'),
('999H', 'Lost Luggage', 'Airport', 'Attivo', 'Area, con desk, dedicata allo smarrimento delle valigie', '16C', 'LK9137Y'),
('999I', 'Flight Information', 'Airport', 'Inattivo-Manutenzione', 'Spazio informativo su voli', '05C', 'LK9137Y'),
('999J', 'Information Desk', 'Airport', 'Attivo', 'Desk informativo al interno del aeroporto, nella zona principale', '05B', 'LK9137Y'),
('999K', 'Ticket Sales Office', 'Airport', 'Attivo', 'Area vendita telematica biglietti aerei last minute scontati', '05D', 'LK9137Y'),
('999L', 'Sala di Attesa', 'Airport', 'Attivo-Manutenzione', 'Area di attesa prima di prendere il volo', '07T', 'LK9137Y'),
('000', 'Airport', 'Airport', 'Attivo', 'Luogo attrezzato per decollo e atterraggio aereomobili', '000', 'LK9137Y'),
('876C', 'Sicurezza Privata', 'Airport', 'Attivo', 'Controllo delle aree del areoporto', '000', 'LF53928');

INSERT INTO Sede (Azienda, Telefono, Indirizzo, Citta, CAP, Stato) VALUES
('Air France', '+33 (0)1 41 56 78 00', '45, Rue de Paris', 'Roissy CDG Cedex', '95747', 'France'),
('Emirates Airline', '+971 (4) 295 1111', 'Airport Road 686', 'Al-Garhoud Dubai', '22631', 'United Arab Emirates'),
('Malaysia Airlines', '+60 3 7843 3000', '3rd Floor, Admin Building 1, MAS Complex A, Sultan Abdul Aziz Shah Airport', '47200 Subang Selangor, Wilayah Persekutuan', '50250', 'Malaysia'),
('Norwegian Air Shuttle', '+47 21 49 00 15', 'Oksenoyveien 10A', 'Fornebu', '1330', 'Norway'),
('Qantas', '+61 2 9691 3636', '10 Bourke Road', 'Mascot, New South Wales', '2020', 'Australia'),
('FlyDubai', '+971 600 544 445', 'ENI Sapphire Tower, Office No. 6, Al Ittihad Rd', 'Port Saeed, Deira - Dubai', '22631', 'United Arab Emirates'),
('SpiceJet', '+91 965 400 3333', '319 Udyog Vihar, Phase IV, Guargaon', 'Haryana', '122016', 'India'),
('Biman Bangladesh Airlines', '+880 2 890 1600', 'Ahmed Tower, 07th Floor/08th Level (South West Corner), 28 and 30 Kamal Ataturk Avenue', 'Banani, Dhaka', '1213', 'Bangladesh'),
('Air India', '+91 22 26 26 5555', 'Air India Building, Narriman Point', 'Mumbai, Maharashtra', '400 021', 'India'),
('Virgin Atlantic Airways', '+44 1293 562 345', 'The Office, Manor Royal', 'Crawley, West Sussex, Chichester', 'RH10 9NU', 'United Kingdom'),
('Lufthansa', '+49 69 68 799 799', 'Deutusche Lufthansa Aktiengesellschaft, Linnicher Straße 48', 'Koln', '50933', 'Germany'),
('Alitalia', '+39 06 65631', 'Via Alberto Nassetti SNC', 'Fiumicino', '00054', 'Italy'),
('Starbucks', '800 782 7282', '2401 Utah Avenue South', 'Seattle, Washington', '98134', 'United States of America'),
('Burger King Corporation', '1 305 378 3000', '5505 Blue Lagoon Dr.', 'Miami, Florida', 'FL 333126', 'United States of America'),
('Samsonite S.p.A', '+39 0230 578 193', 'Via Molino Olio 33', 'Saltrio, Varese', '21050', 'Italy'),
('Sharaf ExChange L.L.C', '+971 4 370 6211', 'Shop no 6, Ground Floor, Mohd Juma Al Naboodha Building', 'Kuwait, Dubai', '00000', 'United Arab Emirates'),
('Hard Rock International', '407 445 7625', '6100 Old Park Lane', 'Orlando, Florida', 'FL 32835', 'United States of America'),
('Cicar', '+34 928 822 900', 'Avda. Mamerto Cabrera, s/n', 'San Bartolome, Lanzarote Canary Islands', '35590', 'Espana'),
('Dubai Islamic Bank', '+971 4 295 3000', 'Al Maktoom Road', 'Dubai', '00000', 'United Arab Emirates'),
('Savannah Petroleum', '+44 (0) 20 3817 9844', '40 Bank Street', 'London', 'E14 5NR', 'United Kingdom'),
('Airport', '+04 224 5555', 'PO Box 2525', 'Dubai', '00000', 'United Arab Emirates');

INSERT INTO Dipendenti (Matricola, Azienda, telAziendale) VALUES
('FM126', 'Air France', '555 782 94'),
('AM124', 'Air France', '545 798 62'),
('FM118', 'Emirates Airline', '474 983 61'),
('AM116', 'Emirates Airline', '343 988 77'),
('AM104', 'Emirates Airline', '90 072 00'),
('FM106', 'Emirates Airline', '89 372 97'),
('FM114', 'Emirates Airline', '10 903 78'),
('FM102', 'Emirates Airline', '88 506 92'),
('AM108', 'Air India', '747 982 503'),
('FM110', 'Virgin Atlantic Airways Limited', '00 782 504'),
('AM112', 'Air France', '567 080 22'),
('LF53928', 'Burger King', '783 2819 1489'),
('LO82483', 'Starbucks', '2471 598 2032'),
('LE14910', 'Luggagges', '5283 52 13'),
('LI3194', 'ExChange', '240 231 1234'),
('LQ14334', 'Airport', '654 319 2464'),
('LP42059', 'Airport', '853 5864 7531'),
('LT43195', 'Airport', '635 6457 4578'),
('LK5203', 'Airport', '853 5769 456'),
('LJ3914', 'Hard Rock Cafe', '572 014 132'),
('LX31442', 'Savannah Petroleum', '44 020 3811 521'),
('AM120', 'Cicar', '89 8768 2332'),
('FM122', 'Duty Free Shop', '32 2839 212'),
('AM128', 'Duty Free Shop', '182 3129 129'),
('FM130', 'Duty Free Shop', '987 812 9211'),
('AM132', 'Duty Free Shop', '718 128 3989'),
('AU7832', 'Alitalia', '987 1299 3287'),
('YU8731', 'Spice Jet', '128 2839 122'),
('GP0184', 'Dubai Islamic Bank', '328 3298 9182'),
('LK9137Y', 'Airport', '219 9238 128'),
('CE4185G', 'Airport', '148 559 20'),
('FF3182C', 'Airport', '776 910 01'),
('DE0666I', 'Airport', '814 222 78'),
('LL1233M', 'Airport', '333 331 13');

INSERT INTO PersonaleDiBordo (Matricola, Ruolo, nVolo) VALUES
('FM126', 'Copilota', 'KL427'),
('AM124', 'Comandante', 'KL427'),
('FM118', 'Copilota', 'EK90'),
('AM116', 'Comandante', 'EK22'),
('AM104', 'Hostess', 'EK22'),
('FM106', 'Hostess', 'EK136'),
('FM114', 'Steward', 'EK705'),
('FM102', 'Steward', 'EK705'),
('AM108', 'Comandante', 'AI996'),
('FM110', 'Copilota', 'VS401'),
('FM130', 'Steward', 'VS401'),
('AM120', 'Hostess', 'LH631'),
('FM122', 'Hostess', 'EK871'),
('AM132', 'Hostess', 'BG148'),
('AM112', 'Comandante', 'AF655');

INSERT INTO DatiDipendenti (Matricola, CF, Nome, Cognome, Indirizzo, Citta, Stato, CAP, DataNascita, telPrivato, nPassaporto) VALUES
('FM102' ,'RSSMRA60H30D426T', 'Mario', 'Rossi', 'Via Serada 5', 'Erto e Casso (PN)', 'Italy', '33080', '1960-06-30', '0638 860542', 'EC8467143'),
('AM104' ,'MLEMTT50C48G224Q', 'Emilia', 'Marietti', 'Via Ugo Bassi, 9', 'Padova (PD)', 'Italy', '35131', '1950-03-08', '049 760423', 'J397541'),
('FM106' , 'CLLGRT79M68I531Q', 'Greta', 'Colletto', 'Via XX Settembre 121A', 'Schio (VI)', 'Italy', '36015', '1979-08-28', '0445 5359761', 'MN957234'),
('AM108', 'GSPDRS88R13E622E', 'Giuseppe Lucio', 'De Ros', 'Via Boe, 67', 'Livinallongo del col di lana (BL)', 'Italy', '32020','1988-10-13', '0498 432100', 'OK00658'),
('FM110', 'DLFNTN69S04A952R', 'Antonio', 'Dal Fabbro', 'Via Claudia Augusta 3', 'Bolzano (BZ)', 'Italy', '39100', '1969-11-04', '343 9468200', 'B843196'),
('AM112', 'KSTGNT73A04D079L', 'Gianantonio Maria', 'Kastrati', 'Via Boè, 91/A', 'Corvara in Badia (BZ)', 'Italy', '39033', '1973-04-01', '345 7920055', 'BZ59268AR'),
('FM114', 'MRCLCU88T28A794R', 'Luca', 'Marchiori', 'Via Luppolo, 71', 'Bergamo (BG)', 'Italy', '24121', '1988-12-28', '347 5987254', 'BG748200A'),
('AM116', 'LLIGNN90L02A794I', 'Giovanni', 'Illò', 'Via Rottini, 54', 'Roma (RM)', 'Italy', '00123', '1990-07-02', '345 926853', 'F521347'),
('FM118', 'BRTLXA88D22D548R', 'Alex', 'Bertolazzi', 'Via Fantini, 22', 'Ferrara (FE)', 'Italy', '44122', '1988-04-22', '347 870952', 'EF5082LE'),
('AM120', 'GNNMRT81T55I829H', 'Marta', 'Giann', 'Via Luigi Ravanello, 15', 'Sondrio (SO)', 'Italy', '23100', '1981-12-15', '333 289673', 'CC79825R'),
('FM122', 'CHRLTN65C69H501A', 'Chiara', 'Altonia', 'Corso del Popolo, 77', 'Roma (RM)', 'Italy', '00123', '1965-03-29', '320 794583', 'CF9918A'),
('AM124', 'FJMJHN92T23E329D', 'John', 'Fuu Jaam', 'Viale Altorio, 2/B', 'Ischia, Napoli (NA)', 'Italy', '80077', '1992-12-23', '338 9877772', 'GV528673'),
('FM126', 'GRNMTT795312E', 'Matt', 'Groeninger', 'Corso Ariel, 311, Scale B', 'Barcelona', 'Spain', '08001', '1979-01-11', '003 8942 48294', 'BC19198A'),
('AM128', 'ZKFVLD92FR78H', 'Vladimir', 'Zukof', 'Libredof Strasse, 91', 'Frankfurt', 'Germany', '60314', '1992-07-18', '090 943 8292', 'PG928EL3'),
('FM130', 'STRLXN82CFH22', 'Alexander', 'Stross', 'Burggraben, 19', 'Innsbruck', 'Austria', '6063', '1982-09-29', '988 852 1484', 'GD592SA'),
('AM132', 'DLLG5321HG7G', 'Gioia', 'Dalla Longa', 'Rua da Graciosa, 5/C', 'Porto', 'Portugal', '4000-011', '1987-01-01', '55 398 07231', 'PT898F5'),
('LF53928', 'LNNSN75HY78T5C', 'Sean Taro', 'Lennon Ono', 'Abbey Street Middle, 8', 'North City, Dublin', 'Ireland', 'A65 TF', '1975-10-09', '92 475 8901', 'SL7895CE'),
('LO82483', 'ERRDN64H88J72I', 'Diana Ernestine', 'Earle Ross', 'Grand River Ave, 2-4/E', 'Detroit', 'United States of America', '48127', '1964-03-26', '080 786 4578', 'ED6789IJ'),
('LE14910', 'BNGLTM75T67C2O', 'Thomas', 'Bangalter', 'Rue Marx Dormoy, 5', 'Paris', 'France', '75004', '1975-01-03', '499 786 0921', 'IJ761LM43'),
('LI3194', 'JGGMP77UTP91', 'Sir Michael Philip Mick', 'Jagger', 'Suffolk Road, F8', 'Dartford, London', 'United Kingdom', 'BR8 7PT', '1977-07-26', '645 781 1679', 'TU781H67'),
('LQ14334', 'CRTVFG80S08B160E', 'Volfgang Edwald', 'Creutzfeld', 'Sankt Pauli 8', 'Hamburg', 'Germany', '20095', '1980-11-08', '480 143 8467', 'KF95718A'),
('LP42059', 'PRTJSF77H18A326P', 'Porta', 'Josef', 'Kungfurstendaam, 161B', 'Berlin', 'Germany', '10115', '1977-06-18', '453 864 1101', 'BK6260B'),
('LT43195', 'HZNPTG85T6666R', 'Peter Gene', 'Hernandez', 'Mokulele Dr, 9', 'Honolulu, Hawaii', 'United States of America', '96795', '1985-08-08', '673 991 6756', 'SW671T61'),
('LK5203', 'BLMBCL72M23L049Z', 'Blom', 'Barcelona', 'Carrer D Arago 1', 'Barcelona', 'Spain', '08006', '1972-08-23', '875 975 268', 'NG9753N'),
('LJ3914', 'SWDSLV83S7675GI2', 'Sylvester', 'Steward', 'Bolivar Street, 33', 'Denton, Texas', 'United States of America', '75065', '1983-03-15', '663 782 5451', 'UI09012L'),
('LX31442', 'DRNGNLD88U8741T', 'LaDonna', 'Adrian Gaines', 'Washington Street 151/Z', 'Boston, Massachusetts', 'United States of America', '02101', '1988-12-31', '752 464 3232', 'GY7219U'),
('AU7832', 'RDGNLG68AUDG894', 'Nile Gregory', 'Rodgers', '802 W 94th Street', 'New York', 'United States of America', '10009', '1968-09-19', '089 728 4108', 'HS743IH873'),
('YU8731', 'KNGVLY87UBH67', 'Evelyn', 'King', '213, Third Avenue', 'New York', 'United States of America', '10009', '1987-07-01', '897 287 2378', 'DH89710'),
('GP0184', 'EDWBRN72UG87', 'Bernard', 'Edwards', '701, Cleveland Street', 'Greenville, South Carolina', 'United States of America', '29601', '1972-10-31', '871 1872 123', 'AD976909'),
('LK9137Y', 'WTMUR71FHI843', 'Maurice', 'White', '171B, Poplar Avenue', 'Memphis, Tennessee', 'United States of America', '38018', '1971-12-19', '419 2247 123', 'AF83912'),
('CE4185G', 'LCCNRO90M69Z103O', 'Ciro', 'Trevisan', 'Via Lagrange, 8', 'Arlena Di Castro (VT)', 'Italia', '01010', '1955-05-19', '0327 5143758', 'DE83459'),
('FF3182C', 'TRVCRI55E19A412T', 'Nora', 'Lucchesi', 'Rue du Bienne 2', 'Ottignies', 'Belgium', '1340', '1990-08-29', '0489 57 33 59', 'CD69873'),
('DE0666I', 'CGRSSN83T42Z404U', 'Susan', 'C. George', '4711 Koontz Lane
Irvine', 'Calfornia', 'United States Of America', '92614', '1983-12-02', '0489 57 33 59', 'BA69012'),
('LL1233M', 'GLALND92A64Z109Q', 'Lucinda', 'Gale', 'Ysitie 32', 'Tampere', 'Finland', '33840', '1992-01-24', '046 862 7708', 'LT69379') ;

SET FOREIGN_KEY_CHECKS=1;


DELIMITER |
CREATE TRIGGER SenzaFine
BEFORE INSERT ON PrenotazioneParcheggio
FOR EACH ROW
BEGIN
IF new.Fine IS NULL THEN SET NEW.Fine='2118-01-01 00:01';
END IF;
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER StatusUpdate
BEFORE UPDATE on Aereo
for each row
begin
if (new.Status='Atterrato') THEN
set new.Status='Rifornimento Carburante';
elseif (new.Status='Pronto') THEN
set new.Status='Boarding';
end if;
end|
delimiter;

DELIMITER |
CREATE TRIGGER ParcheggioPrenotato
AFTER INSERT ON PrenotazioneParcheggio
FOR EACH ROW
BEGIN
UPDATE Parcheggi SET Stato='Prenotato' WHERE Id=new.Id;
END |
DELIMITER ;

DELIMITER |
CREATE TRIGGER TelDip
BEFORE INSERT on Dipendenti
FOR EACH ROW
BEGIN
DECLARE capA int;
DECLARE num int;
SELECT COUNT(*) INTO num
FROM Dipendenti d
WHERE d.Azienda=new.Azienda;
SELECT CAST(CAP AS INTEGER) INTO capA FROM Sede s WHERE s.Azienda=new.Azienda;
IF capA IS NULL THEN SET capA = 10000;
END IF;
SET new.telAziendale = CONCAT(capA, 1, num);
END |
DELIMITER ;

CREATE VIEW InViaggio (nVolo, PartPrevista, Cognome, Nome, nPassaporto) AS
SELECT DISTINCT s.nVolo,s.PartPrevista, d.Cognome, d.Nome, d.nPassaporto
FROM (DatiDipendenti d INNER JOIN PersonaleDiBordo p ON d.Matricola=p.Matricola)  INNER JOIN SpecificheVolo s ON p.nVolo=s.nVolo
WHERE DAY(s.PartPrevista)=18 AND MONTH(s.PartPrevista)=03 AND YEAR(s.PartPrevista)=2018 AND HOUR(s.PartPrevista)>=08 AND HOUR(s.PartPrevista)<15
UNION
SELECT DISTINCT sp.nVolo,sp.PartPrevista, dc.Cognome, dc.Nome, dc.nPassaporto
FROM (DatiClienti dc INNER JOIN Clienti c ON c.CF=dc.CF)  INNER JOIN SpecificheVolo sp ON c.nVolo= sp.nVolo
WHERE DAY(sp.PartPrevista)=18 AND MONTH(sp.PartPrevista)=03 AND YEAR(sp.PartPrevista)=2018 AND HOUR(sp.PartPrevista)>=08 AND HOUR(sp.PartPrevista)<15
ORDER BY nVolo, Cognome, Nome;

CREATE VIEW VoliInPartenza(PartenzaPrevista, Aereo, Volo, Terminal, Cognome, Nome, NumeroPassaporto) AS
SELECT DISTINCT  i.PartPrevista, a.Id AS Aereo, i.nVolo AS Volo, p.Terminal, i.Cognome, i.Nome, i.nPassaporto AS NumeroPassaporto
FROM (((Parcheggi p NATURAL JOIN PrenotazioneParcheggio pp) INNER JOIN  Aereo a ON a.Id=pp.IdAereo ) INNER JOIN Volo v ON v.IdAereo=a.Id ) RIGHT JOIN InViaggio i ON v.nVolo=i.nVolo
ORDER BY PartPrevista, Cognome, Nome, Terminal;

CREATE VIEW AereiInVolo(Aereo, Proprietario, Tipologia_di_Aereo, Modello, Tipologia_di_Volo, Partenza, Arrivo, Passeggeri, Corridoio_di_Volo) AS
SELECT DISTINCT a.Id AS Aereo, az.Nome AS Proprietario, c.FunzioneAereo AS 'Tipologia di Aereo', c.Modello, t.Tipo AS  'Tipologia di Volo', t.Partenza, t.Arrivo, sv.nPostiOccupati AS Passeggeri, t.SpazioAereo AS 'Corridoio di Volo'
FROM (((( SpecificheVolo sv NATURAL JOIN Volo v) INNER JOIN Tratte t ON v.tratta=t.numero ) INNER JOIN Aereo a ON a.Id=v.IdAereo ) INNER JOIN Catalogazione c ON c.Modello=a.Modello ) INNER JOIN Azienda az ON a.Azienda=az.Nome
WHERE v.Stato= 'In Volo'
ORDER BY Partenza, Arrivo;

CREATE VIEW DestinazioneVoli( Destinazione, Tipo, Numero_di_Volo, Id_Aereo, Partenza_Prevista, Arrivo_Previsto) AS
SELECT Tratte.Arrivo as Destinazione, Tratte.Tipo, Volo.nVolo, Aereo.ID, s.PartPrevista, s.ArrPrevisto
FROM ((Tratte INNER JOIN Volo on Volo.Tratta=Tratte.Numero) INNER JOIN SpecificheVolo s on Volo.nVolo=s.nVolo) INNER JOIN Aereo on Volo.IDAereo=Aereo.ID WHERE Tratte.Partenza LIKE 'Dub%';

CREATE VIEW ResponsabileServizi(Nome_Servizio, Zona, Nome_Responsabile, Cognome, Telefono_Aziendale) AS
select Azienda.Nome, Luogo.Zona, dd.Nome, dd.Cognome, d.TelAziendale
FROM ((Servizio INNER JOIN Luogo on Servizio.Localizzazione=Luogo.ID) INNER JOIN Azienda on Servizio.Azienda=Azienda.Nome) INNER JOIN (DatiDipendenti dd NATURAL JOIN Dipendenti d) on Servizio.Responsabile=d.Matricola
WHERE Tipologia='Ristorazione' OR Tipologia='Vendita'
ORDER BY Azienda.Nome;

CREATE VIEW ContattareIProprietari(Nome, Indirizzo, Telefono, ID_Aereo, Parcheggio_Aereo, Terminal_Aereo) AS
SELECT DISTINCT a.Nome as Azienda, s.Indirizzo, s.Telefono, ae.Id as Aereo, p.Id as Parcheggio, p.Terminal
FROM (((Sede s INNER JOIN Azienda a ON s.Azienda=a.Nome) NATURAL JOIN Aereo ae) INNER JOIN PrenotazioneParcheggio pp ON pp.IdAereo=ae.Id)  INNER JOIN Parcheggi p ON pp.Id=p.Id
ORDER BY Nome, p.Id;
