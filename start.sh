#!/bin/bash

echo "============================================================"
echo "🌙 Midnight PQC DApp - FIXED VERSION - Quick Start"
echo "============================================================"
echo ""
echo "All Issues Fixed:"
echo "  ✓ Issue #1: Individual credential sync to Cardano"
echo "  ✓ Issue #2: One vote per user ID enforcement"
echo "  ✓ Issue #3: Document decryption with access requests"
echo "  ✓ Issue #4: Unified theme for all 3 requirements"
echo ""
echo "============================================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

echo "✓ Python 3 found: $(python3 --version)"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
pip install -r requirements.txt --break-system-packages 2>/dev/null || pip install -r requirements.txt

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo "✓ Dependencies installed successfully"
echo ""

# Check if fixed backend exists
if [ -f "midnight-pqc-backend-fixed.py" ]; then
    BACKEND_FILE="midnight-pqc-backend-fixed.py"
    echo "✓ Using FIXED backend: $BACKEND_FILE"
elif [ -f "midnight-pqc-backend.py" ]; then
    BACKEND_FILE="midnight-pqc-backend.py"
    echo "⚠️  Using original backend (not fixed): $BACKEND_FILE"
    echo "   For all fixes, use: midnight-pqc-backend-fixed.py"
else
    echo "❌ Backend file not found!"
    exit 1
fi

echo ""
echo "🚀 Starting Midnight PQC DApp server..."
echo ""
echo "============================================================"
echo "Server will be available at: http://localhost:5000"
echo "Press Ctrl+C to stop the server"
echo "============================================================"
echo ""

python3 $BACKEND_FILE
