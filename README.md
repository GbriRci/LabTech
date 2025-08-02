# 🧪LabTech

L'idea di **LabTech** nasce dalla collaborazione con [sofcaroli2](https://github.com/sofcaroli2) e [Anapaxx](https://github.com/Anapaxx) per un progetto universitario. Il nostro obiettivo è ottimizzare la gestione dei **tecnici di laboratorio** nelle università, risolvendo le problematiche di disponibilità e assegnazione.

Il sistema prevede la creazione di un **database centralizzato** dove i tecnici qualificati possono registrarsi e offrire la propria disponibilità. La **segreteria** gestirà le prenotazioni e le assegnazioni alle lezioni, assicurando la presenza di personale qualificato e disponibile.

### Scopo del Progetto
LabTech mira a garantire la **disponibilità costante di tecnici** durante le lezioni universitarie e a **monitorare i lavori svolti** nelle postazioni. Sebbene pensato per l'Università di Bologna, il sistema è progettato per essere scalabile e applicabile ad altre università o integrabile in piattaforme web.

## 💡Funzionalità Principali e Requisiti

Il database è modellato per gestire le disponibilità dei tecnici e le necessità dei laboratori, considerando:
* **Disponibilità dei tecnici:** Locale (luoghi), qualifica (specializzazione), e periodi di ferie.
* **Fattori di prenotazione:** Impegni preesistenti dei tecnici, numero di postazioni del laboratorio e tipologia del laboratorio.

### Processi Chiave
1.  **Registrazione tecnici:** I tecnici si iscrivono autonomamente.
2.  **Prenotazione:** La segreteria prenota i tecnici in base a data, ora e requisiti specifici.
3.  **Valutazione lavori:** I docenti possono lasciare una recensione (commento e valutazione numerica) dei lavori svolti, che viene poi pubblicata dalla segreteria per monitorare la qualità dei tecnici.

## 📊Architettura del Database

### Requisiti e Vincoli Essenziali
Per la definizione del database sono stati considerati requisiti informativi, sui processi, dinamici e vincoli d'integrità. Alcuni esempi includono:
* Non è possibile prenotare un tecnico senza disponibilità o con competenze diverse da quelle richieste.
* Gli appuntamenti sono fissati in un solo laboratorio.

### Schema E/R Concettuale
Una rappresentazione concettuale delle entità e delle loro relazioni nel sistema LabTech.

![Schema E/R](https://github.com/user-attachments/assets/5e97042d-9766-413a-9162-3e692c298414)

### Schemi Logici
Il diagramma seguente illustra la transizione dal modello concettuale a quello logico, evidenziando le entità e le loro interconnessioni.

![Conceptual to Logic Diagram](https://github.com/user-attachments/assets/ecbadafa-66a8-421c-9b2d-8fc3a427e859)

## 🛠️Dettagli Implementativi (Schema Relazionale e Operazioni)

Il sistema prevede una serie di operazioni specifiche (es. inserimento ferie, creazione appuntamenti, registrazione lavori, calcolo valutazioni) e un dizionario dettagliato di entità, attributi e associazioni, ciascuno con volumi e costi stimati di accesso.

**Esempi di entità e attributi chiave:**
* **TECNICO:** ID_Tecnico, Nome, Cognome, E-mail, Telefono, Competenze.
* **APPUNTAMENTO:** Codice_appuntamento, Data_appuntamento, Laboratorio, Tecnico coinvolto.
* **LAVORO:** Codice_lavoro, Data_lavoro, Valutazione associata.

Per una documentazione completa dei dizionari, delle tabelle di volume, delle operazioni dettagliate e dello schema relazionale, si prega di fare riferimento ai file specifici all'interno del repository (es. `docs/schema.md`, `docs/operations.md` etc., se deciderete di crearli).

## 👥Collaboratori
Questo progetto è stato sviluppato in collaborazione con:
* [sofcaroli2](https://github.com/sofcaroli2)
* [Anapaxx](https://github.com/Anapaxx)

## Scarica la relazione completa:
[https://github.com/GbriRci/LabTech/blob/main/LabTech_relazione.pdf](LabTech_relazione.pdf)
