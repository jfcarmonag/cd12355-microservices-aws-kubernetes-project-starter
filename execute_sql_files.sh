#!/bin/bash

# Retrieve the password
export POSTGRES_PASSWORD=$(kubectl get secret --namespace default postgres-postgresql -o jsonpath="{.data.postgresql-password}" | base64 -d)

# First, set up port forwarding
kubectl port-forward --namespace default svc/postgres-postgresql 5432:5432 &

# Give some time for the port forwarding to establish
sleep 5

# Iterate over the SQL files in the db folder and execute each one
for file in db/*.sql; do
    echo "Executing SQL file: $file"
    PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U postgres -d postgres -p 5432 < "$file"
done

# Terminate the port forwarding process
kill %1
