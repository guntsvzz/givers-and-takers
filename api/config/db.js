const { Pool } = require('pg');

const pool = new Pool({
  user: 'admin',              // PostgreSQL username
  host: 'localhost',           // PostgreSQL host
  database: 'gnt_development',       // PostgreSQL database name
  password: 'password',        // PostgreSQL password
  port: 5432,                  // PostgreSQL port in Docker
});

module.exports = pool;
