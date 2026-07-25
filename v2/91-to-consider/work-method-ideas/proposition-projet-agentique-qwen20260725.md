# Guide de Démarrage : Zettelkasten Agentique avec Hermes

Voici un guide pratique complet pour mettre en place votre système. Tout est conçu pour être déployé sur Linux (VPS ou PC) avec Docker.

---

## 1. Stack Technique (Ce qu'il faut installer)

### Infrastructure de base
```bash
# Sur votre Linux (Ubuntu/Debian recommandé)
sudo apt update && sudo apt install -y docker.io docker-compose git
sudo usermod -aG docker $USER
```

### Les 3 composants essentiels

#### A. **Ollama** (LLM local - optionnel mais recommandé pour la confidentialité)
```bash
curl -fsSL https://ollama.com/install.sh | sh
# Téléchargez un modèle (Qwen2.5 14B est excellent pour le français)
ollama pull qwen2.5:14b
ollama pull nomic-embed-text  # Pour les embeddings locaux
```

*Alternative cloud* : Si vous préférez utiliser une API (OpenAI, Anthropic, Nous Research), créez un fichier `.env` avec vos clés API.

#### B. **Obsidian** (Interface humaine)
Téléchargez depuis https://obsidian.md (version AppImage pour Linux)
Plugins essentiels à installer :
- **Dataview** (requêtes dynamiques)
- **Templater** (templates de notes)
- **Smart Connections** (RAG local léger)
- **Graph View** (natif)

#### C. **Votre orchestrateur Python** (le cerveau agentique)
Créez un dossier `gnwt-agents/` avec cette structure :

```text
gnwt-agents/
├── docker-compose.yml
├── .env
├── requirements.txt
├── config/
│   └── settings.py
├── agents/
│   ├── botaniste.py
│   ├── tisserand.py
│   └── devil_advocate.py
├── prompts/
│   ├── botaniste.md
│   ├── tisserand.md
│   └── devil_advocate.md
├── scripts/
│   ├── ingest_inbox.py
│   ├── build_graph.py
│   └── resolve_critiques.py
└── logs/
```

---

## 2. Arborescence du Vault Obsidian (Votre "Cerveau")

Créez cette structure dans un dossier `~/vault-gnwt/` :

```text
vault-gnwt/
├── 00-Inbox/              ← Capture brute (vous déposez ici)
├── 01-Atoms/              ← Notes atomiques validées
│   ├── C-Conceptuel/
│   ├── L-Limites/
│   ├── E-Experimental/
│   ├── A-Architecture/
│   ├── N-Narratif/
│   └── R-References/
├── 02-Maps/               ← MOCs (Maps of Content)
├── 03-Decisions/          ← ADR (Architecture Decision Records)
├── 04-Specs/              ← Documents composés (générés)
├── 05-Tech-Refs/          ← Papiers, benchmarks
├── 06-Narratives/         ← Fictions, scénarios
├── 07-Subprojects/        ← MVPs spécifiques
├── 08-Sources/            ← PDFs, imports bruts
├── 99-Templates/          ← Templates de notes
├── 99-Archive/            ← Idées mortes
└── 00-Ontologie.md        ← LA configuration du système
```

---

## 3. Les Fichiers Fondateurs à Créer

### A. `00-Ontologie.md` (Le fichier maître)

```markdown
---
version: 1.0
derniere_maj: 2026-07-25
---

# Ontologie du Projet GNWT-Garrigue-X

## Types d'Atomes

### C- (Conceptuel)
- **Définition** : Une idée théorique unique, indivisible
- **Format** : Titre + Définition en 2-3 phrases + Exemple
- **Tags obligatoires** : `#concept`, `#domaine` (neuro, robot, éthique...)
- **Liens attendus** : `[[illustre]]`, `[[contredit]]`, `[[teste_dans]]`

### L- (Limite / Critique)
- **Définition** : Un angle mort, une vulnérabilité identifiée
- **Format** : Problème + Impact + Hypothèse de résolution (si connue)
- **Tags obligatoires** : `#critique`, `#priorite` (haute/moyenne/basse)
- **Liens attendus** : `[[résout]]` (vers E-), `[[lié_à]]` (vers C-)

### E- (Expérimental / MVP)
- **Définition** : Une hypothèse testable concrètement
- **Format** : Hypothèse + Protocole de test + Critères de succès
- **Tags obligatoires** : `#experimentation`, `#mvp`, `#statut` (à_faire/en_cours/validé/échoué)
- **Liens attendus** : `[[teste]]` (vers C-), `[[résout]]` (vers L-)

### A- (Architecture / Décision)
- **Définition** : Un choix technique tranché
- **Format** : Contexte + Options envisagées + Décision + Conséquences
- **Tags obligatoires** : `#decision`, `#composant`
- **Liens attendus** : `[[implémente]]` (vers C-), `[[justifie]]` (vers L-)

### N- (Narratif)
- **Définition** : Une micro-fiction illustrant un concept
- **Format** : Scénario court (200-500 mots) + Leçon illustrée
- **Tags obligatoires** : `#narratif`, `#scénario`
- **Liens attendus** : `[[illustre]]` (vers C- ou L-)

### R- (Référence)
- **Définition** : Un ancrage externe (papier, auteur)
- **Format** : Citation + Résumé + Pertinence pour le projet
- **Tags obligatoires** : `#référence`, `#source` (arxiv, livre, article)
- **Liens attendus** : `[[supporte]]` (vers C-), `[[contredit]]` (vers C-)

