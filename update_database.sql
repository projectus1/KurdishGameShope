-- Update the users table to include first_name, last_name, and location
ALTER TABLE users ADD COLUMN first_name VARCHAR(255) NOT NULL;
ALTER TABLE users ADD COLUMN last_name VARCHAR(255) NOT NULL;
ALTER TABLE users ADD COLUMN location VARCHAR(255) NOT NULL;
