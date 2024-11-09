const express = require('express');
const router = express.Router();
const userService = require('../services/userService');

router.get('/:role', async (req, res) => {
  // Parse the role as an integer
  const role = parseInt(req.params.role, 10); 

  // Validate that the role is a valid integer
  if (isNaN(role)) {
    return res.status(400).send('Invalid role parameter'); // Handle invalid input
  }

  try {
    const users = await userService.getUsersWithRole(role);
    res.json(users);
  } catch (error) {
    console.error(`Error retrieving users with role ${role}:`, error);
    res.status(500).send(`Error retrieving users with role ${role}`);
  }
});

module.exports = router;
