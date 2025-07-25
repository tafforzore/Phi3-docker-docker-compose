
# 🚀 Déploiement de l'API Ollama avec Docker – Modèle Phi-3

Bienvenue dans la documentation de déploiement et d’utilisation de l’API **Ollama**, conçue pour interagir avec des modèles LLM tels que **Phi-3**, **LLaMA2**, **Mistral**, etc. Ce guide vous permet de lancer rapidement une instance locale avec Docker, et d'exploiter les routes REST pour la génération de texte, les conversations type ChatGPT et le contrôle serveur.

> 🔗 Dépôt GitHub : [https://github.com/tafforzore/Phi3-docker-docker-compose](https://github.com/tafforzore/Phi3-docker-docker-compose)  
> 📍 Serveur par défaut : `http://localhost:11434`

---

## 🐳 Déploiement avec Docker

```bash
git clone https://github.com/tafforzore/Phi3-docker-docker-compose.git
cd Phi3-docker-docker-compose
docker compose up -d
```

---

## 📘 API REST – Routes disponibles

### 🔎 `POST /api/generate` – Génération de texte

Crée une complétion à partir d’un prompt donné.

#### Payload

```json
{
  "model": "phi3",
  "prompt": "Explique la gravitation universelle.",
  "stream": false,
  "system": "Tu es un professeur de physique.",
  "template": "",
  "options": {
    "temperature": 0.7,
    "top_p": 0.9,
    "top_k": 40,
    "repeat_penalty": 1.1,
    "seed": 42,
    "num_predict": 200
  }
}
```

#### Exemple de réponse

```json
{
  "model": "phi3",
  "created_at": "2025-07-17T10:21:42.437Z",
  "response": "La gravitation est la force qui attire deux objets possédant une masse...",
  "done": true
}
```

---

### 🤖 `POST /api/chat` – Interaction type ChatGPT

Dialogue avec un modèle LLM en conservant un historique.

#### Payload

```json
{
  "model": "phi3",
  "messages": [
    {"role": "system", "content": "Tu es un assistant médical."},
    {"role": "user", "content": "Quels sont les symptômes du paludisme ?"}
  ]
}
```

#### Exemple de réponse

```json
{
  "message": {
    "role": "assistant",
    "content": "Les symptômes du paludisme sont : fièvre, frissons, maux de tête..."
  },
  "done": true
}
```

---

### ♥️ `GET /` – Ping du serveur

Pour tester si le serveur est bien lancé.

```json
{"status": "ok"}
```

---

## ⚙️ Détails techniques

- Serveur sur `http://localhost:11434`
- Format : `application/json`
- Modèles supportés : `phi3`, `llama2`, `mistral`, etc.
- Possibilité d’activer le **streaming** (`stream: true`)
- Pas d’authentification par défaut ➜ ⚠️ Utiliser un proxy ou un VPN

---

## 📚 Ressources complémentaires

- 🌍 [Site officiel d’Ollama](https://ollama.com)
- 📦 [Bibliothèque de modèles](https://ollama.com/library)
- 💻 [Code source client GitHub](https://github.com/ollama/ollama)

---

## ✨ Bonus : Swagger ou Postman

Tu peux me demander une version OpenAPI 3.0 (Swagger JSON) pour une intégration rapide dans **Swagger UI** ou **Postman**.

---

## 🔍 Optimisation SEO

Ce projet répond à la recherche :  
**"Déploiement de Phi3 avec Docker"**  
**"API Ollama modèle Phi-3"**  
**"Exemple de chat LLM local avec Docker"**

---

👨‍💻 *Maintenu par [@tafforzore](https://github.com/tafforzore)*  
🛠️ *Améliorations et contributions bienvenues !*
