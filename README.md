cd d:\Prapti\VectorDB

// only if necessary
$env:PATH = "C:\msys64\ucrt64\bin;" + $env:PATH

g++ -std=c++17 -O2 main.cpp -o db.exe -lws2_32
.\db.exe


=== VectorDB Engine ===
Port: 8080
20 demo vectors | 16 dims | HNSW+KD-Tree+BruteForce
Ollama: OFFLINE
Starting HTTP server on port 8080 ...


http://localhost:8080
