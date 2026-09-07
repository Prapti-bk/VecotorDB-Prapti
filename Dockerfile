# ── Stage 1: Build ────────────────────────────────────────────────────
FROM gcc:13-bookworm AS builder

WORKDIR /app

# Copy source files
COPY main.cpp .
COPY httplib.h .

# Compile — no -lws2_32 on Linux
RUN g++ -std=c++17 -O2 -o vectordb main.cpp -lpthread

# ── Stage 2: Run ───────────────────────────────────────────────────────
# Use the same base as builder so libstdc++ versions match
FROM gcc:13-bookworm

WORKDIR /app

# Copy compiled binary and frontend
COPY --from=builder /app/vectordb .
COPY index.html .

EXPOSE 8080

CMD ["./vectordb"]
