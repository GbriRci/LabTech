-- Database creation
-- _____________

create database Labtech;

-- Tables Section
-- _____________ 

create table Appuntamento (
     Data_appuntamento date not null,
     Data_fine date,
     Codice_appuntamento numeric(6) not null,
     Ora_inizio varchar(5),
     Ora_fine varchar(5),
     Campus varchar(20) not null,
     Numero numeric(3) not null,
     Sede varchar(50) not null,
     ID_tecnico numeric(5) not null,
     constraint ID_Appuntamento_ID primary key (Codice_appuntamento));

create table Competenze (
     ID_tecnico numeric(5) not null,
     Campo varchar(20) not null,
     constraint ID_Competenze_ID primary key (ID_tecnico, Campo));

create table Disponibilita (
     ID_tecnico numeric(5) not null,
     Nome_citta varchar(25) not null,
     CAP numeric(5) not null,
     constraint ID_Disponibilita_ID primary key (ID_tecnico, CAP));

create table SEGRETERIA (
     Campus varchar(20) not null,
     Classe_laurea varchar(50) not null,
     constraint ID_SEGRETERIA_ID primary key (Campus));

create table Ferie (
     ID_tecnico numeric(5) not null,
     Inizio_ferie date not null,
     Fine_ferie date not null,
     constraint ID_Ferie_ID primary key (ID_tecnico, Inizio_ferie));

create table Laboratorio (
     Num_postazioni numeric(3) not null,
     Tipologia varchar(20) not null,
     Numero numeric(3) not null,
     Sede varchar(50) not null,
     constraint ID_Laboratorio_ID primary key (Numero, Sede));

create table Lavoro (
     ID_tecnico char(1) not null,
     Data_valutazione date,
     Commento varchar(100),
     Punteggio numeric(1),
     Data_lavoro date not null,
     Codice_lavoro numeric(6) not null,
     Codice_appuntamento numeric(6) not null,
     constraint ID_Lavoro_ID primary key (Codice_lavoro));

create table Tecnico (
     Pensionato char,
     Nome varchar(20) not null,
     Cognome varchar(20) not null,
     E_mail varchar(50) not null,
     Telefono numeric(10) not null,
     ID_tecnico numeric(5) not null,
     constraint ID_Tecnico_ID primary key (ID_tecnico));


-- Constraints Section
-- ___________________ 

alter table Appuntamento add constraint REF_Appun_SEGRE_FK
     foreign key (Campus)
     references SEGRETERIA(Campus);

alter table Appuntamento add constraint REF_Appun_Labor_FK
     foreign key (Numero, Sede)
     references Laboratorio(Numero, Sede);

alter table Appuntamento add constraint REF_Appun_Tecni_FK
     foreign key (ID_tecnico)
     references Tecnico(ID_tecnico);

alter table Competenze add constraint EQU_Compe_Tecni
     foreign key (ID_tecnico)
     references Tecnico(ID_tecnico);

alter table Disponibilita add constraint EQU_Dispo_Tecni
     foreign key (ID_tecnico)
     references Tecnico(ID_tecnico);

alter table Ferie add constraint REF_Ferie_Tecni
     foreign key (ID_tecnico)
     references Tecnico(ID_tecnico);

alter table Lavoro add constraint REF_Lavor_Appun_FK
     foreign key (Codice_appuntamento)
     references Appuntamento(Codice_appuntamento);

-- alter table Tecnico add constraint ID_Tecnico_CHK
--     check(exists(select * from Disponibilita
--                  where Disponibilita.ID_tecnico = ID_tecnico)); 

--- alter table Tecnico add constraint ID_Tecnico_CHK
--    check(exists(select * from Competenze
--                 where Competenze.ID_tecnico = ID_tecnico)); 


-- Index Section
-- _____________ 

create unique index ID_Appuntamento_IND
     on Appuntamento (Codice_appuntamento);

create index REF_Appun_SEGRE_IND
     on Appuntamento (Campus);

create index REF_Appun_Labor_IND
     on Appuntamento (Numero, Sede);

create index REF_Appun_Tecni_IND
     on Appuntamento (ID_tecnico);

create unique index ID_Competenze_IND
     on Competenze (ID_tecnico, Campo);

create unique index ID_Disponibilita_IND
     on Disponibilita (ID_tecnico, CAP);

create unique index ID_SEGRETERIA_IND
     on SEGRETERIA (Campus);

create unique index ID_Ferie_IND
     on Ferie (ID_tecnico, Inizio_ferie);

create unique index ID_Laboratorio_IND
     on Laboratorio (Numero, Sede);

create unique index ID_Lavoro_IND
     on Lavoro (Codice_lavoro);

create index REF_Lavor_Appun_IND
     on Lavoro (Codice_appuntamento);

create unique index ID_Tecnico_IND
     on Tecnico (ID_tecnico);

