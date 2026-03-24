# 🚀 Development Environment Setup

![Repo Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)
![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)
![Oracle Cloud](https://img.shields.io/badge/Oracle_Cloud-F80000?style=for-the-badge&logo=oracle&logoColor=white)

Willkommen im zentralen **Dev-Setup Repository**. 

Dieses Projekt dokumentiert die standardisierten Entwicklungs- und Serverumgebungen. Ziel ist es, den Onboarding-Prozess für neue Systeme zu beschleunigen, Best Practices zu etablieren und die Infrastruktur konsistent und reproduzierbar zu halten.

---

## 📂 Repository Struktur

Da sich lokale Entwicklung und Cloud-Hosting grundlegend unterscheiden, ist die Dokumentation in zwei dedizierte Bereiche unterteilt. Wähle die Umgebung aus, die du einrichten möchtest:

| Umgebung | Zieldatei | Beschreibung |
| :--- | :--- | :--- |
| **💻 Lokal (macOS)** | [`macOS-dev-setup.md`](./macOS-dev-setup.md) | Leitfaden für die Einrichtung eines lokalen Apple-Rechners (Intel/Silicon) inkl. Homebrew, VS Code und Kernwerkzeugen. |
| **☁️ Cloud (OCI)** | [`OCI-dev-setup.md`](./OCI-dev-setup.md) | Leitfaden für die Einrichtung einer *Oracle Cloud Infrastructure* Ubuntu-VM, fokussiert auf Headless-Betrieb, Docker und Remote-SSH. |

---

## 🎯 Leitprinzipien dieses Setups

* **Reproduzierbarkeit:** Alle Schritte sind so dokumentiert, dass ein System von Grund auf neu aufgesetzt werden kann.
* **Modernes Tooling:** Fokus auf aktuelle Industriestandards (Homebrew, Docker, NVM/NodeSource).
* **Remote-First (Cloud):** Die OCI-Umgebung ist speziell für die nahtlose Remote-Entwicklung via VS Code SSH optimiert.

---

## 🛠️ Verwendung

1. Klone dieses Repository auf dein lokales System oder deinen Server:
   ```bash
   git clone [https://github.com/DEIN-GITHUB-NAME/dev-setup.git](https://github.com/DEIN-GITHUB-NAME/dev-setup.git)
   cd dev-setup
   ```
2. Öffne die für dein System relevante Markdown-Datei.
3. Folge den dort beschriebenen Schritt-für-Schritt-Anleitungen.

---

## 🤝 Beitragende

Wenn du Tools hinzufügen oder Config-Anpassungen vorschlagen möchtest, öffne gerne einen Pull Request oder erstelle ein Issue.
