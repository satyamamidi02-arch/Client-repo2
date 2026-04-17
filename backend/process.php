<?php
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Get form values
    $username = trim($_POST["username"] ?? "");
    $password = trim($_POST["password"] ?? "");

    // Validation
    if (empty($username)) {
        echo "Username is required.";
        exit;
    }

    if (empty($password)) {
        echo "Password is required.";
        exit;
    }

    if (strlen($password) < 6) {
        echo "Password must be at least 6 characters.";
        exit;
    }

    /*
      ✅ Demo authentication (NO database)
      In real applications, use database + password_hash()
    */
    if ($username === "admin" && $password === "admin123") {
        echo "Login successful!";
    } else {
        echo "Invalid username or password.";
    }
}
?>