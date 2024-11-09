const pool = require('../config/db');

const getUsersByRole = async (role) => {
  try {
    const query = 'SELECT * FROM users WHERE role = $1';
    const values = [role];
    const result = await pool.query(query, values);
    console.log("Query result from database:", result.rows); // Log the result for debugging
    return result.rows;
  } catch (error) {
    console.error('Error executing query:', error);
    throw error;
  }
};

module.exports = {
  getUsersByRole,
};
