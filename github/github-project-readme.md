# GitHub-Project-README

Diese Anleitung meint **GitHub Projects** als Planungs- und Steuerungswerkzeug.
Sie meint **nicht** die normale `README.md` eines Repositories.

## Was ist GitHub Projects?

GitHub Projects ist die Arbeitsfläche, auf der ihr Aufgaben, Prioritäten, Status und Verantwortlichkeiten organisiert.

Man kann es sich als Mischung vorstellen aus:

- Board
- Roadmap
- Team-Übersicht
- operativem Planungsraum

Ein gutes Project verbindet Issues, Pull Requests und Fortschritt in einer gemeinsamen Sicht.

---

## Warum das wichtig ist

Ohne Project-Board passiert oft Folgendes:

- Aufgaben gehen unter
- Prioritäten sind unklar
- niemand weiß, was gerade aktiv ist
- Reviews und Blocker werden zu spät sichtbar

Mit GitHub Projects bekommt ihr:

- klare Prioritäten
- sichtbaren Status
- bessere Übergaben
- weniger operative Reibung

---

## Woraus ein gutes GitHub Project besteht

### 1. Klare Status-Spalten oder Status-Felder

Empfohlener Mindeststandard:

- `Backlog`
- `Ready`
- `In Progress`
- `Review`
- `Done`

### 2. Relevante Felder

Empfohlen für OpenSIN:

- `Priority` – P0 / P1 / P2
- `Type` – Feature / Bug / Docs / Research / Ops
- `Owner` – zuständige Person
- `Area` – z. B. Website / Automation / Infra / Docs
- `Milestone` – optional für Releases oder Phasen

### 3. Mehrere Views

Ein gutes Project hat nicht nur eine Ansicht.

Empfohlene Views:

- **Board View** – operative Arbeit
- **Table View** – saubere Übersicht
- **My Work** – Aufgaben pro Person
- **Roadmap** – langfristige Planung

---

## Wie OpenSIN GitHub Projects nutzen sollte

### Minimaler Workflow

1. Neue Arbeit entsteht als **Issue**
2. Das Issue wird im **Project** eingeordnet
3. Priority, Type und Owner werden gesetzt
4. Bei Umsetzung entsteht ein **Branch**
5. Die Änderung landet per **Pull Request** im Review
6. Nach Merge wird das Item auf `Done` gesetzt oder automatisch geschlossen

So bleibt alles verbunden:

**Problem → Planung → Umsetzung → Review → Abschluss**

---

## Empfohlene OpenSIN-Project-Struktur

### Beispiel-Felder

| Feld       | Zweck                            |
| :--------- | :------------------------------- |
| `Status`   | aktueller Arbeitsstand           |
| `Priority` | Wichtigkeit                      |
| `Type`     | Art der Aufgabe                  |
| `Owner`    | verantwortliche Person           |
| `Area`     | Produkt- oder Themenbereich      |
| `Target`   | Sprint, Meilenstein oder Release |

### Beispiel-Views

| View           | Zweck                            |
| :------------- | :------------------------------- |
| `Backlog`      | ungeplante oder spätere Aufgaben |
| `Active Work`  | laufende Arbeit                  |
| `Review Queue` | alles, was Feedback braucht      |
| `Shipped`      | abgeschlossene Arbeit            |
| `My Items`     | persönliche Arbeitsfläche        |

---

## Gute Regeln für Projects

### Issue zuerst, nicht Chat zuerst

Wenn Arbeit wichtig genug ist, dass sie nachverfolgt werden soll, braucht sie ein Issue und einen Platz im Project.

### Kleine Statusübergänge

Nicht alles bleibt ewig in `In Progress`.
Status sollen real sein.

### Ownership klar vergeben

Jedes aktive Item braucht eine zuständige Person.

### Review sichtbar machen

`Review` ist ein echter Zustand, kein unsichtbarer Zwischenraum.

---

## Was nicht gut funktioniert

Vermeidet:

- Board ohne Owner
- Board ohne Prioritäten
- 100 Backlog-Items ohne Pflege
- Aufgaben in Chat, aber nicht im Project
- `Done`, obwohl PR noch offen ist

---

## Copy-Paste-Blueprint für euer erstes Project

```text
Project Name: OpenSIN Operating Board

Fields:
- Status
- Priority
- Type
- Owner
- Area

Views:
- Board: Active Work
- Table: Full Overview
- Board: Review Queue
- Table: My Work
```

---

## Kurzregel

> GitHub Projects ist die operative Wahrheit darüber, was wichtig ist, wer woran arbeitet und was als Nächstes passieren muss.

---

## Qualitäts-Check

- [ ] Alle aktiven Aufgaben haben einen Owner
- [ ] Priority ist sichtbar
- [ ] Status ist aktuell
- [ ] Issues, PRs und Project hängen zusammen
- [ ] Review-Arbeit ist nicht unsichtbar
