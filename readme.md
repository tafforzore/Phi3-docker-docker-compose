# 📘 README – API REST d’Ollama (Swagger-Style)

Cette documentation couvre toutes les routes REST exposées par Ollama, utilisables pour gérer, générer, chatter ou analyser des modèles LLM comme Phi-3.

> ⚠️ L’API d’Ollama fonctionne sur `http://localhost:11434` par défaut.

---

## 🔎 Génération de texte

### `POST /api/generate`

Génère une complétion texte simple depuis un prompt.

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

#### Réponse

```json
{
  "model": "phi3",
  "created_at": "2025-07-17T10:21:42.437Z",
  "response": "La gravitation est...",
  "done": true
}
```

---

## 🤖 Chat conversationnel

### `POST /api/chat`

Interaction de type ChatGPT avec mémoire.

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

#### Réponse

```json
{
  "message": {"role": "assistant", "content": "Les symptômes du paludisme sont..."},
  "done": true
}
```

---

## ♥️ Contrôle de santé du serveur

### `GET /`

Simple ping pour vérifier que le serveur est actif.

#### Réponse typique

```json
{"status": "ok"}
```

---

## 🌐 Autres options de déploiement

* Le serveur tourne sur `http://localhost:11434`
* Toutes les routes acceptent et renvoient du `application/json`
* Les appels `POST` peuvent être `stream: true` ou `false`
* Utilise les modèles comme : `phi3`, `llama2`, `mistral`, etc

---

## ⚠️ Avertissements

* Aucune authentification par défaut
* À protéger derrière un reverse proxy avec auth ou un VPN
* Modèles lourds, attention à la RAM

---

## 📚 Liens utiles

* Site officiel : [https://ollama.com](https://ollama.com)
* Modèles disponibles : [https://ollama.com/library](https://ollama.com/library)
* Code source client : [https://github.com/ollama/ollama](https://github.com/ollama/ollama)

---

Si tu veux une version Swagger JSON/OpenAPI 3.0 à importer dans Postman ou Swagger UI, je peux te la générer à part ❤️
