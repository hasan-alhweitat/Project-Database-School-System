<!DOCTYPE html>
<html lang = "en-US">
    <head>
        <meta charset = "UTF-8">
        <title>TeachLogIn.html</title>
        <link rel = "stylesheet" type = "text/css" href = "./css/login.css"/>
    </head>
   
   <body>
        <h2> School System </h2>
        <div class="container" id="container">
			<br>
            <div class="form-container sign-in-container">
                <form action="./php/validate_login.php"  method="POST">
                    <h1> Sign in </h1>
                    <br>
                    <span> use your account </span>
                    <input name = "email" type="email" placeholder="Email" />
                    <a href="#"> Forgot your Email? </a>
                    <button type="submit">Sign In</button> 
                </form>
            </div>

        </div>

        <footer>
            <p> Created <i class="fa fa-heart"></i> by Hasan Al-hwietat </p>
        </footer>

    </body>
</html>