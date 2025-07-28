# 🧪LabTech 
L'idea nasce dalla collabolazione con [sofcaroli2](https://github.com/sofcaroli2) e [Anapaxx](https://github.com/Anapaxx) per un progetto universitario.
La figura dei tecnici di laboratorio risulta di notevole importanza per le attività degli studenti universitari. 
Abbiamo, dunque, pensato di organizzare le attività dei suddetti risolvendo disagi che abbiamo rilevato nel nostro percorso scolastico.
L’idea è la creazione di un database in cui le figure qualificate si proporranno e, vagliate dalla segreterie, saranno assegnate alle lezioni.
Queste dovranno essere supervisionare e i tecnici assegnati potranno intervenire.
Il database è stato pensato per essere applicato nell’Università di Bologna, ma non si esclude l’espansione del sistema in altre università o l’applicazione all’interno di un sito web.
Lo scopo è di avere un tecnico sempre disponibile durante le lezioni universitarie e, in caso di problemi, memorizzare eventuali lavori effettuati nelle varie postazioni.
La segreteria studenti sfrutterà il DB per l’organizzazione dei laboratori prima delle lezioni. 
La query è basata sulle disponibilità fornite dai tecnici durante l’iscrizione al database.
Le disponibilità comunicate saranno:
- locale (luoghi in cui il tecnico è disposto a spostarsi);
- qualifica (tecnico informatico, chimico, artistico…);
- ferie (indisponibilità dei tecnici, con giorno di inizio e di fine).

Inoltre, la query è modellata in base a:
- impegni (tecnico già assegnato ad un lavoro);
- numero di postazioni (numero di tecnici per postazioni);
- tipologia di laboratorio (tipologie diverse possono avere necessità maggiori o minori di personale, dato che cambia la durata e complessità del lavoro da svolgere).

Il database sarà quindi il punto di raccordo tra: i tecnici che si iscrivono autonomamente e la segreteria che li prenota per una determinata data ed orario.
Il docente in turno può lasciare una recensione scritta (commento e valutazione numerica) di quanto è stato svolto e inviarla alla segreteria; quest’ultima procederà a pubblicarla sul sito in modo che sia in futuro visibile dalla stessa e da tutte le differenti segreterie dei vari campus. Questa valutazione permetterà di selezionare i tecnici più adatti e competent per ogni situazione.

# ℹ️Raccolta Informazioni
Il progetto è modellato sull’Università di Bologna.
L’UNIBO presenta cinque campus sparsi per tutta l’Emilia Romagna, ognuno con diverse sedi:
- nel campus di Bologna sono comprese Bologna, Imola e Ozzano dell’Emilia;
- nel campus di Cesena sono comprese Cesena e Cesenatico;
- nel campus di Forlì è compresa solo Forlì;
- nel campus di Ravenna sono comprese Ravenna e Faenza;
- nel campus di Rimini è compresa solo Rimini.
Esiste una segreteria per ogni campus.
Gli studenti sono circa 97.000, divisi in 260 corsi tra lauree triennali, lauree magistrali e lauree magistrali a ciclo unico; di questi 181 sono nel campus di Bologna.
Il personale tecnico-amministrativo dell’università è composto da circa 3.000 persone.
### Fonti: https://www.unibo.it/it/ateneo/chi-siamo/luniversita-oggi-tra-numeri-e-innovazione/lalma-mater-raccontata-dai-numeri#:~:text=93.753%20studentesse%20e%20studenti%20hanno,%2C%20Forl%C3%AC%2C%20Ravenna%2C%20Rimini

# 📖Requisiti
La query è basata sulle disponibilità fornite dai tecnici durante l’iscrizione aldatabase.
Le disponibilità comunicate saranno: 
- locale (luoghi in cui il tecnico è disposto a spostarsi)
- qualifica (tecnico informatico, chimico, artistico…)
- ferie (indisponibilità dei tecnici, con giorno di inizio e di fine)

Inoltre, la query è modellata in base a:
- impegni (tecnico già assegnato ad un lavoro)
- numero di postazioni (numero di tecnici per postazioni)
- tipologia di laboratorio (tipologie diverse possono avere necessità maggiori o minori di personale, dato che cambia la durata e complessità del lavoro da svolgere)

Il database sarà quindi il punto di raccordo tra: i tecnici; che si iscrivono autonomamente, e la segreteria che li prenota per una determinata data ed orario.
Il docente in turno può lasciare una recensione scritta (commento e valutazione numerica) di quanto è stato svolto e inviarla alla segreteria; quest’ultima procederà a pubblicarla sul sito in modo che sia in futuro visualizzabile dalla stessa e da tutte le differenti segreterie delle varie sedi. 
Questa valutazione permetterà di selezionare i tecnici in modo che si scelga il più adatto e competente per ogni situazione.

# 🔐Vincoli & Business Rules
### Disponibilità:
- La segreteria assegna i lavori ai tecnici con almeno una settimana di preavviso;
- Le ferie devono essere inserite dai tecnici con almeno una settimana di preavviso;
- Ci sono due tipi di accesso separati: per il tecnico e per la segreteria;
- Non puoi prenotare un tecnico non disponibile;
- Non puoi prenotare un tecnico con competenze differenti dal tipo di laboratorio
- Ci deve essere almeno un tecnico per un certo numero di studenti (varia per le competenze, perché una può essere più impegnativa di un altra)

### Date:
- Se Data_appuntamento è giornaliera, Ora_fine deve essere maggiore a Ora_inizio;
- Data_lavoro deve essere compresa o essere uguale a quella dell’appuntamento;
- Se un appuntamento dura più giorni, Data_appuntamento deve essere precedente a Data_fine;
- Se inserisco Ora_inizio di un appuntamento devo per forza mettere Ora_fine.

### Valutazioni:
- La valutazione può essere fatta solo dopo che è stato svolto il lavoro;
- Solo la segreteria ha il codice del lavoro e può quindi pubblicare la valutazione scritta dal professore presente nel laboratorio.

# 🗺️Schema Relazionale

TECNICO {<ins>ID_tecnico</ins>, Pensionato* , Nome, Cognome, E-mail, Telefono}
 
FERIE {ID_tecnico: TECNICO, Inizio_ferie, Fine_ferie}
 
APPUNTAMENTO { Codice_appuntamento, ID_tecnico: TECNICO, Data_appuntamento, Data_fine*, Ora_inizio*, Ora_fine*,  numero: LABORATORIO, sede: LABORATORIO, Campus: SEGRETERIA} 

SEGRETERIA {Campus, Classe_laurea}

LAVORO {codice_lavoro, data_lavoro, codice_appuntamento: APPUNTAMENTO, Data_valutazione*, Commento*, Punteggio*, ID_tecnico: TECNICO}

LABORATORIO {numero, sede, tipo, num_postazioni} 

COMPETENZA {campo, CAP, ID_tecnico: TECNICO, Nome_città}

DISPONIBILITÀ {ID_tecnico: TECNICO}
