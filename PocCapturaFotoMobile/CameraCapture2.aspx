<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CameraCapture2.aspx.vb" Inherits="PocCapturaFotoMobile.CameraCapture2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body class="well">
    <form id="form1" class="well" runat="server">
    <div style="text-align: center;">
           <video id="video" width="640" height="480" autoplay></video>
            <button class="btn" id="snap" onclick="return false;">Tirar Foto</button>
            <canvas id="canvas" width="640" height="480"></canvas>
            
    </div>
    <div>
        <asp:Button ID="btnTo64" ClientIDMode="Static" CssClass="btn" runat="server" /> 
        <asp:TextBox ID="txtBase64" ClientIDMode="Static" runat="server" />
        <div id="canvasHolder"></div>
    </div>
    </form>
</body>
</html>

<script>

    window.document.onload(function () {
        document.getElementById("btnTo64").addEventListener("click", function () {

            captureImage();
        });
    });
    // Put event listeners into place
    window.addEventListener("DOMContentLoaded", function () {
        // Grab elements, create settings, etc.
        var canvas = document.getElementById("canvas"),
            context = canvas.getContext("2d"),
            video = document.getElementById("video"),
            videoObj = { "video": true },
            errBack = function (error) {
                console.log("Video capture error: ", error.code);
            };

        // Put video listeners into place
        if (navigator.getUserMedia) { // Standard
            navigator.getUserMedia(videoObj, function (stream) {
                video.src = stream;
                video.play();
            }, errBack);
        } else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
            navigator.webkitGetUserMedia(videoObj, function (stream) {
                video.src = window.webkitURL.createObjectURL(stream);
                video.play();
            }, errBack);
        }

        // Trigger photo take
        document.getElementById("snap").addEventListener("click", function () {
            context.drawImage(video, 0, 0, 640, 480);
        });
    }, false);

    function captureImage() {
        var canvas = document.createElement('canvas');
        canvas.id = 'hiddenCanvas';
        //add canvas to the body element
        document.body.appendChild(canvas);
        //add canvas to #canvasHolder
        document.getElementById('canvasHolder').appendChild(canvas);
        var ctx = canvas.getContext('2d');
        canvas.width = video.videoWidth / 4;
        canvas.height = video.videoHeight / 4;
        ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
        //save canvas image as data url
        dataURL = canvas.toDataURL();
        //set preview image src to dataURL
        document.getElementById('preview').src = dataURL;
        // place the image value in the text box
        document.getElementById('txtBase64').value = dataURL;
    };

</script>

