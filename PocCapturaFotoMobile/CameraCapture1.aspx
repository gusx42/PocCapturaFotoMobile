<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CameraCapture1.aspx.vb" Inherits="PocCapturaFotoMobile.CameraCapture1" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Camera API</title>
        <link rel="stylesheet" href="Content/bootstrap.min.css" type="text/css" media="screen">
        
        <style>
            
            .image {
                width: 400px;
                height: 600px;
            }
            
        </style>

    </head>

    <body class="well">

        <div class="container">
            <h1>Usando camera API</h1>

            <section class="main-content">
                <p>Esta demostração utiliza firefox camera API para obter acesso a camera do celular</p>
                
                <p>
                    <input class="image" type="file" id="take-picture" accept="image/*">
                </p>

                <h2>Preview:</h2>
                <p>
                    <img src="about:blank" alt="" id="show-picture">
                </p>

                <p id="error"></p>

            </section>
        </div>


        <script src="Scripts/base.js"></script>


    </body>
</html>


