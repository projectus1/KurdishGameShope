$(document).ready(function() {
    // Login button click handler
    $("#loginBtn").click(function() {
        var email = $("#loginEmail").val().trim();
        var password = $("#loginPassword").val().trim();

        // Clear previous messages
        $("#loginSuccess").hide();
        $("#loginError").hide().html("");

        // Validate inputs
        if (email === "" || password === "") {
            $("#loginError").show();
            $("#loginError").html("Please enter both email and password.");
            return;
        }

        $.post("SignIn.php", { email: email, password: password }, function(data) {
            if (data === "success") {
                $("#loginSuccess").show();
                setTimeout(function() {
                    window.location.href = "GameStore1.html";
                }, 2000);
            } else {
                $("#loginError").show();
                $("#loginError").html(data);
            }
        });
    });

    // Register button click handler
    $("#registerBtn").click(function() {
        var name = $("#registerName").val().trim();
        var email = $("#registerEmail").val().trim();
        var password = $("#registerPassword").val().trim();

        // Clear previous messages
        $("#registerSuccess").hide();
        $("#registerError").hide().html("");

        // Validate inputs
        if (name === "" || email === "" || password === "") {
            $("#registerError").show();
            $("#registerError").html("Please fill in all the fields.");
            return;
        }

        $.post("SignUp.php", { name: name, email: email, password: password }, function(data) {
            if (data === "success") {
                $("#registerSuccess").show();
                setTimeout(function() {
                    window.location.href = "dashboard.php";
                }, 2000);
            } else {
                $("#registerError").show();
                $("#registerError").html(data);
            }
        });
    });
});
