const express = require('express');
const cors = require('cors');
const userRoutes = require('./routes/userRoutes');

const app = express();
const port = 3500;

app.use(cors({
  origin: 'http://localhost:4200',
}));

app.use(express.json());

// Use the user routes
app.use('/user', userRoutes);

// Define a simple root route
app.get('/', (req, res) => {
  res.send('Hello, Express with PostgreSQL!');
});

// Start the server
app.listen(port, () => {
  console.log(`Express app listening at http://localhost:${port}`);
});

const pool = require('./config/db');

// Test PostgreSQL connection
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('Error connecting to PostgreSQL:', err);
  } else {
    console.log('PostgreSQL connected:', res.rows);
  }
});
