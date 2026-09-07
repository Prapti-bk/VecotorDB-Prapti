# ── Stage 1: Build ────────────────────────────────────────────────────
FROM gcc:13-bookworm AS builder

WORKDIR /app

COPY main.cpp .
COPY httplib.h .

# Static link libstdc++ and libgcc so the binary is fully self-contained
# No runtime library version mismatches possible
RUN g++ -std=c++17 -O2 \
    -static-libstdc++ -static-libgcc \
    -o vectordb main.cpp -lpthread

# ── Stage 2: Run ───────────────────────────────────────────────────────
FROM debian:bookworm-slim

WORKDIR /app

COPY --from=builder /app/vectordb .
COPY index.html .

EXPOSE 8080

CMD ["./vectordb"]
