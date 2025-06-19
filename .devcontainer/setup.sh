#!/bin/bash
set -e

echo "🚀 Setting up Doc Analysis environment..."

# Install Python dependencies
echo "📦 Installing Python packages..."
pip install -r requirements.txt

# Install Ollama
echo "🦙 Installing Ollama..."
curl -fsSL https://ollama.ai/install.sh | sh

# Start Ollama service in background
echo "🔧 Starting Ollama service..."
ollama serve &
sleep 10

# Download required models
echo "📥 Downloading embedding models..."
python download_hf_bbg.py

echo "📥 Downloading Ollama models..."
ollama pull nomic-embed-text
ollama pull llama3  # Main LLM used by the app

echo "✅ Setup complete! You can now run: streamlit run app.py"