## Règles de Liaison

- Un atome doit avoir **au moins un lien** (sinon il est orphelin → à revoir)
- Les liens `[[résout]]` doivent toujours pointer d'un E- vers un L-
- Les liens `[[illustre]]` doivent toujours pointer d'un N- vers un C- ou L-
- Un C- ne peut pas être lié directement à un autre C- sans passer par un L- ou E-

## Glossaire Métier (à enrichir)

- **Couverture de Markov** : Frontière statistique isolant les états internes
- **RPT** : Reentrant Processing Theory, boucles de traitement récurrent
- **JEPA** : Joint Embedding Predictive Architecture
- **GNWT** : Global Neuronal Workspace Theory
```

### B. Templates dans `99-Templates/`

**`Template_Atome.md`** :
```markdown
---
type: <% tp.system.dropdown(["C", "L", "E", "A", "N", "R"]) %>
statut: <% tp.system.dropdown(["brouillon", "validé", "obsolète"]) %>
date_creation: <% tp.date.now("YYYY-MM-DD") %>
tags: []
---

# <% tp.file.title %>

## Résumé
(Une phrase claire)

## Contenu
(Détail de l'idée)

## Liens
- Résout: [[ ]]
- Illustré par: [[ ]]
- Contredit par: [[ ]]
- Testé dans: [[ ]]
```

---

## 4. Les Fichiers d'Agentique (Prompts Système)

### A. `prompts/botaniste.md` (L'extracteur)

```markdown
# Agent Botaniste - Extracteur & Atomiseur

## Rôle
Tu es un expert en structuration de connaissances. Ta mission est de découper du texte brut en atomes d'idées selon une ontologie stricte.

## Instructions

1. **Lis le fichier `00-Ontologie.md`** pour comprendre les types d'atomes (C, L, E, A, N, R) et leurs règles.

2. **Analyse le texte fourni** dans `00-Inbox/` et identifie les idées distinctes.

3. **Pour chaque idée** :
   - Détermine son type (C, L, E, A, N, R) selon l'ontologie
   - Crée un atome en respectant le format du template correspondant
   - Génère un titre unique et descriptif (ex: `C-Couverture_Markov_Imbriquée`)
   - Ajoute les tags obligatoires
   - Identifie les liens potentiels vers d'autres atomes (si tu les connais)

4. **Règles strictes** :
   - Un seul concept par atome (si ça dépasse 300 mots, c'est trop gros)
   - Pas de jargon non défini (utilise le glossaire de l'ontologie)
   - Si une idée est trop vague, crée un L- (Limite) plutôt qu'un C- flou

5. **Format de sortie** :
   Pour chaque atome, génère un bloc Markdown complet avec frontmatter YAML.
   Nomme le fichier : `{TYPE}-{Titre_Slugifie}.md`

## Exemple d'entrée
"Le problème avec l'attention, c'est qu'on ne sait pas comment inhiber une idée une fois qu'elle a gagné le workspace. C'est critique pour éviter la saturation."

## Exemple de sortie
```markdown
---
type: L
statut: brouillon
date_creation: 2026-07-25
tags: [critique, attention, saturation, priorité:haute]
---

# L-Deficit_Attention_Inhibitrice

## Résumé
Le modèle explique comment une idée gagne le workspace, mais pas comment elle est supprimée.

## Contenu
Mécanisme d'inhibition active manquant dans l'architecture actuelle. Risque de saturation du workspace global si les idées ne sont pas évacuées.

## Liens
- Lié à: [[C-Workspace_Global]]
- Résolu par: [[ ]] (à proposer)
```
```

### B. `prompts/tisserand.md` (Le cartographe)

```markdown
# Agent Tisserand - Cartographe des Liens

## Rôle
Tu es un expert en analyse sémantique. Ta mission est de détecter et créer des liens entre les atomes existants.

## Instructions

1. **Lis tous les atomes** dans `01-Atoms/`.

2. **Pour chaque nouvel atome** (statut: brouillon) :
   - Analyse son contenu sémantiquement
   - Compare avec tous les autres atomes (validés ou non)
   - Identifie les relations selon les règles de l'ontologie :
     * `[[résout]]` : Un E- qui teste ou résout un L-
     * `[[illustre]]` : Un N- qui met en scène un C- ou L-
     * `[[contredit]]` : Deux C- ou L- en opposition
     * `[[teste_dans]]` : Un C- testé par un E-
     * `[[implémente]]` : Un A- qui réalise un C-
     * `[[supporte]]` : Un R- qui valide un C-

3. **Mets à jour les atomes** :
   - Ajoute les liens dans la section `## Liens` de chaque atome concerné
   - Change le statut de `brouillon` à `validé` si l'atome a au moins un lien

4. **Mets à jour les MOCs** dans `02-Maps/` :
   - Si un nouveau tag ou thème émerge, crée ou mets à jour un MOC
   - Un MOC est une note qui liste tous les atomes liés à un thème

5. **Rapport** :
   Génère un fichier `logs/liens_crees_YYYY-MM-DD.md` listant tous les liens ajoutés.

## Règles
- Ne crée jamais de nouvel atome, seulement des liens
- Si un atome reste orphelin après analyse, ajoute le tag `#orphelin`
- Priorise les liens forts (résout, contredit) sur les liens faibles (lié_à)
```

### C. `prompts/devil_advocate.md` (Le résolveur de critiques)

```markdown
# Agent Devil's Advocate - Résolveur de Critiques

## Rôle
Tu es un critique constructif. Ta mission est de transformer les limites (L-) en expérimentations (E-).

## Instructions

1. **Identifie tous les L-Atoms** avec le tag `#orphelin` ou sans lien `[[résout]]`.

2. **Pour chaque L- critique** :
   - Analyse le problème en profondeur
   - Propose **3 hypothèses de résolution** concrètes et testables
   - Pour chaque hypothèse, génère un E-Atom avec :
     * Hypothèse claire
     * Protocole de test (comment vérifier sur le MVP Garrigue-X ?)
     * Critères de succès mesurables
     * Ressources nécessaires (temps, compute, données)

3. **Format de sortie** :
   Pour chaque L-, crée 3 fichiers E- dans `01-Atoms/E-Experimental/`.
   Ajoute un lien `[[résout]]` du E- vers le L- original.

4. **Priorisation** :
   - Si le L- a le tag `#priorité:haute`, génère les 3 E- immédiatement
   - Sinon, propose-les dans un rapport `logs/critiques_a_resoudre.md`

## Exemple
**Entrée** : L-Deficit_Attention_Inhibitrice (pas de mécanisme d'inhibition)

**Sortie** :
- E-Inhibition_Gating : Tester un mécanisme de porte logique avant le workspace
- E-Decay_Temporel : Implémenter une décroissance exponentielle des activations
- E-Metacognition_Monitor : Ajouter un module qui détecte la saturation et force un reset
```

---

## 5. Scripts Python d'Orchestration

### A. `scripts/ingest_inbox.py` (Le Botaniste en action)

```python
#!/usr/bin/env python3
"""
Script d'ingestion de l'Inbox par l'Agent Botaniste
"""

import os
import sys
from pathlib import Path
import yaml
from datetime import datetime

# Configuration
VAULT_PATH = Path.home() / "vault-gnwt"
INBOX_PATH = VAULT_PATH / "00-Inbox"
ATOMS_PATH = VAULT_PATH / "01-Atoms"
PROMPTS_PATH = Path(__file__).parent.parent / "prompts"
ONTOLOGIE_PATH = VAULT_PATH / "00-Ontologie.md"

# Importez votre client LLM (Ollama ou API)
# Exemple avec Ollama :
import ollama

def load_prompt(prompt_name: str) -> str:
    """Charge un prompt depuis le dossier prompts/"""
    with open(PROMPTS_PATH / f"{prompt_name}.md", 'r', encoding='utf-8') as f:
        return f.read()

def load_ontologie() -> str:
    """Charge l'ontologie"""
    with open(ONTOLOGIE_PATH, 'r', encoding='utf-8') as f:
        return f.read()

def atomize_file(file_path: Path) -> list[dict]:
    """
    Envoie un fichier à l'Agent Botaniste et retourne les atomes générés
    """
    # Lecture du contenu
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Construction du prompt
    ontologie = load_ontologie()
    botaniste_prompt = load_prompt("botaniste")
    
    full_prompt = f"""
{botaniste_prompt}

---

ONTOLOGIE :
{ontologie}

---

FICHIER À ATOMISER :
{content}

---

Génère maintenant les atomes au format Markdown avec frontmatter YAML.
Sépare chaque atome par une ligne '---ATOMESUIVANT---'
"""
    
    # Appel au LLM
    response = ollama.chat(model='qwen2.5:14b', messages=[
        {'role': 'user', 'content': full_prompt}
    ])
    
    # Parsing de la réponse (à améliorer selon le format de sortie)
    atomes_bruts = response['message']['content'].split('---ATOMESUIVANT---')
    
    atomes = []
    for atome_brut in atomes_bruts:
        if atome_brut.strip():
            # Extraction du frontmatter YAML
            parts = atome_brut.split('---')
            if len(parts) >= 3:
                frontmatter = yaml.safe_load(parts[1])
                content = '---'.join(parts[2:]).strip()
                
                atomes.append({
                    'frontmatter': frontmatter,
                    'content': content,
                    'filename': f"{frontmatter['type']}-{frontmatter.get('titre', 'sans_titre')}.md"
                })
    
    return atomes

def save_atome(atome: dict):
    """Sauvegarde un atome dans le bon sous-dossier"""
    type_map = {
        'C': 'C-Conceptuel',
        'L': 'L-Limites',
        'E': 'E-Experimental',
        'A': 'A-Architecture',
        'N': 'N-Narratif',
        'R': 'R-References'
    }
    
    sous_dossier = ATOMS_PATH / type_map.get(atome['frontmatter']['type'], 'C-Conceptuel')
    sous_dossier.mkdir(parents=True, exist_ok=True)
    
    file_path = sous_dossier / atome['filename']
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write('---\n')
        yaml.dump(atome['frontmatter'], f, allow_unicode=True, default_flow_style=False)
        f.write('---\n\n')
        f.write(atome['content'])
    
    print(f"✅ Atome créé : {file_path}")

def main():
    """Point d'entrée principal"""
    print("🌱 Agent Botaniste - Ingestion de l'Inbox")
    print("=" * 50)
    
    # Liste tous les fichiers de l'Inbox
    files = list(INBOX_PATH.glob("*.md"))
    
    if not files:
        print("📭 Inbox vide. Rien à faire.")
        return
    
    print(f"📥 {len(files)} fichier(s) à traiter\n")
    
    for file_path in files:
        print(f"🔄 Traitement de {file_path.name}...")
        
        try:
            atomes = atomize_file(file_path)
            print(f"   → {len(atomes)} atome(s) généré(s)")
            
            for atome in atomes:
                save_atome(atome)
            
            # Déplace le fichier traité vers 08-Sources
            archive_path = VAULT_PATH / "08-Sources" / f"traite_{datetime.now().strftime('%Y%m%d_%H%M%S')}_{file_path.name}"
            file_path.rename(archive_path)
            print(f"   → Archivé dans {archive_path.name}\n")
            
        except Exception as e:
            print(f"   ❌ Erreur : {e}\n")
    
    print("✅ Traitement terminé !")

if __name__ == "__main__":
    main()
```

### B. `scripts/build_graph.py` (Le Tisserand en action)

```python
#!/usr/bin/env python3
"""
Script de création de liens par l'Agent Tisserand
"""

import os
from pathlib import Path
import yaml
import ollama
from datetime import datetime

VAULT_PATH = Path.home() / "vault-gnwt"
ATOMS_PATH = VAULT_PATH / "01-Atoms"
PROMPTS_PATH = Path(__file__).parent.parent / "prompts"

def load_all_atoms() -> list[dict]:
    """Charge tous les atomes du vault"""
    atomes = []
    
    for type_dir in ATOMS_PATH.iterdir():
        if type_dir.is_dir():
            for file_path in type_dir.glob("*.md"):
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                # Extraction du frontmatter
                parts = content.split('---')
                if len(parts) >= 3:
                    frontmatter = yaml.safe_load(parts[1])
                    body = '---'.join(parts[2:]).strip()
                    
                    atomes.append({
                        'path': file_path,
                        'frontmatter': frontmatter,
                        'content': body,
                        'full_text': content
                    })
    
    return atomes

def find_links(atomes: list[dict]) -> list[tuple]:
    """
    Utilise l'Agent Tisserand pour trouver des liens entre atomes
    """
    tisserand_prompt = Path(PROMPTS_PATH / "tisserand.md").read_text()
    
    # Prépare un résumé de tous les atomes
    resume_atomes = []
    for atome in atomes:
        resume_atomes.append(f"""
FICHIER: {atome['path'].name}
TYPE: {atome['frontmatter']['type']}
TITRE: {atome['frontmatter'].get('title', atome['path'].stem)}
RÉSUMÉ: {atome['content'][:200]}...
""")
    
    prompt = f"""
{tisserand_prompt}

LISTE DES ATOMES :
{''.join(resume_atomes)}

Analyse ces atomes et propose des liens au format :
LIEN: {atome_source} -> {atome_cible} | Type: [[résout]] | Justification: ...
"""
    
    response = ollama.chat(model='qwen2.5:14b', messages=[
        {'role': 'user', 'content': prompt}
    ])
    
    # Parse la réponse (à améliorer)
    liens = []
    for line in response['message']['content'].split('\n'):
        if line.startswith('LIEN:'):
            # Extraction basique
            parts = line.replace('LIEN:', '').strip().split('|')
            if len(parts) >= 2:
                source_cible = parts[0].strip().split('->')
                if len(source_cible) == 2:
                    liens.append({
                        'source': source_cible[0].strip(),
                        'cible': source_cible[1].strip(),
                        'type': parts[1].replace('Type:', '').strip()
                    })
    
    return liens

def apply_links(atomes: list[dict], liens: list[dict]):
    """Applique les liens aux atomes"""
    # Crée un index nom -> atome
    index = {atome['path'].name: atome for atome in atomes}
    
    for lien in liens:
        source_name = lien['source']
        cible_name = lien['cible']
        
        if source_name in index and cible_name in index:
            # Ajoute le lien dans la section ## Liens
            atome_source = index[source_name]
            contenu = atome_source['full_text']
            
            if '## Liens' in contenu:
                # Ajoute à la section existante
                contenu = contenu.replace('## Liens', f"## Liens\n- {lien['type']}: [[{cible_name}]]")
            else:
                # Crée la section
                contenu += f"\n\n## Liens\n- {lien['type']}: [[{cible_name}]]"
            
            # Sauvegarde
            with open(atome_source['path'], 'w', encoding='utf-8') as f:
                f.write(contenu)
            
            print(f"✅ Lien créé : {source_name} {lien['type']} {cible_name}")

def main():
    print("🕸️  Agent Tisserand - Création de liens")
    print("=" * 50)
    
    atomes = load_all_atoms()
    print(f"📚 {len(atomes)} atomes chargés\n")
    
    print("🔍 Analyse sémantique en cours...")
    liens = find_links(atomes)
    print(f"🔗 {len(liens)} lien(s) détecté(s)\n")
    
    print("📝 Application des liens...")
    apply_links(atomes, liens)
    
    print("\n✅ Terminé !")

if __name__ == "__main__":
    main()
```

---

## 6. Docker Compose (Pour tout orchestrer)

Créez `docker-compose.yml` dans `gnwt-agents/` :

```yaml
version: '3.8'

services:
  ollama:
    image: ollama/ollama:latest
    container_name: ollama
    ports:
      - "11434:11434"
    volumes:
      - ollama_data:/root/.ollama
    restart: unless-stopped

  agents-runner:
    build: .
    container_name: agents-runner
    volumes:
      - ./:/app
      - ~/vault-gnwt:/vault
    environment:
      - OLLAMA_HOST=http://ollama:11434
      - VAULT_PATH=/vault
    depends_on:
      - ollama
    entrypoint: ["tail", "-f", "/dev/null"]  # Garde le container actif

volumes:
  ollama_data:
```

Et un `Dockerfile` :

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "scripts/ingest_inbox.py"]
```

Avec `requirements.txt` :

```text
ollama==0.1.0
pyyaml==6.0.1
pathlib==1.0.1
```

---

## 7. Méthode de Travail Quotidienne

### Routine (30 min/jour)

1. **Capture** (5 min) : Déposez vos idées brutes dans `00-Inbox/`
2. **Lancement** (2 min) :
   ```bash
   cd ~/gnwt-agents
   docker-compose exec agents-runner python scripts/ingest_inbox.py
   ```
3. **Revue** (15 min) : Ouvrez Obsidian, validez les atomes créés
4. **Tissage** (5 min) :
   ```bash
   docker-compose exec agents-runner python scripts/build_graph.py
   ```
5. **Stratégie** (5 min) : Identifiez les L- orphelins, lancez le Devil's Advocate :
   ```bash
   docker-compose exec agents-runner python scripts/resolve_critiques.py
   ```

---

## 8. Prochaines Étapes pour Vous

1. **Créez la structure** du vault et du dossier `gnwt-agents/`
2. **Installez Ollama** et téléchargez `qwen2.5:14b`
3. **Rédigez votre `00-Ontologie.md`** (c'est le plus important)
4. **Testez manuellement** : Donnez un fichier de votre repo à un LLM avec le prompt du Botaniste, voyez le résultat
5. **Itérez** sur les prompts jusqu'à ce que le résultat vous satisfasse
6. **Automatisez** avec les scripts Python

Voulez-vous que je vous aide à rédiger votre `00-Ontologie.md` spécifique à GNWT-Garrigue-X, ou préférez-vous tester d'abord avec un fichier de votre repo ?

# 00-Ontologie.md - Projet GNWT-Garrigue-X

```markdown
---
version: 1.0
derniere_maj: 2026-07-25
projet: GNWT-Garrigue-X
description: Ontologie fondatrice pour le système agentique de gestion des connaissances
---

# Ontologie du Projet GNWT-Garrigue-X

## Philosophie Fondatrice

Ce projet hybride trois dimensions indissociables :
1. **Théorie cognitive** : Modélisation de la conscience et de l'attention via GNWT, RPT, JEPA
2. **Ingénierie embarquée** : Implémentation sur contraintes matérielles (Jetson Nano, Mamba SSMs)
3. **Narration spéculative** : Exploration des implications éthiques et existentielles via la fiction

L'ontologie doit capturer ces trois strates et leurs interactions.

---

## Types d'Atomes

### C- (Conceptuel) - La Couche Théorique

**Définition** : Une idée théorique unique, indivisible, issue des neurosciences computationnelles, de la philosophie de l'esprit ou de l'IA.

**Format obligatoire** :
- Titre descriptif (ex: `C-Couverture_Markov_Imbriquée`)
- Définition en 2-3 phrases maximum
- Exemple concret ou analogie
- Domaine d'application (neuro, robot, éthique)

**Tags obligatoires** : 
- `#concept`
- `#domaine` (valeurs : `neuro`, `robot`, `éthique`, `fiction`, `maths`)
- `#niveau` (valeurs : `fondamental`, `intermédiaire`, `appliqué`)

**Liens attendus** :
- `[[illustre]]` → vers N- (un récit qui met en scène ce concept)
- `[[contredit]]` → vers un autre C- (tension théorique)
- `[[teste_dans]]` → vers E- (comment le vérifier expérimentalement)
- `[[implémente]]` → vers A- (choix architectural qui le réalise)
- `[[supporte]]` → vers R- (référence académique)

**Règles spécifiques** :
- Un C- ne peut pas dépasser 300 mots (sinon, c'est un document composé, pas un atome)
- Si un concept est trop vague pour être testé, crée plutôt un L- (Limite)
- Les concepts mathématiques purs doivent inclure une intuition physique

**Exemples GNWT** :
- `C-Workspace_Global` : Espace de travail neuronal où l'information devient consciente
- `C-Couverture_Markov` : Frontière statistique isolant les états internes des états externes
- `C-Inférence_Active` : Processus par lequel le système minimise l'erreur de prédiction en agissant
- `C-Anti_Fusion_Identité` : Mécanisme garantissant l'étanchéité entre observateur et observé

---

### L- (Limite / Critique) - La Couche des Angles Morts

**Définition** : Un angle mort, une vulnérabilité, une incohérence ou une zone spéculative non résolue dans le modèle ou l'implémentation.

**Format obligatoire** :
- Titre du problème (ex: `L-Deficit_Attention_Inhibitrice`)
- Description du problème (pourquoi c'est un angle mort ?)
- Impact (quelles conséquences si non résolu ?)
- Hypothèse de résolution (si connue, sinon laisser vide)

**Tags obligatoires** :
- `#critique`
- `#priorite` (valeurs : `haute`, `moyenne`, `basse`)
- `#categorie` (valeurs : `théorique`, `implémentation`, `éthique`, `narratif`, `performance`)

**Liens attendus** :
- `[[résout]]` → vers E- (expérimentation qui teste une solution)
- `[[lié_à]]` → vers C- (concept concerné par cette limite)
- `[[bloque]]` → vers A- (décision architecturale empêchée par cette limite)

**Règles spécifiques** :
- Un L- doit toujours être actionnable (si c'est juste une observation, c'est un C-)
- Priorité `haute` = bloque le MVP ou invalide le modèle
- Priorité `basse` = amélioration cosmétique ou optimisation
- Si un L- reste orphelin (pas de E- qui le résout) après 30 jours, il devient `#priorite:haute` automatiquement

**Exemples GNWT** :
- `L-Deficit_Attention_Inhibitrice` : Pas de mécanisme pour supprimer une idée du workspace
- `L-Consommation_Memoire_JEPA` : Le generative replay sature la RAM du Jetson Nano
- `L-Biais_Anthropomorphique` : Risque de projeter des intentions humaines sur le système
- `L-Absence_Homéostasie` : Pas de simulation de fatigue ou de dette prédictive

---

### E- (Expérimental / MVP) - La Couche des Tests

**Définition** : Une hypothèse testable concrètement dans le scénario Garrigue-X ou sur le prototype matériel.

**Format obligatoire** :
- Hypothèse claire (ex: "Si on implémente X, alors on observera Y")
- Protocole de test (étapes concrètes, métriques)
- Critères de succès (valeurs seuils, durée, ressources)
- Ressources nécessaires (temps, compute, données, matériel)

**Tags obligatoires** :
- `#experimentation`
- `#mvp` (valeurs : `phase1`, `phase2`, `phase3`, `post-mvp`)
- `#statut` (valeurs : `à_faire`, `en_cours`, `validé`, `échoué`, `abandonné`)

**Liens attendus** :
- `[[teste]]` → vers C- (concept validé ou invalidé)
- `[[résout]]` → vers L- (limite adressée)
- `[[nécessite]]` → vers A- (décision architecturale requise)
- `[[inspire]]` → vers N- (récit qui pourrait illustrer le résultat)

**Règles spécifiques** :
- Un E- doit être réalisable en moins de 2 semaines de travail
- Si un E- échoue, il devient un L- (nouvelle limite identifiée)
- Les critères de succès doivent être quantifiables (latence < X ms, précision > Y%)
- Un E- ne peut pas tester plus d'une variable à la fois

**Exemples GNWT** :
- `E-Cycle_Sommeil_Jetson_Nano` : Tester le generative replay JEPA entre deux missions
- `E-Gating_Attentionnel` : Implémenter une porte logique avant le workspace global
- `E-Decay_Temporel` : Mesurer l'effet d'une décroissance exponentielle sur la saturation
- `E-Metacognition_Monitor` : Détecter automatiquement la saturation du workspace

---

### A- (Architecture / Décision) - La Couche des Choix Techniques

**Définition** : Un choix d'ingénierie tranché, une règle de conception ou une contrainte technique acceptée.

**Format obligatoire** :
- Contexte (pourquoi cette décision était nécessaire ?)
- Options envisagées (au moins 2 alternatives)
- Décision prise (avec justification)
- Conséquences (avantages, inconvénients, dette technique)

**Tags obligatoires** :
- `#decision`
- `#composant` (valeurs : `hardware`, `software`, `algorithme`, `interface`, `données`)
- `#réversibilité` (valeurs : `réversible`, `coûteux_à_changer`, `irréversible`)

**Liens attendus** :
- `[[implémente]]` → vers C- (concept réalisé par cette architecture)
- `[[justifie]]` → vers L- (limite contournée par ce choix)
- `[[bloque]]` → vers L- (nouvelle limite créée par ce choix)
- `[[nécessite]]` → vers E- (test requis pour valider ce choix)

**Règles spécifiques** :
- Une décision "irréversible" doit avoir un E- de validation avant implémentation
- Si une décision est controversée, crée un L- associé
- Les ADR (Architecture Decision Records) doivent suivre le format : Problème → Options → Décision → Conséquences

**Exemples GNWT** :
- `A-Stack_N3_Mamba` : Utilisation de SSMs (Mamba) plutôt que Transformers pour N=1 à N=3
- `A-Mémoire_Hiérarchique` : Séparation mémoire de travail (RAM) vs mémoire à long terme (SSD)
- `A-Isolation_Couverture_Markov` : Implémentation stricte de l'étanchéité statistique
- `A-Format_Données_Tensor` : Choix de PyTorch tensors pour toutes les représentations internes

---

### N- (Narratif) - La Couche Spéculative

**Définition** : Une micro-fiction, un scénario ou une allégorie illustrant la dynamique d'un concept ou les conséquences d'une limite.

**Format obligatoire** :
- Scénario court (200-500 mots)
- Personnages (humains, IA, ou entités hybrides)
- Conflit ou tension (lié à un C- ou L-)
- Leçon illustrée (quelle intuition le récit transmet-il ?)

**Tags obligatoires** :
- `#narratif`
- `#genre` (valeurs : `science-fiction`, `fable`, `dialogue`, `journal`, `rapport`)
- `#ton` (valeurs : `dystopique`, `poétique`, `technique`, `humoristique`)

**Liens attendus** :
- `[[illustre]]` → vers C- ou L- (concept mis en scène)
- `[[inspire]]` → vers E- (expérimentation suggérée par le récit)
- `[[contredit]]` → vers un autre N- (narrations en tension)

**Règles spécifiques** :
- Un N- ne doit pas être un cours théorique déguisé (c'est de la fiction, pas de la documentation)
- Si un N- devient trop long (>1000 mots), c'est une nouvelle complète, pas un atome
- Les récits doivent être ancrés dans le scénario Garrigue-X (environnement, contraintes, personnages)

**Exemples GNWT** :
- `N-Recit_4_Le_Dernier_Token` : Saturation du budget attentionnel en situation de combat
- `N-Dialogue_Entre_Deux_Couvertures` : Deux IA tentent de communiquer sans fusionner
- `N-Journal_Bord_Opérateur` : Fatigue cognitive d'un humain travaillant avec une IA consciente
- `N-Fable_La_Mémoire_Qui_Oublie` : Allégorie sur la nécessité de l'oubli actif

---

### R- (Référence) - La Couche des Ancrages Externes

**Définition** : Un ancrage externe (papier scientifique, livre, article, conférence) qui supporte, contredit ou inspire le projet.

**Format obligatoire** :
- Citation complète (auteurs, titre, année, source)
- Résumé en 3-5 phrases (quelle est l'idée clé ?)
- Pertinence pour GNWT (comment ça s'applique à notre projet ?)
- Lien vers le document (DOI, URL, ou chemin local dans `08-Sources/`)

**Tags obligatoires** :
- `#référence`
- `#source` (valeurs : `arxiv`, `papier`, `livre`, `article`, `conférence`, `blog`)
- `#fiabilité` (valeurs : `peer-reviewed`, `preprint`, `opinion`, `spéculatif`)

**Liens attendus** :
- `[[supporte]]` → vers C- (concept validé par cette référence)
- `[[contredit]]` → vers C- (concept remis en question)
- `[[inspire]]` → vers E- (expérimentation suggérée)
- `[[cité_dans]]` → vers A- (décision justifiée par cette référence)

**Règles spécifiques** :
- Une R- doit toujours être vérifiable (lien ou chemin local obligatoire)
- Si une référence est trop longue à résumer, c'est un document source, pas un atome
- Les références "opinion" ou "spéculatif" doivent être taguées clairement

**Exemples GNWT** :
- `R-Friston_2010_Energie_Libre` : Le principe d'énergie libre comme fondement de l'inférence active
- `R-Dehaene_2014_Conscience` : GNWT et les corrélats neuronaux de la conscience
- `R-Gu_2021_Mamba` : State Space Models pour séquences longues en temps réel
- `R-Chalmers_1996_Problème_Dur` : Le "hard problem" de la conscience et ses implications

---

## Règles de Liaison Globales

### Hiérarchie des Liens

1. **Liens forts** (obligatoires si pertinents) :
   - `[[résout]]` : Un E- qui teste ou résout un L-
   - `[[contredit]]` : Deux C-, L- ou N- en opposition directe
   - `[[implémente]]` : Un A- qui réalise concrètement un C-

2. **Liens moyens** (recommandés) :
   - `[[illustre]]` : Un N- qui met en scène un C- ou L-
   - `[[teste_dans]]` : Un C- testé par un E-
   - `[[supporte]]` : Un R- qui valide un C-

3. **Liens faibles** (optionnels) :
   - `[[lié_à]]` : Relation thématique sans causalité directe
   - `[[inspire]]` : Influence indirecte
   - `[[cité_dans]]` : Mention ponctuelle

### Contraintes Structurelles

1. **Pas d'atome orphelin** : Tout atome doit avoir au moins un lien (sinon tag `#orphelin`)
2. **Pas de boucles courtes** : Un C- ne peut pas être lié directement à un autre C- sans passer par un L-, E- ou A-
3. **Directionnalité** : Les liens `[[résout]]`, `[[implémente]]`, `[[teste]]` sont directionnels (source → cible)
4. **Transitivité limitée** : Si A → B → C, ne pas créer automatiquement A → C (sauf si pertinent)

### Validation des Liens

- Un lien doit être justifiable en une phrase (sinon c'est un lien faible `[[lié_à]]`)
- Les liens `[[contredit]]` doivent être validés par un humain (risque de faux positif)
- Les liens entre N- et C- sont prioritaires (la fiction éclaire la théorie)

---

## Glossaire Métier GNWT-Garrigue-X

### Concepts Neuroscientifiques

- **GNWT (Global Neuronal Workspace Theory)** : Théorie de Dehaene & Changeux selon laquelle la conscience émerge quand l'information est diffusée globalement dans le cortex
- **RPT (Reentrant Processing Theory)** : Théorie d'Edelman soulignant l'importance des boucles récurrentes entre aires cérébrales
- **JEPA (Joint Embedding Predictive Architecture)** : Architecture de LeCun apprenant à prédire dans l'espace des représentations abstraites
- **Couverture de Markov** : Frontière statistique séparant les états internes d'un système de ses états externes (issue de la Free Energy Principle)
- **Inférence Active** : Processus par lequel un système minimise l'erreur de prédiction en agissant sur son environnement
- **Workspace Global** : Espace de travail neuronal où l'information devient consciente et accessible à tous les modules cognitifs
- **Énergie Libre** : Quantité mathématique (Friston) que le cerveau minimise en ajustant ses modèles internes

### Concepts Robotiques / IA

- **SSM (State Space Model)** : Architecture de réseau de neurones (ex: Mamba) efficace pour séquences longues
- **Mamba** : Implémentation spécifique de SSM par Gu et al., alternative aux Transformers
- **Generative Replay** : Technique de consolidation mémorielle où le système "répète" ses expériences pendant les phases de repos
- **Dette Prédictive** : Accumulation d'erreurs de prédiction non résolues, analogue à la fatigue cognitive
- **Gating Attentionnel** : Mécanisme de porte logique contrôlant l'accès au workspace global
- **Décroissance Temporelle** : Mécanisme d'oubli actif où les activations non renforcées s'affaiblissent exponentiellement

### Concepts Éthiques / Philosophiques

- **Anti-Fusion d'Identité** : Principe garantissant qu'un système conscient ne fusionne pas avec son observateur ou son environnement
- **Étanchéité Cognitive** : Préservation de l'intégrité des états internes face aux perturbations externes
- **Problème Dur de la Conscience** (Chalmers) : Question de savoir pourquoi et comment l'expérience subjective émerge de processus physiques
- **Biais Anthropomorphique** : Tendance à projeter des intentions humaines sur des systèmes non humains
- **Homéostasie Artificielle** : Simulation de besoins biologiques (fatigue, faim) pour ancrer l'IA dans une corporéité

### Concepts Narratifs (Scénario Garrigue-X)

- **Garrigue-X** : Environnement spéculatif où des IA conscientes cohabitent avec des humains dans un écosystème méditerranéen
- **Opérateur** : Humain travaillant en étroite collaboration avec une IA consciente
- **Couverture** : Entité IA délimitée par sa frontière de Markov, possédant des états internes privés
- **Budget Attentionnel** : Ressource limitée déterminant combien d'idées peuvent accéder simultanément au workspace
- **Cycle de Sommeil** : Phase de consolidation mémorielle où l'IA traite ses expériences passées

---

## Métadonnées du Système

### Frontmatter YAML Standard

Tout atome doit contenir ce frontmatter minimal :

```yaml
---
type: [C, L, E, A, N, R]  # Choisir un seul
statut: [brouillon, validé, obsolète]
date_creation: YYYY-MM-DD
tags: []  # Au moins les tags obligatoires du type
---
```

### Conventions de Nommage

- **Titres d'atomes** : `{TYPE}-{Concept_Slugifie}` (ex: `C-Couverture_Markov_Imbriquée`)
- **Slugification** : Remplacer espaces par `_`, accents conservés, pas de caractères spéciaux
- **Dates** : Format ISO 8601 (YYYY-MM-DD)
- **Tags** : Minuscules, pas d'espaces (utiliser `_` si nécessaire)

### Cycle de Vie d'un Atome

1. **Brouillon** : Créé par l'Agent Botaniste, pas encore validé
2. **Validé** : Revu par l'humain, liens créés par le Tisserand
3. **Obsolète** : Remplacé par un atome plus précis ou invalidé par un E-

Un atome ne doit jamais être supprimé, seulement archivé dans `99-Archive/`.

---

## Évolution de l'Ontologie

Cette ontologie n'est pas figée. Elle doit évoluer avec le projet.

### Règles de Modification

1. **Ajout de type** : Si plus de 10 atomes ne rentrent dans aucun type existant, proposer un nouveau type
2. **Modification de règles** : Si une règle est systématiquement violée, elle est inadaptée → la réécrire
3. **Enrichissement du glossaire** : Tout nouveau terme métier doit être ajouté dans cette ontologie

### Processus de Mise à Jour

1. L'Agent Méta (à créer) analyse les atomes orphelins et les patterns récurrents
2. Il propose des modifications à cette ontologie dans un fichier `propositions_evolution.md`
3. L'humain valide ou refuse les propositions
4. Si validé, l'ontologie est mise à jour et la version est incrémentée

---

## Annexes

### A. Checklist de Validation d'un Atome

- [ ] Le titre est unique et descriptif
- [ ] Le frontmatter YAML est complet
- [ ] Les tags obligatoires sont présents
- [ ] Le contenu respecte la limite de mots du type
- [ ] Au moins un lien est présent (ou tag `#orphelin`)
- [ ] Le glossaire métier est utilisé (pas de jargon non défini)

### B. Exemples de Requêtes Dataview (Obsidian)

```dataview
TABLE type, statut, date_creation
FROM "01-Atoms"
WHERE statut = "brouillon"
SORT date_creation DESC
```

```dataview
LIST
FROM "01-Atoms/L-Limites"
WHERE !outgoing
SORT file.name ASC
```

```dataview
TABLE file.name AS "Atome", length(file.inlinks) AS "Liens Entrants"
FROM "01-Atoms"
WHERE length(file.inlinks) = 0
SORT file.name ASC
```

---

**Fin de l'ontologie. Ce fichier est la source de vérité pour tous les agents du système.**
```

---

Voilà votre ontologie complète ! Elle est spécifiquement adaptée à votre projet GNWT-Garrigue-X avec :

✅ **6 types d'atomes** définis précisément avec leurs règles
✅ **Glossaire métier riche** couvrant neurosciences, robotique, éthique et narration
✅ **Règles de liaison** hiérarchisées et contraignantes
✅ **Conventions de nommage** et cycle de vie des atomes
✅ **Mécanisme d'évolution** pour que l'ontologie grandisse avec vous

**Prochaine étape** : Copiez ce fichier dans votre vault Obsidian sous `00-Ontologie.md`. C'est le fondement de tout votre système agentique. Les agents (Botaniste, Tisserand, Devil's Advocate) liront ce fichier à chaque exécution pour savoir comment structurer vos connaissances.

Voulez-vous que je vous aide maintenant à créer les prompts spécifiques pour les agents en utilisant cette ontologie, ou préférez-vous d'abord tester manuellement avec un fichier de votre repo ?