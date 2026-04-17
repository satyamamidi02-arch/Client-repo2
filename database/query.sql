CREATE TABLE users (
    user_id         BIGSERIAL PRIMARY KEY,
    
    username        VARCHAR(50) NOT NULL UNIQUE,
    password_hash   TEXT NOT NULL,

    is_active       BOOLEAN DEFAULT TRUE,

    created_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_login      TIMESTAMP WITH TIME ZONE
);
``

-- Automatically created by UNIQUE constraint, but shown for clarity
CREATE UNIQUE INDEX idx_users_username
ON users (username);


INSERT INTO users (username, password_hash)
VALUES (
    'admin',
    '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.ogSBs3rLT5J5HG4G'
);
``

password_hash("admin123", PASSWORD_DEFAULT);

SELECT user_id, password_hash, is_active
FROM users
WHERE username = $1;

if ($user && password_verify($password, $user['password_hash'])) {
    // login success
}


ALTER TABLE users
ADD COLUMN failed_attempts INT DEFAULT 0,
ADD COLUMN locked_until TIMESTAMP WITH TIME ZONE;


ALTER TABLE users
ADD COLUMN email VARCHAR(255) UNIQUE;


CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

ALTER TABLE users
ADD COLUMN role_id INT REFERENCES roles(role_id);



