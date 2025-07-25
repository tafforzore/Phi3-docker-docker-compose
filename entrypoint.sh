#!/bin/bash
export OLLAMA_HOST=http://0.0.0.0:11434

# Démarrer le serveur Ollama en arrière-plan temporairement
ollama serve &

# Attendre que le serveur soit prêt
until curl -s http://localhost:11434 > /dev/null; do
  echo "⌛ En attente de Ollama..."
  sleep 1
done

# Vérifier si le modèle est déjà présent
if ! ollama list | grep -q "phi3"; then
  echo "📥 Téléchargement du modèle phi3..."
  ollama pull phi3
else
  echo "✅ Modèle phi3 déjà présent, pas de téléchargement."
fi

# Arrêter proprement l'instance en arrière-plan (optionnel, selon comportement d’Ollama)
kill $(pgrep ollama)

# Lancer Ollama au premier plan (bloquant)
exec ollama serve
