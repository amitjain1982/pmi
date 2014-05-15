<html>
<head>
    <title>Login</title>

</head>

<body>

<oauth:connect provider="google" id="google-connect-link">Login with google</oauth:connect>

Logged with google? <s2o:ifLoggedInWith provider="google">yes</s2o:ifLoggedInWith> <s2o:ifNotLoggedInWith
        provider="google">no</s2o:ifNotLoggedInWith>

</body>
</html>
