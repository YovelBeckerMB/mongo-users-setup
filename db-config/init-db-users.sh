#!/bin/sh
set -e

mongo <<EOF
use admin

db.createUser(
  {
    user: "$DB_ADMIN_USERNAME",
    pwd: "$DB_ADMIN_PASS",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" }, "readWriteAnyDatabase" ]
  }
)
EOF

mongo --port 27017  --authenticationDatabase "admin" -u "$DB_ADMIN_USERNAME" -p "$DB_ADMIN_PASS" <<EOF
use $DB_NAME
db.createUser(
  {
    user: "$DB_USERNAME",
    pwd:  "$DB_PASS",
    roles: [ { role: "readWrite", db: "$DB_NAME" }]
  }
)
EOF