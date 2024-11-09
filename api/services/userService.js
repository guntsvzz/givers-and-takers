const userModel = require('../models/userModel');

const getUsersWithRole = async (role) => {
  try {
    const users = await userModel.getUsersByRole(role);
    console.log("Data received in service:", users); // Log the data here
    return users;
  } catch (error) {
    console.error(`Error fetching users with role ${role}:`, error);  // Log the actual error for debugging
    throw new Error(`Error fetching users with role${role}:`)
  }
};

module.exports = {
  getUsersWithRole,
};
