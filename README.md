# AWS Zabbix Monitoring Hybrid Infrastructure

Ce projet met en place une solution de **supervision centralisée** basée sur **Zabbix** afin de monitorer une infrastructure **hybride déployée sur AWS**.  
Il permet de surveiller en temps réel les performances et la disponibilité de machines **Linux** et **Windows** dans un environnement **Cloud sécurisé**.



##  Objectif du Projet

- Centraliser la supervision des ressources Cloud
- Surveiller des hôtes Linux et Windows depuis un seul serveur Zabbix
- Mettre en œuvre une architecture hybride réaliste sur AWS
- Utiliser Docker pour un déploiement rapide et reproductible
- Appliquer des bonnes pratiques DevOps (Git, Docker, automatisation)

 ##  Schéma Global de l'Architecture
 
<img width="937" height="606" alt="Capture d&#39;écran 2025-12-31 161153" src="https://github.com/user-attachments/assets/0b6f8664-395d-4585-a287-cceb3b627373" />



##  Structure du Projet

```plaintext
AWS-ZABBIX-MONITORING-HYBRID/
├── diagrams/                  # Schémas d’architecture AWS & réseau
├── docker/                    # Configuration du serveur Zabbix
│   └── docker-compose.yml     # Déploiement Zabbix (Server, Web, DB)
├── scripts/                   # Scripts d’automatisation
│   └── install_docker.sh      # Installation Docker & Docker Compose
└── zabbix-agent/              # Configuration des agents Zabbix
    ├── linux/                 # Configuration agent Linux (Ubuntu)
    └── windows/               # Configuration agent Windows
        └── zabbix_agentd.conf
```

##  Technologies Utilisées

###  Cloud
- **AWS**
  - EC2
  - Security Groups

###  Supervision
- **Zabbix Server**
- **Zabbix Agent**

###  Conteneurisation
- **Docker**
- **Docker Compose**

### Systèmes d’exploitation
- **Ubuntu Server** (Serveur Zabbix)
- **Windows Server** (Client Zabbix)

###  Outils
- **Visual Studio Code**
- **Git & GitHub**

---

##  Paramètres Importants (Zabbix Agent)

```conf
Server=3.84.90.87
ServerActive=3.84.90.87
Hostname=Windows-Client
ListenPort=10050
```

##  Détails des paramètres

- **Server / ServerActive**  
  Adresse IP publique du serveur Zabbix (instance EC2)

- **Hostname**  
  Doit être strictement identique au nom déclaré dans l’interface Web Zabbix

- **ListenPort**  
  Port par défaut de l’agent Zabbix : **10050**


##  Ports à Ouvrir (AWS Security Groups)

| Service        | Port  | Description                  |
|----------------|-------|------------------------------|
| Zabbix Web     | 80    | Interface Web Zabbix         |
| Zabbix Server  | 10051 | Communication serveur        |
| Zabbix Agent   | 10050 | Communication agent          |
| SSH            | 22    | Accès à l’instance Ubuntu    |


##  Déploiement Rapide

### 1️. Préparer l’instance Ubuntu (Serveur Zabbix)

```bash
sudo systemctl stop nginx
sh scripts/install_docker.sh
```

### 2️. Lancer les services Zabbix avec Docker

```bash
cd docker
docker-compose up -d
```
```bash
Vérification
docker ps
``` 
### 3️. Configuration du Client Windows

```bash
Installer Zabbix Agent
Modifier le fichier zabbix_agentd.conf
```
### Configurer :

IP du serveur Zabbix

Hostname identique à celui créé dans Zabbix

Autoriser le port 10050 dans le firewall Windows

Redémarrer le service Zabbix Agent

##  Accès à l’Interface Web Zabbix

```bash
http://<IP_PUBLIQUE_EC2>
```

## Identifiants par défaut

```bash
Username: Admin
Password: zabbix
```
##  Résultats Obtenus

 * Détection automatique des hôtes (Linux & Windows)

*  Monitoring CPU, Mémoire, Disque et Réseau

*  Dashboards personnalisés

*  Statut de disponibilité confirmé via l’icône ZBX verte

* Infrastructure prête pour alertes et notifications


<img width="1913" height="966" alt="Capture d&#39;écran 2025-12-31 185015" src="https://github.com/user-attachments/assets/a4b4ff6d-068f-4d86-8305-0c8467bd1e4b" />

<img width="1543" height="801" alt="Capture d&#39;écran 2025-12-31 223109" src="https://github.com/user-attachments/assets/a3152a1f-bc02-41ee-a41a-38dc01d0ebd8" />



##  Cas d’Usage

Supervision d’infrastructures Cloud hybrides

Projets DevOps / Cloud / AWS

Projet académique (PFE, mini-projet)

Démonstration de monitoring en environnement entreprise

##  Auteur

Hajar Elfallaki-Idrissi
