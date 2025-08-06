#!/bin/bash

# Config
USER="admin_user"
PASS="admin_pass"
HOST="127.0.0.1"
PORT="4001"
DURATION=10
CLIENTS=50

# Generate temp DB name
DB="simple_db"

# Export env vars for psql tools
export PGPASSWORD="$PASS"
export PGUSER="$USER"
export PGHOST="$HOST"
export PGPORT="$PORT"
export PGSSLMODE=disable

echo "[+] Initializing pgbench schema..."
pgbench -i "$DB"

echo "[+] Running benchmark..."
pgbench -T "$DURATION" -c "$CLIENTS" "$DB"

echo "[+] Done."

# ❯ sh test_quic.sh
# [+] Initializing pgbench schema...
# dropping old tables...
# creating tables...
# generating data (client-side)...
# vacuuming...
# creating primary keys...
# done in 0.16 s (drop tables 0.04 s, create tables 0.01 s, client-side generate 0.06 s, vacuum 0.03 s, primary keys 0.03 s).
# [+] Running benchmark...
# pgbench (17.5)
# starting vacuum...end.
# transaction type: <builtin: TPC-B (sort of)>
# scaling factor: 1
# query mode: simple
# number of clients: 50
# number of threads: 1
# maximum number of tries: 1
# duration: 10 s
# number of transactions actually processed: 8851
# number of failed transactions: 0 (0.000%)
# latency average = 56.694 ms
# initial connection time = 17.953 ms
# tps = 881.921730 (without initial connection time)
# [+] Done.
